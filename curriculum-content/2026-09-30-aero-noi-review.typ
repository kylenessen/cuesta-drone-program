#set document(title: "AERO Notices of Intent", author: "Kyle Nessen")
#set page(paper: "us-letter", margin: (x: 0.7in, y: 0.65in), numbering: "1")
#set text(font: "Arial", size: 10.5pt)
#set par(leading: 0.5em, spacing: 0.65em)
#set heading(numbering: none)
#show heading.where(level: 1): set text(size: 17pt, fill: rgb("244a57"))
#show heading.where(level: 2): set text(size: 11pt)
#let field(name, body) = [
  == #name
  #body
]

= AERO Notices of Intent
Review draft for Ron Overacker · September 30, 2026

This draft covers AERO 151, 161, 162, and 163. It preserves the descriptions approved in the September 30 email exchange and adds proposed responses for the NOI fields. AERO 150 is excluded. AERO 100 remains unchanged and provides the reference for the three application courses. The proposed AERO 160 renumbering is excluded.

The following pages contain draft language for review. The sections marked for confirmation are working notes, not completed form responses. Nothing in this document establishes a funding commitment, completed consultation, faculty assignment, transfer approval, or new prerequisite. No NOI has been launched.

== Shared entries

The subject is *AERO, Aeronautical and Aviation Technology*. Kyle Nessen is the originator. Ron Overacker is the co-contributor. Ron has been added with access to all six sections of the existing blank draft, record 9778. He should also be added to each subsequent NOI draft.

The answer to whether these courses fit into existing degrees or certificates is *No*. New drone certificates are planned and will be proposed separately. Their names are not needed to answer the question about existing programs.

The minimum qualification designation is *Aeronautics*, exactly as recorded for AERO 100. Its Condition field is blank. Retain that designation without adding degree, license, certification, or experience conditions. The separate question about whether the department currently has qualified faculty remains for Ron to confirm.

== Units, hours, and enrollment

#table(
  columns: (1.55fr, 0.6fr, 1fr, 1fr, 1.05fr, 0.6fr),
  inset: 6pt,
  stroke: 0.4pt + rgb("cccccc"),
  fill: (x, y) => if y == 0 { rgb("edf2f4") } else { none },
  [*Course*], [*Units*], [*Lecture*], [*Lab*], [*Outside work*], [*Cap*],
  [AERO 100 reference], [3], [36], [54], [72], [25],
  [AERO 151], [1], [18], [0], [36], [25],
  [AERO 161], [3], [36], [54], [72], [25],
  [AERO 162], [3], [36], [54], [72], [25],
  [AERO 163], [3], [36], [54], [72], [25],
)

Hours in this table are semester totals. Activity hours are zero. AERO 100 records 2 lecture and 3 lab hours per week, with an 18-week calculation. AERO 151's totals are derived from that same unit calculation. Cuesta's compressed-calendar FAQ explains that total instructional time is retained while weekly meeting time increases. Confirm whether the NOI's Min Lecture Hours and Min Lab Hour fields expect the curriculum equivalents or another entry convention. Do not replace semester totals with a simple 16-week reduction.

AERO 100's cap category is *9 - Lab - Small (20-30)*. Use it as the proposed category for AERO 161, 162, and 163. AERO 151's proposed cap is also 25, but its lecture-only category needs confirmation. The efficiency responses on the following pages explain the instructional reasons for small groups. They do not estimate enrollment or departmental productivity.

#pagebreak()
= AERO 151
*Advanced Drone Regulations and Safety Management*

#field("Tentative course description", [
This one-unit lecture course develops students’ ability to navigate FAA regulatory processes and manage safety in professional drone operations beyond introductory Part 107 preparation. Students examine waivers, airspace authorizations, coordination with aviation authorities, and the supporting documentation needed to explain how a proposed operation can be conducted safely. Topics include operations beyond visual line of sight, Part 108 rulemaking, and other emerging regulatory frameworks, with attention to distinguishing proposed changes from requirements currently in effect. Safety management instruction addresses organizational responsibilities, hazard identification, risk assessment, reporting, and evaluation of whether safety measures are working. Through case studies and scenario exercises, students connect regulatory requirements with practical operating procedures and defensible safety decisions.
])

