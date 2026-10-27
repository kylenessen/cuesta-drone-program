# Curriculum sources and Notices of Intent

## Current program reference

Start with the [College Council packet submitted October 27, 2026](../docs/program-approval/2026-10-27-college-council-packet.docx) for the current program structure, certificate requirements, course sequence, FTES projections, and budget. Its [submission record](../docs/program-approval/README.md) explains its authority and status.

## Saved NOI records

The five course Notices of Intent are documented in [2026-09-30-aero-noi-review.json](2026-09-30-aero-noi-review.json). This file contains the course titles, descriptions, rationales, units, term contact hours, and other entries used in the College Council review. The [submission details](2026-09-30-aero-noi-submission-details.json) record each CurrIQunet URL, Ron's contributor access, saved status, and unresolved fields.

The last status recorded in those files is September 30, 2026. All five NOIs were saved and verified as drafts. They had not been launched or submitted at that point. This is a dated record of the course proposals, not a claim about their current approval status. Check CurrIQunet for later changes and approved Course Outlines of Record.

A live CurrIQunet search on October 27 showed all five September NOIs as Active. The [AERO 161 approval history](https://cuesta.curriqunet.com/Approval/Course/History/9779) records launch on September 30, dean approval on October 6, and implementation on October 7. The curriculum specialist's implementation comment says the proposer may clone the NOI to create a new course proposal. The clone dialog offers New Course Proposal. No clone was created during this inspection. The September records remain unchanged as historical evidence.

| Course | Title in the saved NOI | Units | Lecture hours per term | Lab hours per term | CurrIQunet record |
|---|---|---|---|---|---|
| AERO 151 | Advanced Drone Regulations and Safety Management | 2 | 18 | 54 | [9778](https://cuesta.curriqunet.com/Form/Course/Index/9778) |
| AERO 161 | Drone Applications in Geospatial Technology | 3 | 36 | 54 | [9779](https://cuesta.curriqunet.com/Form/Course/Index/9779) |
| AERO 162 | Drone Applications in Precision Agriculture | 3 | 36 | 54 | [9780](https://cuesta.curriqunet.com/Form/Course/Index/9780) |
| AERO 163 | Drone Applications in Public Safety | 3 | 36 | 54 | [9781](https://cuesta.curriqunet.com/Form/Course/Index/9781) |
| AERO 147 | Independent Studies in Drone Technology | 0.5 to 2 | 0 | 27 to 108 | [9782](https://cuesta.curriqunet.com/Form/Course/Index/9782) |

AERO 151 includes one lecture unit and one lab unit, with 72 total instructional contact hours per term. That lab is included in the submitted packet's FTES calculations. The saved NOI notes still flag the weekly hour entry convention under the 16-week calendar as unconfirmed. AERO 147's number is recorded as provisional. The submission details also identify the approval date, qualified faculty response, and independent study cap category that were left blank. Preserve these qualifications until a later curriculum record resolves them.

The saved content is also available as a [Word review packet](../output/docx/2026-09-30-aero-noi-review.docx) and a [PDF review packet](../output/pdf/2026-09-30-aero-noi-review.pdf). The [Typst source](2026-09-30-aero-noi-review.typ) and [Word build script](../scripts/build_aero_noi_docx.py) remain available for working copies. These are NOI review exports, separate from the submitted College Council packet.

## October 27 COR content drafts

The [COR review packet](../output/pdf/2026-10-27-aero-cor-drafts.pdf) contains first instructional content drafts for AERO 151, 161, 162, 163, and 147. These drafts use concise descriptions, assessable outcomes, broad content areas, and assignment examples that allow instructors to choose equipment, software, sites, and project scenarios. They are working drafts, not submitted or approved CORs.

Kyle confirmed AERO 100 as the sole AERO prerequisite for the three applications courses, individual assessment within shared crew projects, and an emphasis on regulatory and safety exercises in the AERO 151 lab. AERO 151's prerequisite remains open and is omitted from its draft. Independent study preparation is framed around the agreed project, with formal requisite wording still to be resolved.

AERO 161 has been revised against the 2026 Program and Course Approval Handbook and supporting COR guidance. Its draft now identifies lecture and lab units, describes reading, writing, and outside work, addresses accessible instruction, and connects assessment evidence to each objective. The primary resource will be an instructor-developed document supplied in accessible digital and printable formats without a separate required textbook purchase. The document is still planned. Kyle selected Krystian Pyka's [Basics of Photogrammetry](https://epodreczniki.open.agh.edu.pl/handbook/4795), published by Open AGH in 2026, as the open companion reference. These changes are also reflected in the [AERO 161 editing Page](https://chatgpt.com/space/page_cfa55df046e88191ade2f483dca41df9). The Page and repository are maintained separately and do not synchronize automatically.

The [structured course content](2026-10-27-aero-cor-drafts.json) is the editable text source. The [Typst source](2026-10-27-aero-cor-drafts.typ) produces the review packet. The separate [source and decision record](2026-10-27-aero-cor-draft-basis.json) identifies the repository, Google Drive, and active Cuesta independent study references, along with administrative fields still needed before submission. The proposed independent study number and enrollment arrangements remain subject to confirmation. The submitted College Council packet and September NOI records are unchanged.

Build the full review packet from the repository root with `typst compile curriculum-content/2026-10-27-aero-cor-drafts.typ output/pdf/2026-10-27-aero-cor-drafts.pdf`. For a single course, add `--input course=161`, substituting its number and using a separate output filename.

The October 27 [source and decision record](2026-10-27-aero-cor-draft-basis.json) also maps the draft to fields inspected in the live [AERO 100 full course form](https://cuesta.curriqunet.com/Form/Course/Index/9436). The assessment-alignment table is a review aid. CurrIQunet uses evaluation checkboxes within each objective and objective links within topics and assignments. The Page's additional explanatory paragraphs do not all correspond to narrative entry fields.

Later on October 27, Kyle created [AERO 161 new course proposal 9797](https://cuesta.curriqunet.com/Form/Course/Index/9797) by cloning the active NOI and authorized entry of the existing content. The instructional sections, AERO 100 prerequisite mapping, open textbook, planned instructor materials, and a Blended DE draft are now saved in that form. It remains Draft and has not been launched. The [entry and review record](2026-10-27-aero-161-cor-entry.json) documents the field mapping, preserved selections, verification, report limitations, and remaining decisions. Kyle subsequently confirmed the credit classification, approved all five implications responses, and requested much shorter, broader topic entries. Those revisions are saved in CurrIQunet. Ron will review the entire proposal before submission. Program mapping, library consultation, DE details, and IDEAA remain among the open items. The Page and PDF retain the earlier instructional draft and do not synchronize with CurrIQunet.

## Remaining COR website drafts

Kyle authorized cloning the remaining active NOIs, entering a best draft in each form, and giving Ron Overacker editing access. All five COR proposals now exist as unlaunched drafts. Ron was added with all available section editing permissions selected.

| Course | New course proposal |
|---|---|
| AERO 151 | [9798](https://cuesta.curriqunet.com/Form/Course/Index/9798) |
| AERO 161 | [9797](https://cuesta.curriqunet.com/Form/Course/Index/9797) |
| AERO 162 | [9799](https://cuesta.curriqunet.com/Form/Course/Index/9799) |
| AERO 163 | [9800](https://cuesta.curriqunet.com/Form/Course/Index/9800) |
| AERO 147 | [9801](https://cuesta.curriqunet.com/Form/Course/Index/9801) |

The [remaining course entry record](2026-10-27-remaining-cor-entry.json) contains concise instructional content, proposed administrative responses, record identifiers, verification results, and remaining review items. Descriptions, outcomes, objectives, topics, linked assignment examples, evaluation methods, materials and library narratives, course cap alignment, DE details, and supported IDEAA responses were entered for all four new drafts. AERO 162 and 163 also have the authorized AERO 100 prerequisite and three content-review mappings each. Transient server errors were resolved and entry resumed. The saved reports contain all drafted core text and retain the NOI units and hours. The editable forms confirm prerequisite links that the report omits. These are drafts for review and have not been launched.

Kyle confirmed college-provided computers and software and required off-campus activities for AERO 161. Field Trips and required-activity notices were added to that draft. All five courses have a No materials-fee response. Required off-campus activities in AERO 162 and 163 are drafting assumptions for review. AERO 151's prerequisite remains open. Independent study preparation and its final administrative treatment also remain open. Program mapping, library availability, instructor-resource metadata, and local DE review require college follow-up. The submitted College Council packet and September NOI records remain unchanged.

## Earlier planning material

The July [certificate structure draft](certificate-structure.md) and [certificate memo](uas-certificate-structure-memo.md), the April program response, and the AERO 110 and AERO 120 drafts preserve earlier planning. Their placeholder course numbers and certificate structures have been superseded where they differ from the submitted packet and the September NOI content. Do not use those earlier proposals as the current program specification.

The [AERO 100 advisory outline](aero-100-advisory-outline.md) remains a teaching and advisory reference. Course approval questions should be resolved against the applicable approved Course Outline of Record. New curriculum work should begin from the current records above and document any later changes explicitly.
