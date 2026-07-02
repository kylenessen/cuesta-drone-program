---
type: Schema
title: Wiki Schema
description: Local vocabulary, layout, and lint rules for the drone knowledge wiki. Read before writing.
timestamp: 2026-07-02T17:00:00Z
---

# Wiki Schema

This wiki is an Open Knowledge Format bundle maintained under the llm-wiki skill (in the companion `skills` repository). This document defines everything local to it. The yaml block below is machine-read by `scripts/lint.py`, so changing the vocabulary means editing that block, logging the change in `log.md`, and only then using the new value.

## What this wiki is for

This wiki is the durable knowledge base behind Cuesta College's drone program curriculum. Its primary reader is the curriculum developer, who uses it to design course content for AERO courses, starting with the aeronautical knowledge students need to pass the FAA Part 107 knowledge test. Durable knowledge here means subject matter that outlives any one course draft: what the FAA tests and requires, how drone regulations and airspace work, and the operational knowledge a working remote pilot needs. Course drafts and proposals live elsewhere in the repository; this wiki records what is true about the domain, with citations, so course materials can be written and rewritten against it.

## Registry

```yaml
types:
  Topic:
    purpose: A durable aeronautical knowledge subject, typically one teachable unit of content.
    folder: topics
    sections: [Related, Citations]
  Regulation:
    purpose: A regulatory instrument, rule area, or FAA program, with its requirements and current status.
    folder: regulations
    sections: [Requirements, Related, Citations]
  Exam:
    purpose: An FAA test or training requirement, covering its format, content, and logistics.
    folder: exams
    sections: [Format, Content, Logistics, Related, Citations]
  Source Document:
    purpose: Evidence anchor for one original artifact preserved in the sources folder.
    folder: sources
    sections: [Original Source, Extraction Quality, Used By]
  Analysis Report:
    purpose: A promoted answer. A question, method, and findings worth keeping, usually connecting wiki knowledge to curriculum decisions.
    folder: analysis
    sections: [Question, Method, Findings, Caveats, Citations]

tags:
  night-operations: Night and civil twilight flying across rules, equipment, and physiology.
  risk-management: Hazard identification, aeronautical decision-making, and mitigation.
  batteries: Lithium battery handling, charging, and fire hazards.
  charts: Reading and using aeronautical charts and chart supplements.

fields:
  status: [draft, reviewed, needs-source, needs-review, archived]
  certainty: [confirmed, inferred, mixed, unknown]
  acs_area: [regulations, airspace, weather, loading-performance, operations, general]

options:
  exclude: [scripts, AGENTS.md]
  sources_folder: sources
  filename_style: kebab-case
  link_style: bundle-absolute
  require_description: true
```

## Frontmatter guidance

Every page carries `type`, `title`, and `description`. The description is one sentence a search result can stand on: what the page covers and why it is here.

The `acs_area` field maps a page to the five content areas of the FAA Part 107 knowledge test (Area I Regulations, Area II Airspace, Area III Weather, Area IV Loading and Performance, Area V Operations), plus `general` for pages that span areas or sit outside the test. Set it on every Topic, Regulation, and Exam page. It is the main retrieval axis for course design: filtering on `acs_area` collects everything that feeds one block of instruction.

Tags are for cross-cutting themes that the type and `acs_area` cannot express. Use them sparingly and only from the registered list.

Use `last_checked` (an ISO date) on pages whose claims can silently go stale, such as pending rulemaking or fee amounts. Use `certainty` when a page rests substantially on inference, and `status: needs-review` when a page has a known gap.

## Layout

- `exams/` holds pages about FAA tests and training requirements.
- `regulations/` holds pages about rules, rule areas, and FAA regulatory programs.
- `topics/` holds subject-matter pages, the teachable units of aeronautical knowledge.
- `analysis/` holds promoted analyses connecting the wiki to curriculum work.
- `sources/` holds original artifacts (PDFs), their extracted text (`.txt`), and one Source Document anchor page per artifact.
- `scripts/` holds `lint.py`. Run `uv run scripts/lint.py .` from the wiki root before finishing any change.
