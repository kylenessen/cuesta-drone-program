#set document(title: "General education transfer opportunities for the UAS program")
#set page(paper: "us-letter", margin: (x: 0.75in, y: 0.65in), numbering: "1")
#set text(font: "New Computer Modern", size: 10.5pt)
#set par(leading: 0.55em, spacing: 0.7em)
#set heading(numbering: none)
#show heading.where(level: 1): set text(size: 14pt, fill: rgb("244653"))
#let src(url, label) = link(url)[#text(fill: rgb("245b76"), size: 9pt)[#label]]
#let cuesta = "https://cuesta.curriqunet.com/catalog/iq/27135/29851"
#let standards = "https://icas-ca.org/cal-getc-standards/"
#let poly = "https://registrar.calpoly.edu/Transf_credit_eval"

#text(size: 21pt, weight: "bold")[General education transfer opportunities]
#v(0.2em)
#text(size: 12pt)[Cuesta College UAS program]

#text(size: 9pt, fill: rgb("555555"))[Research checked September 28, 2026. Planning assessment, not an articulation decision.]

= Findings

Two courses in the proposed support pool already appear on Cuesta's current Cal-GETC list. GEOG 201 satisfies physical science. AGPS 242 satisfies biological science and includes an integrated laboratory. None of the proposed AERO courses appears on that list. Of the new drone courses, AERO 110 is the strongest candidate for a curriculum discussion about future science GE approval. Its current outline still centers on professional mapping deliverables. #src(cuesta, "Cuesta 2026-2027 Cal-GETC list")

Transferable units, major credit, and GE credit are separate determinations. Cal Poly directs students to separate ASSIST lists for CSU transferable courses and Cal-GETC courses. A course may earn elective units without satisfying a GE requirement or replacing a required major course. For students following Cal Poly's 2026-2028 catalog, its registrar directs GE searches to Cal-GETC. Earlier catalog rights need separate checking. #src(poly, "Cal Poly transfer credit guidance")

= Course assessment

#text(size: 9.3pt)[
#table(
  columns: (1.2fr, 1.05fr, 2.2fr),
  inset: 6pt,
  stroke: 0.4pt + rgb("cbd3d7"),
  fill: (x, y) => if y == 0 { rgb("e9eff2") },
  table.header([*Course*], [*Current GE position*], [*Planning assessment*]),
  [AERO 100\ Basic UAV Operator], [Not listed for Cal-GETC], [Low GE potential as written. Certification preparation and flight proficiency dominate. General transfer status also needs confirmation.],
  [AERO 110\ Mapping and remote sensing], [Draft. No GE proposed], [Best candidate for Area 5A discussion. Would need a stronger science inquiry focus. Area 5C would require an approved science laboratory.],
  [AERO 120\ Infrastructure inspection], [Draft. No GE proposed], [Weaker candidate. Thermal physics is relevant, but inspection procedures and industry preparation dominate the course.],
  [AERO 130\ Agricultural spray operations], [Undeveloped proposal], [Low apparent GE potential from the concept. Assess an actual outline before reaching a final conclusion.],
  [AERO 247\ Independent study], [Proposed], [Independent study is excluded from Cal-GETC.],
  [GEOG 201\ Physical Geography], [*Approved Area 5A*], [Immediate physical science GE option in the proposed achievement certificate pool.],
  [AGPS 242\ Introduction to Plant Science], [*Approved Area 5B with integrated lab*], [Immediate GE benefit for Crop Monitoring and Spray Operations, as well as the achievement certificate pool.],
  [Other proposed support courses], [Not on current Cal-GETC list], [GEOL 230 through 234, ENGR 201, AGPS 250, ART 249A/B, and FTVE 225B. Transfer or major credit may still be available.],
)
]

#text(size: 9pt)[Evidence combines the current Cuesta GE list, the July 2026 certificate structure, and the AERO 100, 110, and 120 outlines in this repository. The proposed GEOG/GEOL 230 entry is listed as GEOL 230 in the catalog extract. Prospects in this table are research judgments. They are not approvals.]

