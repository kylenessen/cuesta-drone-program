#!/usr/bin/env python3
"""
Scrape Cuesta College certificate programs from the main degrees/certificates
page and the curriqunet detail pages.

Outputs a JSON data file and a Typst summary report.
"""

import json
import re
import sys
import time

import requests
from bs4 import BeautifulSoup

UA = (
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 "
    "(KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
)
HEADERS = {"User-Agent": UA}

MAIN_URL = "https://www.cuesta.edu/academics/areas-of-study/all-degrees-certificates.html"
CURRIQUNET_BASE = "https://cuesta.curriqunet.com/DynamicReports/AllFieldsReportByEntity/"


def fetch(url, retries=3, delay=2):
    for attempt in range(retries):
        try:
            resp = requests.get(url, headers=HEADERS, timeout=30)
            resp.raise_for_status()
            return resp.text
        except requests.RequestException as e:
            if attempt < retries - 1:
                print(f"  Retry {attempt + 1} for {url}: {e}", file=sys.stderr)
                time.sleep(delay * (attempt + 1))
            else:
                print(f"  FAILED {url}: {e}", file=sys.stderr)
                return None


def parse_main_page(html):
    """Extract all programs from the main listing page."""
    soup = BeautifulSoup(html, "lxml")
    programs = []

    for h2 in soup.find_all("h2", class_="accordion-header"):
        button = h2.find("button")
        if not button:
            continue

        full_name = button.get_text(strip=True)

        # Parse name and type: "Accounting Clerk, Certificate of Achievement"
        # Some have multiple commas, so split on last occurrence of cert type
        cert_types = [
            "Certificate of Achievement",
            "Certificate of Completion",
            "Certificate of Specialization",
            "Associate in Arts for Transfer",
            "Associate in Arts",
            "Associate in Science for Transfer",
            "Associate in Science",
        ]

        program_name = full_name
        program_type = "Unknown"
        for ct in cert_types:
            if ct in full_name:
                program_type = ct
                program_name = full_name.replace(", " + ct, "").strip()
                break

        # Find the accordion body for this header
        target_id = h2.get("id", "") + "X"
        accordion_body = soup.find(id=target_id)

        curriqunet_url = None
        flowchart_url = None
        if accordion_body:
            for a in accordion_body.find_all("a", href=True):
                href = a["href"]
                if "curriqunet.com" in href:
                    curriqunet_url = href.replace("&amp;", "&")
                elif "programmap.cuesta.edu" in href:
                    flowchart_url = href

        programs.append({
            "name": program_name,
            "type": program_type,
            "full_name": full_name,
            "curriqunet_url": curriqunet_url,
            "flowchart_url": flowchart_url,
        })

    return programs


def parse_curriqunet_page(html):
    """Extract course requirements from a curriqunet program summary page."""
    soup = BeautifulSoup(html, "lxml")
    result = {
        "description": "",
        "catalog_years": "",
        "blocks": [],
        "courses": [],
        "total_units": None,
        "outcomes": [],
    }

    # Description
    desc_div = soup.find("div", class_="rich-text-editor")
    if desc_div:
        result["description"] = desc_div.get_text(strip=True)

    # Catalog year
    cat_year = soup.find("div", class_="querytext-result-row")
    if cat_year:
        result["catalog_years"] = cat_year.get_text(strip=True)

    # Course blocks (Required Courses, Electives, etc.)
    for block in soup.find_all("div", class_="course-block"):
        block_title_el = block.find("div", class_="block-title-row-core")
        if not block_title_el:
            continue

        left = block_title_el.find("div", class_="left-column")
        right = block_title_el.find("div", class_="right-column")

        block_name = left.get_text(strip=True) if left else ""
        block_units_el = block.find("span", class_="block-units-display")
        block_units = block_units_el.get_text(strip=True) if block_units_el else ""

        block_info = {
            "name": block_name,
            "units": block_units,
            "courses": [],
        }

        for entry in block.find_all("div", class_="course-entry"):
            subj_el = entry.find("span", class_="course-entry-subject")
            num_el = entry.find("span", class_="course-entry-course-number")
            title_el = entry.find("span", class_="course-entry-title")
            units_el = entry.find("span", class_="block-entry-units-display")

            # Check for "or" conditions
            condition = entry.find("div", class_="condition-output")
            condition_text = condition.get_text(strip=True) if condition else ""

            course = {
                "subject": subj_el.get_text(strip=True) if subj_el else "",
                "number": num_el.get_text(strip=True) if num_el else "",
                "title": title_el.get_text(strip=True) if title_el else "",
                "units": units_el.get_text(strip=True) if units_el else "",
                "condition": condition_text,
            }

            if course["subject"] or course["title"]:
                block_info["courses"].append(course)
                result["courses"].append(course)

        result["blocks"].append(block_info)

    # Total units
    grand_total = soup.find("span", class_="grand-total-units-display")
    if grand_total:
        result["total_units"] = grand_total.get_text(strip=True)

    # Outcomes
    for outcome_field in soup.find_all("div", attrs={"data-field-type": "Textarea"}):
        label = outcome_field.find("label")
        value = outcome_field.find("div", class_="field-value")
        if label and value and "Outcome" in label.get_text():
            result["outcomes"].append(value.get_text(strip=True))

    return result