#field("Course rationale", [
This course extends the introductory regulatory and safety foundation in AERO 100 by developing students' ability to evaluate more complex operations and document sound operating decisions. Its focus is the practical work of researching applicable requirements, preparing supporting documentation, and developing safety procedures for an organization. The one-unit lecture format provides a focused course that can support multiple planned drone certificates and students developing professional responsibilities beyond basic flight operation. The certificates will be proposed separately.
])

#field("Connection to the College Mission", [
The course supports responsible leadership through evidence-based safety decisions and accountability. Students learn to explain operational choices and consider their effects on people, property, and the wider community.
])

#field("Existing course overlap", [
AERO 100 introduces regulations, risk management, and safe drone operation. AERO 151 develops those foundations through advanced regulatory processes, organizational safety practices, and supporting documentation. The course is intended to extend that foundation rather than repeat introductory certification preparation.
])

#field("Department efficiency and proposed cap", [
A cap of 25 supports substantive discussion and individual feedback on regulatory research, hazard analysis, and scenario-based operating decisions. Small-group review allows students to explain and revise the reasoning behind their proposals. The department should confirm the appropriate lecture category and assess the effect on scheduling and instructional efficiency.
])

== Entries and items for confirmation

Propose 1 lecture unit, no lab or activity, and a cap of 25. The minimum qualification designation is *Aeronautics*, with no additional condition. Existing degree or certificate fit is *No*. Confirm the hour-entry convention, lecture cap category, faculty availability, and resources. Because the overlap question includes shared content as well as duplication, the draft recommendation is *Yes*, with the explanation above, subject to Ron's review. Transfer or articulation intent and any consultation with the Articulation Officer are not yet established.

#pagebreak()
= AERO 161
*Drone Applications in Geospatial Technology*

#field("Tentative course description", [
This course develops the skills needed to collect and prepare reliable spatial data using drones for a broad range of professional applications. Students learn the complete orthomosaic production process, from selecting camera settings and designing flight missions to processing overlapping imagery into a georeferenced image of an area. Field exercises incorporate GNSS receivers, high-accuracy positioning, ground control, and independent checkpoints to establish and evaluate positional accuracy. Instruction also introduces other sensors and data products, allowing students to consider collection methods beyond conventional photography and photogrammetry. A culminating project integrates safe mission planning, field operations, processing, quality checks, and documentation to deliver usable datasets for GIS and other professional applications.
])

#field("Course rationale", [
This course connects drone flight skills with the complete workflow required to produce usable spatial data. Students move from collecting images to designing and documenting missions, processing data, and evaluating the reliability of their results. The focus on aircraft operations and data production provides an applied complement to GIS and surveying instruction. It supports planned drone certificates and gives students a foundation for projects involving mapping, environmental observation, agriculture, and other spatial applications. The certificates will be proposed separately.
])

#field("Connection to the College Mission", [
The course connects technical learning with responsible stewardship. Students evaluate the quality and limitations of spatial data so that their work can support informed decisions about land, infrastructure, and community resources.
])

#field("Existing course overlap", [
Related content appears in GEOL 230, GEOL 233, GEOL 234, and ENGR 201, including spatial data, remote sensing, mapping, and measurement. AERO 161 emphasizes drone mission design, aircraft and sensor operation, image processing, and quality checks for the resulting datasets. Coordinate with the relevant faculty to confirm the boundaries between these courses and opportunities for complementary instruction.
])

#field("Department efficiency and proposed cap", [
A cap of 25, matching AERO 100, supports supervised field exercises and individual assessment of flight planning, data collection, and processing results. Students can work in small crews while rotating through operational and technical roles. The department should confirm the staffing and equipment available for those rotations and assess the resulting scheduling and efficiency implications.
])

== Entries and items for confirmation

Propose 3 units using AERO 100's lecture and lab structure, no activity hours, a cap of 25, and category *9 - Lab - Small (20-30)*. The minimum qualification designation is *Aeronautics*, with no additional condition. Existing degree or certificate fit is *No*. The draft overlap recommendation is *Yes*, with the explanation above. Faculty consultation is pending. Confirm the hour-entry convention, resources, faculty availability, transfer intent, and any required articulation consultation.

