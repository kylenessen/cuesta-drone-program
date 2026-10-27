#let evidence = json("2026-10-27-independent-study-research.json")
#let cite(id, label) = {
  let source = evidence.sources.find(s => s.id == id)
  text(fill: rgb("225D73"))[#link(source.url)[#label]]
}
#let next-page(title) = {
  pagebreak()
  text(size: 9pt, fill: rgb("59656D"))[CUESTA DRONE PROGRAM · INDEPENDENT STUDY]
  heading(level: 1, title)
}

#set document(title: "Independent Study for AERO 147", author: "Cuesta Drone Program")
#set page(paper: "us-letter", margin: (x: 0.7in, top: 0.65in, bottom: 0.65in),
  footer: context [#text(size: 8.5pt, fill: rgb("59656D"))[Research for discussion · October 27, 2026] #h(1fr) #counter(page).display("1")])
#set text(font: "Arial", size: 11pt, hyphenate: false)
#set par(leading: 0.38em, spacing: 0.6em)
#set heading(numbering: none)
#show heading.where(level: 1): set text(size: 19pt, fill: rgb("173F50"))
#show heading.where(level: 2): set text(size: 11.5pt)
#show heading: set block(above: 0.85em, below: 0.4em)

#text(size: 9pt, fill: rgb("59656D"))[CUESTA DRONE PROGRAM · RESEARCH MEMO]
= Independent study for AERO 147
#text(size: 12pt)[What Cuesta already supports and what the draft needs]

Cuesta has an established route for individually directed study beyond its regular curriculum. AERO 147 fits that purpose. The existing project description can remain brief. Keep the proposed 0.5 to 2 units and 27 to 108 laboratory hours. Before launch, revisit the nondegree credit classification, formal preparation requirement, and cap of 25. Faculty assignment and compensation also need an operating decision. These are research recommendations, not approved changes.

This review develops Kyle's independent study proposal using established college sources. It starts with Biology and checks Engineering and Architectural Technology against the current catalog, published agreement, course cap procedure, bargaining agreement, and distance education requirements.

== Verified course examples
All three active comparators show 0.5 to 2 units, 27 to 108 lab hours, a 54-hour divisor, completed preparatory coursework, and Letter Grade or P/NP. Their cap fields and selected delivery modes differ. The table distinguishes an overall cap from modality limits.

#set table(inset: 6pt, stroke: 0.4pt + rgb("CAD3D7"), align: left)
#text(size: 9.5pt)[
#table(columns: (0.95in, 1.05in, 1.9in, 1fr),
  fill: (x, y) => if y == 0 { rgb("EAF0F3") } else { none },
  table.header([*Course*], [*Credit*], [*Cap fields*], [*Selected DE modes*]),
  [#cite("bio", "BIO 247")], [Degree applicable], [Overall 0. Both limits 0. Category blank.], [Blended and FOMA],
  [#cite("engr", "ENGR 247")], [Degree applicable], [Overall 5. Both limits 5. Category blank.], [Online, Hybrid, Blended],
  [#cite("atch", "ATCH 147")], [Degree applicable], [Overall blank. Both limits 1. Category blank.], [Hybrid, Blended, FOMA],
  [#cite("aero", "AERO 147 draft")], [Not degree applicable], [Overall 25. Both limits 25. Lab Small.], [Online, Hybrid, Blended],
)]

BIO's zero entries do not establish zero enrollment or an unlimited cap. ATCH's limits of one are not an overall cap entry. Blank categories in older courses do not establish what a new proposal may omit. FOMA means Fully Online with Mutual Agreement and has a specific emergency purpose.

== Recommended credit direction
The #cite("catalog_numbering", "current catalog") normally assigns degree-applicable, nontransferable credit to 100-level courses, with stated exceptions. ATCH 147 provides a direct local example. Recommend that AERO 147 use that classification unless curriculum review identifies a reason otherwise. A 147 number does not by itself establish certificate applicability. A 247 number would require a separate transfer determination.

#next-page[Eligibility and the student agreement]

== Verified local requirements
The #cite("catalog_eligibility", "2026-2027 catalog") requires good standing, concurrent enrollment in another class, and completed prerequisite and preparatory coursework. It permits no more than two credits for an independent study course in a semester or session. The #cite("catalog_numbering", "course information policy") places independent study beyond regular offerings. It cannot replace an existing course.

The #cite("agreement", "currently linked agreement") defines good standing as a Cuesta GPA of 2.0 in the most recent semester, with no probation or dismissal. Concurrent credit enrollment may be waived through division chair or director and dean approval. The form allows independent study once per discipline. It lists 0.5, 1, or 2 credits. A P/NP election uses a separate petition.

The published enrollment deadline is the end of week four for a full-term course or 20 percent of a summer or short course. This form is dated January 2017. Registration Services should confirm those details for the current calendar and new AERO offering.

== Verified enrollment sequence
The student first completes the records check with Registration Services and photo identification. Student and instructor then develop the agreement. The dean approves it and assigns a CRN. The dean's office routes it to Registration Services for enrollment and distribution of copies. The #cite("registration", "current registration webpage") still directs students through this process.

== Required agreement content
The agreement records methods, measurable objectives, materials, conference frequency, hour verification, and evaluation. It requires student and instructor signatures and dean approval. A Cuesta academic employee supervises and evaluates the work, provides guidance, and documents progress and each interaction in a division-retained file. These are requirements of the #cite("agreement", "college form").

== Application to AERO 147
Use the agreement to define each project's question, deliverable, milestones, preparation, resources, and assessment. A concise research proposal, progress record, completed product, and explanation of results can document learning without prescribing one device or application for every student. Project equipment and field procedures belong in that agreement and supporting teaching plans.

The live AERO draft has no formal requisite. Biology requires preparation in its field. Engineering and Architectural Technology require preparation in the technical field. Use those examples to resolve AERO's formal preparation wording. Do not assume that permission alone replaces the catalog requirement. A universal AERO 100 prerequisite would be a separate curricular choice, not a rule established by this research.

The draft is nonrepeatable. Treat an extended project across terms cautiously. A new topic does not automatically override the form's once-per-discipline restriction. Registration Services should resolve repeat handling before a student plans continuing enrollment.

#next-page[Student hours, faculty workload, and capacity]

== What the hour fields establish
The three comparator CORs and AERO draft share 27 to 108 laboratory hours and a divisor of 54 hours per unit. Their reports display 1.5 to 6 weekly laboratory hours, with no lecture or separately listed outside hours. Those entries support retaining the proposed unit and term-hour range. They do not establish the correct weekly scheduling entry under a 16-week calendar.

The agreement offers 27 hours for 0.5 unit, 54 for one unit, and 108 for two units. Confirm additional increments before offering 1.5 units. Use an explicit project workload and hour-verification method. Avoid adding ordinary lecture homework hours to this laboratory model by copying unrelated boilerplate.

== Supervision is individual, but need not be continuous
The #cite("pcah", "2026 Program and Course Approval Handbook"), section II.2.5.6, describes individual instructor interaction without continuous immediate supervision. It preserves the academic standards of other courses. Student project hours therefore do not automatically equal hours of instructor presence or paid faculty contact. Supervised flight, equipment use, or field activity may still require scheduled presence based on the project.

The September 2026 #cite("contract", "CCFT agreement") assigns load determination to the administrator in section 5.8. It provides general lecture and laboratory load rules and treats DE load in sections 5.8.5 and 5.10. No independent study compensation or per-student load formula was located. That absence does not mean the work is unpaid. The dean and Instruction need to establish the assignment, consultation expectations, compensation, and number of projects an instructor can support.

== Why the cap of 25 needs review
#cite("caps", "AP 4023") distinguishes the course cap, limits by modality, and a section's enrollment maximum. Lab Small spans 20 to 30 students. Its general laboratory description is not an independent study staffing formula. The policy has no dedicated independent study category and provides a variance process. It also excludes caps determined by certain regulatory, safety, or contractual requirements from the standard category ranges.

ENGR's five is a useful discussion benchmark. ATCH's limits of one show that Cuesta also supports highly individual arrangements. Neither establishes a universal independent study cap. Reopen AERO's inherited 25 and Lab Small selection. Determine the appropriate category, exception or variance, modality limits, and CRN grouping through the college process. Base the proposed capacity on actual supervision and evaluation work.

== Attendance accounting is a separate decision
The #cite("attendance", "2025 Student Attendance Accounting Manual") requires transition to standardized accounting by July 1, 2026. Do not apply an older independent study FTES formula without checking current implementation. Instruction and attendance accounting staff should confirm section coding and documentation. This research does not revise the submitted program's FTES projections or budget.

#next-page[Distance education and project resources]

== Verified modality rules
#cite("de_policy", "AP 4105") requires separate approval whenever any instruction is delivered through distance education. Fully Online means all instructional hours use DE. Hybrid combines in-person instruction with at least 51 percent DE. Blended combines the two with less than 51 percent DE. FOMA addresses courses that work best in person but can be offered online in emergency circumstances.

These distinctions concern instruction, not simply the time a student spends working alone. Independent study is not automatically an online course. An instructor-directed project needs a delivery plan that matches its actual teaching, consultation, assessment, and any supervised activity.

== What the comparators support
ENGR 247 selects Fully Online, Hybrid, and Blended. This is a relevant precedent for AERO's proposed selections, but it does not establish that every drone project can use every mode. BIO 247 selects Blended and FOMA. Its narrative discusses additional modes that are not selected. ATCH 147 selects Hybrid, Blended, and FOMA. Read the actual selections before borrowing their language.

For AERO, a remotely accessible analysis or research project could support Fully Online. A project requiring face-to-face flight instruction or supervised equipment work needs a suitable mixed or in-person arrangement. A statement that required physical work will occur in person cannot also justify that same project as fully online. Keep online approval only if the course can achieve its outcomes through an actual online project pathway.

== A workable interaction plan
AP 4105 requires the campus LMS, accessible instruction, identity verification, and regular substantive interaction. It includes interaction among students where applicable. The #cite("rsi", "college's 2025 interaction guidelines") call for predictable instructor-initiated academic engagement, monitoring, proactive follow-up, and at least two substantive interaction practices.

For discussion, use scheduled instructor consultation about project methods and evidence, combined with timely substantive feedback on progress and products. Record that interaction in the LMS. A weekly rhythm is a practical proposal, consistent with comparator progress reporting, rather than a universal independent study rule. Add peer exchange when peers are enrolled. The current AERO promise of weekly peer discussions needs revision if a section could contain one student. Local DE review should confirm the final plan and instructor readiness.

== Resources and evaluation
BIO's model combines selected literature, a progress notebook, data analysis, and a research paper. ENGR and ATCH use agreed objectives and regular reports or demonstrations. AERO can preserve that flexibility while evaluating the student's own evidence, technical reasoning, completed work, and explanation of results.

The AERO draft assumes college-provided computers and software, has no materials fee, and leaves library availability unconfirmed. Before approving a project, verify actual equipment, software, accessible references, facilities, field access, supervision, and any costs. A general program funding statement does not establish that every proposed project has those resources.

#next-page[Decisions to resolve before launch]

The research establishes a usable local model. The remaining questions concern how Cuesta will administer and staff this specific course. The following are recommended office-level confirmations. No inquiries have been sent.

*Curriculum specialist and articulation.* Confirm 147 and degree applicability, the formal treatment of preparatory coursework, and any intended program mapping. Preserve the submitted certificate structure unless a later authorized curriculum decision changes it.

*Curriculum and the course cap review process.* Determine the cap entry, category or exception, any variance evidence, and modality limits. Decide whether several individual agreements share a section and CRN. Use the active comparator values as evidence for discussion, not as rules that automatically govern AERO.

*Academic dean, Instruction, HR, and CCFT as appropriate.* Confirm assignment and compensation for individual supervision. Establish the number of projects, consultation and evaluation expectations, and funded capacity. Ask whether a local agreement or operating practice supplements the published bargaining agreement.

*Registration Services.* Confirm the current agreement, available unit increments, enrollment deadlines, concurrent-enrollment exception, repeat handling, and routing for a new AERO course. The published form predates both this proposal and the current calendar.

*Instruction and attendance accounting.* Confirm weekly scheduling fields, progress and hour records, and current attendance coding. Keep student credit hours, faculty workload, and apportionment calculations distinct.

*Distance education reviewers and program resource staff.* Confirm the proposed delivery modes and an interaction plan that works for a single student. Verify faculty readiness, library support, accessible materials, and the equipment and site access required by each approved project.

== Source status and limits
This review checked the current catalog and registration instructions, active COR records 8129, 755, and 159, and draft 9801 on October 27, 2026. BIO's outline records approval on May 7, 2021 and an effective term of Spring 2022. ENGR's report displays Spring 1990 and ATCH's Spring 2024, with no outline approval date in those reports. Active status is not a claim of recent approval.

The currently linked agreement is dated January 26, 2017. The cap policy inspected is the May 2015 version referenced by the current course form. AP 4105 is revised May 13, 2022. The bargaining agreement is the September 2026 amendment. A later live catalog course search failed, so course details rely on the active CORs. BIO's older schedule text also conflicts with its main transfer field. UC transfer is not established by this review.

The companion structured research record preserves links, retrieval methods, PDF hashes, displayed course fields, recommendations, and unresolved questions. Existing proposal records, CurrIQunet drafts, and the October 27 submitted College Council packet were not changed. This memo is separate planning guidance, not additional COR text.