def main():
    print("Fetching main page...")
    html = fetch(MAIN_URL)
    if not html:
        print("Failed to fetch main page", file=sys.stderr)
        sys.exit(1)

    programs = parse_main_page(html)
    print(f"Found {len(programs)} total programs")

    # Filter certificates only
    cert_types = [
        "Certificate of Achievement",
        "Certificate of Completion",
        "Certificate of Specialization",
    ]
    certificates = [p for p in programs if p["type"] in cert_types]
    print(f"Found {len(certificates)} certificate programs")

    # Also keep degree info for context
    degrees = [p for p in programs if p["type"] not in cert_types]
    print(f"Found {len(degrees)} degree programs")

    # Scrape each certificate's curriqunet page
    for i, cert in enumerate(certificates):
        url = cert.get("curriqunet_url")
        if not url:
            print(f"  [{i+1}/{len(certificates)}] {cert['name']} -- no curriqunet URL")
            continue

        print(f"  [{i+1}/{len(certificates)}] {cert['name']}...")
        html = fetch(url)
        if html:
            detail = parse_curriqunet_page(html)
            cert["detail"] = detail
        else:
            cert["detail"] = None

        # Be polite
        time.sleep(0.5)

    # Save raw data
    output = {
        "certificates": certificates,
        "degree_count": len(degrees),
        "degree_names": [d["full_name"] for d in degrees],
    }

    with open("research/cuesta-certificates-data.json", "w") as f:
        json.dump(output, f, indent=2)

    print(f"\nData saved to research/cuesta-certificates-data.json")

    # Generate summary stats
    generate_summary(certificates, degrees)


def generate_summary(certificates, degrees):
    """Print summary statistics and generate Typst report."""

    # Compute stats
    by_type = {}
    unit_values = []
    course_counts = []
    all_subjects = {}

    for cert in certificates:
        ct = cert["type"]
        by_type.setdefault(ct, []).append(cert)

        detail = cert.get("detail")
        if not detail:
            continue

        total = detail.get("total_units")
        if total:
            try:
                val = float(total)
                unit_values.append((cert["name"], cert["type"], val))
            except ValueError:
                pass

        num_courses = len(detail.get("courses", []))
        if num_courses > 0:
            course_counts.append((cert["name"], cert["type"], num_courses))

        for c in detail.get("courses", []):
            subj = c.get("subject", "")
            if subj:
                all_subjects[subj] = all_subjects.get(subj, 0) + 1

    print("\n" + "=" * 70)
    print("CUESTA COLLEGE CERTIFICATE LANDSCAPE SUMMARY")
    print("=" * 70)

    print(f"\nTotal certificate programs: {len(certificates)}")
    for ct, progs in sorted(by_type.items()):
        print(f"  {ct}: {len(progs)}")

    print(f"\nTotal degree programs (for context): {len(degrees)}")

    if unit_values:
        units_only = [u for _, _, u in unit_values]
        # Separate credit vs noncredit (noncredit tends to have very high "hours")
        credit_units = [u for u in units_only if u <= 60]
        noncredit_units = [u for u in units_only if u > 60]

        if credit_units:
            print(f"\nCredit certificate units (n={len(credit_units)}):")
            print(f"  Min:    {min(credit_units):.1f}")
            print(f"  Max:    {max(credit_units):.1f}")
            print(f"  Mean:   {sum(credit_units)/len(credit_units):.1f}")
            sorted_units = sorted(credit_units)
            mid = len(sorted_units) // 2
            median = sorted_units[mid] if len(sorted_units) % 2 else (sorted_units[mid-1] + sorted_units[mid]) / 2
            print(f"  Median: {median:.1f}")

        if noncredit_units:
            print(f"\nNoncredit certificate hours (n={len(noncredit_units)}):")
            print(f"  Min:  {min(noncredit_units):.1f}")
            print(f"  Max:  {max(noncredit_units):.1f}")

    if course_counts:
        counts_only = [c for _, _, c in course_counts]
        print(f"\nCourses per certificate (n={len(counts_only)}):")
        print(f"  Min:    {min(counts_only)}")
        print(f"  Max:    {max(counts_only)}")
        print(f"  Mean:   {sum(counts_only)/len(counts_only):.1f}")
        sorted_counts = sorted(counts_only)
        mid = len(sorted_counts) // 2
        median = sorted_counts[mid] if len(sorted_counts) % 2 else (sorted_counts[mid-1] + sorted_counts[mid]) / 2
        print(f"  Median: {median:.0f}")

    # Distribution buckets for units
    if credit_units:
        buckets = {"0-6": 0, "7-12": 0, "13-18": 0, "19-24": 0, "25-30": 0, "31+": 0}
        for u in credit_units:
            if u <= 6:
                buckets["0-6"] += 1
            elif u <= 12:
                buckets["7-12"] += 1
            elif u <= 18:
                buckets["13-18"] += 1
            elif u <= 24:
                buckets["19-24"] += 1
            elif u <= 30:
                buckets["25-30"] += 1
            else:
                buckets["31+"] += 1

        print(f"\nUnit distribution (credit certificates):")
        for bucket, count in buckets.items():
            bar = "#" * count
            print(f"  {bucket:>5} units: {bar} ({count})")

    # Top subjects
    if all_subjects:
        sorted_subjects = sorted(all_subjects.items(), key=lambda x: -x[1])[:20]
        print(f"\nTop 20 subject prefixes across all certificates:")
        for subj, count in sorted_subjects:
            print(f"  {subj:>6}: {count} course slots")

    # Smallest and largest
    if unit_values:
        credit_certs = [(n, t, u) for n, t, u in unit_values if u <= 60]
        if credit_certs:
            print(f"\nSmallest certificates (by units):")
            for name, ctype, units in sorted(credit_certs, key=lambda x: x[2])[:10]:
                print(f"  {units:5.1f} units -- {name} ({ctype})")

            print(f"\nLargest certificates (by units):")
            for name, ctype, units in sorted(credit_certs, key=lambda x: -x[2])[:10]:
                print(f"  {units:5.1f} units -- {name} ({ctype})")


if __name__ == "__main__":
    main()