#pagebreak()
= AERO 162
*Drone Applications in Precision Agriculture*

#field("Tentative course description", [
This course introduces drone applications in precision agriculture, using information and technology to support crop management based on conditions at particular locations within a field. Students collect visible and multispectral imagery to document crop variability, support scouting, and identify areas that warrant closer field investigation. Thermal imaging exercises examine temperature patterns associated with crop water stress and irrigation performance, including the conditions that affect interpretation. Agricultural spraying instruction focuses on safely planning and executing drone missions that deliver chemicals to their intended treatment areas through appropriate flight paths, equipment settings, and coverage. The spraying component addresses drone operation and application placement rather than the pesticide applicator knowledge and licensing curriculum taught through specialized agricultural training.
])

#field("Course rationale", [
This course brings agricultural imaging and aerial application into a coordinated course focused on drone operation. Students learn how mission planning, sensor selection, and aircraft operation affect the usefulness of information and the placement of an application. The course connects flight skills with practical agricultural tasks while preserving a clear boundary between operating the aircraft and the specialized agricultural training used to make treatment decisions. It will support planned drone certificates that may combine aviation coursework with study in agriculture. The certificates will be proposed separately.
])

#field("Connection to the College Mission", [
The course supports stewardship through careful observation and responsible use of agricultural technology. Students connect technical decisions with crop conditions, water management, and the effects of operations on surrounding areas.
])

#field("Existing course overlap", [
AGPS 230 addresses irrigation, AGPS 242 addresses plant science, and GEOL 234 addresses remote sensing. AERO 162 applies related concepts to drone imagery collection and aircraft operation. Its application component focuses on mission execution and placement. Consult agriculture and GIS faculty about shared content and the boundaries of crop interpretation and specialized applicator training.
])

#field("Department efficiency and proposed cap", [
A cap of 25, matching AERO 100, supports close supervision of agricultural flight exercises, crew coordination, and assessment of each student's operating decisions. Small crews allow students to rotate through aircraft, sensor, and field observation tasks. The department should confirm the equipment, locations, and staffing needed for these activities before determining their scheduling and efficiency effects.
])

== Entries and items for confirmation

Propose 3 units using AERO 100's lecture and lab structure, no activity hours, a cap of 25, and category *9 - Lab - Small (20-30)*. The minimum qualification designation is *Aeronautics*, with no additional condition. Existing degree or certificate fit is *No*. The draft overlap recommendation is *Yes*, with the explanation above. Confirm resources and funding, the intended form of application exercises, faculty availability, the hour-entry convention, and any transfer or articulation plans.

#pagebreak()
= AERO 163
*Drone Applications in Public Safety*

#field("Tentative course description", [
This course prepares students to support public safety missions with drones in search and rescue, fire response, law enforcement, and emergency management. Students develop skills in visible and thermal imaging to search for missing people, assess incident conditions, and document affected areas. Practical exercises include photogrammetric reconstruction of simulated collision and crime scenes, giving students experience capturing imagery and producing spatial records for investigation and documentation. Additional scenarios develop search planning, disaster assessment, and live aerial observation skills while emphasizing crew coordination, communication with incident command, and safe operation in changing environments. Students examine the legal and regulatory frameworks specific to public safety drone operations, including emergency airspace access, agency operating authority, privacy protections, and the handling of imagery and evidence.
])

#field("Course rationale", [
This course applies drone flight and imaging skills to the coordination, documentation, and operating decisions required in public safety settings. Scenario exercises develop students' ability to collect useful information, communicate with a response team, and recognize the limits of the aircraft and its sensors. It provides a focused aviation component that can complement study or experience in public safety and support planned drone certificates. The certificates will be proposed separately. The course does not replace the professional preparation required for the underlying public safety roles.
])

#field("Connection to the College Mission", [
The course supports responsible community leadership through service-oriented technical education. Students practice teamwork, careful documentation, and consideration of privacy and public trust while learning to support emergency response.
])

#field("Existing course overlap", [
CJ 210 addresses investigation and evidence documentation, and CJ 213 addresses patrol technology, communication, and emergency response. AERO 163 focuses on aircraft operations and aerial data collection in simulated public safety missions. Consult criminal justice and public safety faculty to confirm boundaries and appropriate scenarios. Spatial reconstruction also provides a connection to GIS instruction.
])

