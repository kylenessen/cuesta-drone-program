# Log

Newest first. One entry per change set: what changed and why.

## 2026-07-03

- Expanded [Certificate of Waiver](/regulations/certificate-of-waiver.md) with a current Part 107 waiver table, Aviation Safety Hub application workflow, 90-day review expectation, request-for-information handling, and safety-case guidance.
- Preserved new source anchors in `sources/`: [FAA Part 107 Waivers](/sources/faa-part-107-waivers.md), [Request and Manage a Part 107 Operational Waiver](/sources/ashub-waiver-instructions.md), [14 CFR 107.200](/sources/govinfo-14-cfr-107-200.md), and [14 CFR 107.205](/sources/govinfo-14-cfr-107-205.md).
- Rationale: waiver process details changed after AC 107-2A, so the curriculum wiki now separates the older advisory-circular context from the current FAA application process.

## 2026-07-02

- Initialized the wiki under the llm-wiki skill: created `schema.md` (types Topic, Regulation, Exam, Source Document, Analysis Report; `acs_area` field mapping pages to the five Part 107 test areas), `index.md`, this log, `AGENTS.md`, and `scripts/lint.py`.
- Ingested four FAA sources for Part 107 course development: FAA-S-ACS-10B (Airman Certification Standards), AC 107-2A, the Remote Pilot Study Guide (FAA-G-8082-22), and the UAG sample questions. Preserved original PDFs and extracted text in `sources/` with one anchor page each. Added an anchor page for the approved AERO 100 course outline (lives in the repository's curriculum content).
- Fanned the research out into 23 articles: the Part 107 Knowledge Test exam page; eight regulation pages (Part 107, operating rules, remote pilot certificate, waivers, operations over people, Remote ID, registration, and the pending Part 108 BVLOS rulemaking with a `last_checked` date); thirteen aeronautical knowledge topics covering all five ACS areas; and one analysis mapping ACS coverage onto the AERO 100 outline.
- Rationale: AERO 100's first student learning outcome is passing a Part 107-style exam at 80 percent, so the wiki's first knowledge layer is the tested material, organized by ACS area for direct course-design retrieval.
- Known gaps, flagged rather than guessed: exact kinetic energy limits for Category 2 and 3 operations over people (not stated in the preserved sources), local airspace review for candidate flight sites, and verification of the SLO Flyers field FRIA status against FAA data.
