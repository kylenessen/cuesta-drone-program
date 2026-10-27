# Curriculum sources and Notices of Intent

## Current program reference

Start with the [College Council packet submitted October 27, 2026](../docs/program-approval/2026-10-27-college-council-packet.docx) for the current program structure, certificate requirements, course sequence, FTES projections, and budget. Its [submission record](../docs/program-approval/README.md) explains its authority and status.

## Saved NOI records

The five course Notices of Intent are documented in [2026-09-30-aero-noi-review.json](2026-09-30-aero-noi-review.json). This file contains the course titles, descriptions, rationales, units, term contact hours, and other entries used in the College Council review. The [submission details](2026-09-30-aero-noi-submission-details.json) record each CurrIQunet URL, Ron's contributor access, saved status, and unresolved fields.

The last status recorded in those files is September 30, 2026. All five NOIs were saved and verified as drafts. They had not been launched or submitted at that point. This is a dated record of the course proposals, not a claim about their current approval status. Check CurrIQunet for later changes and approved Course Outlines of Record.

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

## Earlier planning material

The July [certificate structure draft](certificate-structure.md) and [certificate memo](uas-certificate-structure-memo.md), the April program response, and the AERO 110 and AERO 120 drafts preserve earlier planning. Their placeholder course numbers and certificate structures have been superseded where they differ from the submitted packet and the September NOI content. Do not use those earlier proposals as the current program specification.

The [AERO 100 advisory outline](aero-100-advisory-outline.md) remains a teaching and advisory reference. Course approval questions should be resolved against the applicable approved Course Outline of Record. New curriculum work should begin from the current records above and document any later changes explicitly.