*A counseling detail matters.* GEOG 201 and AGPS 242 are each three units. Together they total six units, short of the seven required in Cal-GETC Area 5, even though plant science includes a lab. A counselor should build the remaining science coursework into the student's plan. #src(cuesta, "Cuesta science area requirements")

#pagebreak()

= What a science GE proposal would require

Cal-GETC requires CSU and UC transferability. It excludes courses centered on practical skills or professional preparation, and it excludes independent study. Science courses must emphasize scientific inquiry and foundational concepts. Laboratory approval requires corresponding science content, not simply scheduled lab hours. Cross-listing alone does not establish GE eligibility. These are the main constraints on our current designs. #src(standards, "ICAS Cal-GETC Standards 1.4, sections 5 and 9.5")

For AERO 110, I recommend a faculty review of whether students could investigate environmental questions through remote sensing while retaining the course's useful fieldwork. A possible assignment would have students predict how surface material and illumination affect measured reflectance, collect controlled observations, analyze uncertainty, and defend their interpretation. Another could test how flight geometry affects elevation error. These are proposed curriculum changes, not findings that the existing course already meets GE standards.

That review should examine the balance among scientific explanation, software instruction, equipment operation, and production of client deliverables. The present draft includes electromagnetic radiation, sensor behavior, geodesy, accuracy assessment, and vegetation indices, which give the discussion a credible starting point. It also expressly says that no transfer GE is proposed. If accommodating GE would crowd out the professional mapping content students need, a separate introductory remote sensing science course may be a better long-term option.

AERO 120 has a similar but narrower opportunity around heat transfer, emissivity, and measurement error. I would give it lower priority because its stated purpose is professional infrastructure inspection. I would preserve that purpose unless faculty identify a convincing science curriculum that still serves the utility partnership. AERO 100 and the spray operations concept offer less obvious room for that change.

= Recommended next step

Bring AERO 110 to Ron, the geography or geology faculty, and *Dina Hallmark, Cuesta's Articulation Officer*. Ask whether to pursue a science GE redesign, a separate introductory science course, or transfer and major credit while retaining the current professional emphasis. Cuesta identifies Hallmark in its current counseling directory. #src("https://www.cuesta.edu/become-student/counseling/", "Cuesta counseling directory")

The approval sequence needs planning. UC transfer approval is a prerequisite to Cal-GETC submission. The joint CSU and UC submission memo confirms that course outlines go through ASSIST. Hallmark should confirm the next available cycle and Cuesta's local deadlines before the program advertises any new GE designation. #src("https://transferprograms.calstate.edu/sites/default/files/2024-10/Annual%20submission%20of%20CCC%20outlines%20for%20Cal-GETC%20and%20CSU%20American%20Institutions%2010-9-2024.pdf", "Joint CSU and UC submission memo, October 2024")

For UC transferability, a course needs lower-division comparability or appropriate university-level purpose, scope, and depth. That is an additional review, separate from Cal Poly course equivalency. #src("https://www.ucop.edu/transfer-articulation/transfer-course-agreements/index.html", "UC Transfer Course Agreements")

For immediate student benefit, retain GEOG 201 and AGPS 242 in counseling materials with their verified GE designations. The remaining support courses may still advance transfer goals through elective or major credit. The repository's catalog extract lists GEOL 234 as CSU transferable only, which is a useful reminder that a remote sensing title does not establish GE credit. AERO 100 has no explicit transfer designation in that extract, so the proposal's broad claim that all courses transfer to CSU should not be extended to the AERO sequence without verification.

= Scope and limits

This assessment compares our planned courses with Cuesta's published 2026-2027 Cal-GETC list and the current statewide standards. It does not verify individual course-to-course or major agreements in ASSIST. Before advising a student, confirm the course's approval for the term taken, the student's catalog rights, and the receiving major's requirements. Cal-GETC serves CSU and UC transfer, with UC program exceptions. It is not a blanket GE guarantee for private or out-of-state universities. #src(standards, "ICAS standards, sections 3 and 4")