#field("Department efficiency and proposed cap", [
A cap of 25, matching AERO 100, supports supervised scenario exercises and individual assessment of piloting, imaging, communication, and crew coordination. Small crews allow students to rotate through operational roles while receiving feedback on their decisions. The department should confirm scenario staffing, equipment, and site availability before assessing scheduling and efficiency effects.
])

== Entries and items for confirmation

Propose 3 units using AERO 100's lecture and lab structure, no activity hours, a cap of 25, and category *9 - Lab - Small (20-30)*. The minimum qualification designation is *Aeronautics*, with no additional condition. Existing degree or certificate fit is *No*. The draft overlap recommendation is *Yes*, with the explanation above. Ron approved the description for this stage and suggested later COR review with Frank. That review has not been represented as completed. Confirm resources, faculty availability, the hour-entry convention, and any transfer or articulation plans.

#pagebreak()
= Questions for Ron

== Hours and the lecture cap category

Can we retain AERO 100's 36 lecture and 54 lab semester hours for AERO 161, 162, and 163, and use 18 lecture hours for the one-unit AERO 151? What values should go into the NOI's hour fields under the compressed calendar? We propose a cap of 25 for all four courses. Which course cap category is appropriate for the lecture-only AERO 151?

== Resources and funding

Do the proposed courses require resources beyond what the department already has, and how would those additions be funded? Please confirm the Yes or No response for each course. Potential areas to review include aircraft and payloads, positioning equipment, processing software and computers, field locations, application training equipment, storage and maintenance, and supervision. These are review topics, not a purchasing request or a statement of unmet need. No resource response should be marked No merely because the budget information is not yet known.

== Qualifications and available faculty

We have retained *Aeronautics* exactly as in AERO 100 and left the qualification condition blank. Can the department answer Yes to the separate question about having faculty who meet that designation? We have not added qualification requirements based on the application area.

== Related courses and consultation

The catalog shows shared subject matter with existing courses. Do the explanations in this draft appropriately describe the boundaries, and who should review them? No consultation is recorded as complete. Overlap does not by itself establish that a proposed course duplicates an existing one. Please also confirm the department's efficiency responses after reviewing resources and scheduling.

== Transfer intent and approval routing

Are any of these courses intended for transfer or articulation, and does that require a conversation with the Articulation Officer at the NOI stage? Who is the appropriate dean or director for this workflow, and what event should establish the approval date? Ron's September 30 approval of the descriptions is recorded, but it has not been entered as formal dean/director approval. The local meeting notes identify October 1 as the NOI deadline and November 1 for the later curriculum work. Confirm that timing without treating the generic one-month form instruction as a new obstacle.

== Basis for this draft

The September 30 email exchange supplied by Kyle is the source for course titles and approved descriptions. Each description has five sentences. Earlier files with AERO 110, 120, 130, 150, or 160 concepts do not supersede this scope.

The #link("https://cuesta.curriqunet.com/DynamicReports/AllFieldsReportByEntity/9436?entityType=Course&reportId=4")[active AERO 100 All Fields report], inspected September 30, supplies the qualification designation, hours, and cap. The #link("https://cuesta.curriqunet.com/Form/Course/Index/9778")[current NOI draft] supplies the field structure. These links may require Cuesta sign-in.

Mission responses are proposed applications of Cuesta's #link("https://www.cuesta.edu/about/president/missionstatement.html")[Mission, Vision, and Values], reviewed September 30. The calendar note is based on Cuesta's #link("https://www.cuesta.edu/about/college-resources/research/16-week-calendar/index.html")[16-week calendar FAQ]. Some FAQ wording describes the earlier proposal stage, so it is guidance about the conversion principle rather than confirmation of the current NOI entry convention.

The overlap review uses the repository's structured extract of the 2026-2027 Cuesta Catalog, July 2026 Addendum, specifically AERO 100, GEOL 230/233/234, ENGR 201, AGPS 230/242, and CJ 210/213. These descriptions identify likely consultation topics. They do not establish current scheduling or approval by another department. Local paths are sources/cuesta-catalog-2026-2027/courses/ and communications/2026-09-28-ron-meeting-prep.typ.
