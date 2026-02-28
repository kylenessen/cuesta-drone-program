#import "../equipment-purchasing/cuesta-memo.typ": cuesta-memo

#show: body => cuesta-memo(
  title: "Proposed Certificate Structure for UAS Program",
  audience: "Ron [Last Name], Program Director, Aerospace Classes",
  author: "Kyle Nessen",
  date: "February 2026",
  logo: "../equipment-purchasing/images/CuestaLogo-H-FC-Black.png",
  body: body,
)

= Overview

This document proposes a set of stackable certificates for Cuesta College's emerging UAS (Unmanned Aircraft Systems) program. The structure uses a common foundation course, AERO 100: Basic UAV Operator, as the entry point for all certificate tracks. From that foundation, students select a specialization aligned with their career interests, earning a Certificate of Specialization. Students who complete multiple specializations or a broader set of coursework earn a Certificate of Achievement, the program's primary workforce credential.

This design follows proven institutional models already operating successfully at Cuesta. The Child Development and Family Studies program uses a stacking approach where each certificate level builds on the last: Associate Teacher (12 units) feeds into Teacher (26 units), which feeds into Master Teacher (35 units). The Business Administration program uses a different but complementary pattern: a shared Career Track Core certificate that branches into concentration-specific credentials in Accounting, Marketing, Small Business Management, and other fields. The proposed UAS structure combines both approaches -- a common core branching into specializations, with a stacking pathway from smaller credentials to larger ones.

The interdisciplinary nature of drone operations is a strength. By pairing AERO courses with existing offerings in Geography, Criminal Justice, Agriculture, and Film/Television, the program creates cross-enrollment pathways that serve students from multiple disciplines while strengthening the enrollment base for all participating departments.

= Foundation Course

All certificates begin with the approved foundational course:

#table(
  columns: (auto, 1fr, auto),
  align: (left, left, center),
  table.header([*Course*], [*Title*], [*Units*]),
  [AERO 100], [Basic UAV Operator], [3.0],
)

AERO 100 prepares students for FAA Part 107 certification and covers regulations, airspace, weather, flight planning, safety, and hands-on flight proficiency to NIST Level 2 standards. This course is already approved through CurriQunet and serves as the prerequisite for all applied AERO courses.

= Proposed New AERO Courses

Two new courses are in development. Course Outline Reports for both are drafted and ready for review.

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Format*]),
  [AERO 110], [Drone Mapping and Photogrammetry], [2.0], [1 hr lecture / 4 hr lab],
  [AERO 120], [Thermal Imaging and Applied Inspection], [3.0], [2 hr lecture / 3 hr lab],
)

AERO 110 covers RTK positioning, ground control point methodology, photogrammetry processing, and professional deliverable production. The course prepares students for mapping positions in surveying, construction, environmental monitoring, and civil engineering.

AERO 120 covers infrared theory, thermal camera operation, image interpretation, infrastructure inspection, and public safety operations including search and rescue. The course aligns with Level 1 thermography certification requirements and prepares students for employment in utility inspection and public safety.

A third new course in agricultural UAS applications is proposed for Phase 2 development, discussed below under the Agriculture specialization.

= Certificates of Specialization

Certificates of Specialization are Cuesta's smallest credential, typically consisting of two to four courses totaling 3 to 12 units. The college currently offers 23 of these certificates, with a median of 6.0 units. They target a single employable skill and are designed for quick completion. Five specializations are proposed for the UAS program, each combining the AERO foundation with courses from partner departments.

== UAS Mapping

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [AERO 110], [Drone Mapping and Photogrammetry], [2.0], [Aerospace],
  [GEOG 230], [Introduction to Geographic Information Systems], [3.0], [Geology/Geography],
  table.footer([], [*Total*], [*8.0*], []),
)

This specialization targets the largest commercial drone employment sector: mapping, surveying, and photogrammetry. Pairing AERO 110 with GEOG 230 gives students both the flight and processing skills to produce professional map products and the GIS foundation to work with the spatial data those products generate. GEOG 230 already exists and is the gateway course for Cuesta's 12-unit GIS Certificate of Achievement, so students in this track also begin progress toward that credential.

The collaboration with the Geology/Geography department is natural. Drone-collected data is increasingly central to GIS workflows, and Geography students benefit from understanding how that data is acquired. GEOG 230 is currently listed as an advisory on the AERO 110 Course Outline Report.

*Career pathways:* Surveying and engineering firms, construction site monitoring, environmental consulting, county and city planning departments, agriculture technology companies.

== UAS Public Safety

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [AERO 120], [Thermal Imaging and Applied Inspection], [3.0], [Aerospace],
  [CJ 202], [Introduction to Criminal Justice], [3.0], [Criminal Justice],
  table.footer([], [*Total*], [*9.0*], []),
)

This specialization serves students pursuing careers in law enforcement, fire response, and search and rescue operations that increasingly rely on drone-deployed thermal imaging. AERO 120 covers thermal search patterns, incident command integration, and night operations. Pairing it with CJ 202 provides the institutional and procedural context that public safety drone operators need to function within emergency response structures.

Cuesta does not offer a fire technology program, which makes this certificate particularly valuable as the only public-safety-adjacent drone credential in the area. The continuing education market is also significant: working firefighters, law enforcement officers, and SAR volunteers represent an audience for evening and weekend scheduling of these courses.

*Career pathways:* Law enforcement agencies, fire departments, search and rescue teams, emergency management, private security firms with drone divisions.

== UAS Inspection

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [AERO 120], [Thermal Imaging and Applied Inspection], [3.0], [Aerospace],
  table.footer([], [*Total*], [*6.0*], []),
)

This is the most focused specialization, targeting the infrastructure inspection sector. AERO 120 covers electrical infrastructure inspection, solar panel assessment, building envelope analysis, and professional reporting workflows aligned with California utility regulations (General Orders 95 and 165). PG&E alone operates over 80 drone pilots daily and completed more than 300,000 inspections in 2024, making utility inspection the single largest local employer of drone operators in our region.

At 6.0 units and two courses, this certificate matches the institutional median for Certificates of Specialization and provides the fastest path to employment for students targeting the inspection sector. Combined with the Part 107 certification from AERO 100 and the Level 1 thermography certification pathway in AERO 120, graduates hold two industry credentials that are standard requirements for inspection positions.

*Career pathways:* Utility inspection (PG&E, other IOUs), solar installation assessment, building inspection, insurance documentation, cell tower inspection.

== UAS Agriculture

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [AERO 1XX], [Agricultural UAS Applications (proposed)], [3.0], [Aerospace],
  [AGPS 241], [Introduction to Soil Science], [3.0], [Agriculture],
  table.footer([], [*Total*], [*9.0*], []),
)

_Note: The agricultural UAS course is proposed for Phase 2 development. The course number is a placeholder._

This specialization addresses the growing use of drones in precision agriculture for crop health assessment, pesticide and fertilizer application planning, irrigation management, and remote sensing. A new AERO course focused on agricultural applications would cover multispectral imaging, vegetation indices (NDVI), prescription map generation, and spray drone operations. Pairing it with AGPS 241 (Introduction to Soil Science) gives students the agronomic context to interpret the data their drone flights produce.

GEOL 234 (Remote Sensing, 3 units) could serve as an alternative or additional course in this track. Remote sensing principles are directly applicable to agricultural drone work, and the course already exists within the GIS certificate program. AGPS 242 (Introduction to Plant Science) is another candidate for inclusion. The final course selection should be developed in consultation with the Agriculture department to ensure the strongest alignment with regional industry needs.

San Luis Obispo County's wine, vegetable, and cattle operations represent a practical local market, and California's regulatory environment around agricultural drone use is evolving rapidly, creating demand for trained operators who understand both the technology and the agronomic context.

*Career pathways:* Precision agriculture service providers, farm management, vineyard and orchard monitoring, agricultural consulting, crop insurance documentation.

== UAS Videography

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [FTVE 221], [Introduction to Electronic Media], [3.0], [Film/TV/Electronic Media],
  [FTVE 225B], [Single Camera TV Production and Editing], [3.0], [Film/TV/Electronic Media],
  table.footer([], [*Total*], [*9.0*], []),
)

_Note: FTVE course numbers and units should be confirmed with the Languages and Communication division. FTVE 223 (Introduction to Motion Picture and TV Production) may be a better fit depending on its current content._

This specialization pairs drone flight skills with video production and post-production fundamentals. Aerial videography is among the most visible commercial applications of drones, serving real estate marketing, event coverage, documentary production, tourism promotion, and social media content creation. Rather than developing new videography curriculum within the AERO prefix, this track leverages Cuesta's existing FTVE program, which already covers camera operation, composition, editing, and production workflows.

The collaboration benefits both programs. FTVE students gain a compelling new tool for their production work, while AERO students gain the visual storytelling and technical post-production skills that distinguish professional aerial videographers from hobbyists. The FTVE department may also find that drone capabilities attract new students to their existing courses.

*Career pathways:* Real estate media, event and wedding videography, tourism and destination marketing, documentary and news production, social media content creation, corporate video.

= Certificate of Achievement: UAS Technology

The Certificate of Achievement is the program's comprehensive workforce credential, designed for students who want broad competency across multiple UAS application areas. Cuesta currently offers 63 Certificates of Achievement with a median of 19.5 units. The proposed structure falls within the institutional sweet spot of 15 to 20 units identified in the certificate landscape analysis.

== Proposed Structure

=== Required Core (8.0 units)
#table(
  columns: (auto, 1fr, auto),
  align: (left, left, center),
  table.header([*Course*], [*Title*], [*Units*]),
  [AERO 100], [Basic UAV Operator], [3.0],
  [AERO 110], [Drone Mapping and Photogrammetry], [2.0],
  [AERO 120], [Thermal Imaging and Applied Inspection], [3.0],
)

=== Electives (select 9 units from the following)
#table(
  columns: (auto, 1fr, auto),
  align: (left, left, center),
  table.header([*Course*], [*Title*], [*Units*]),
  [GEOG 230], [Introduction to Geographic Information Systems], [3.0],
  [GEOL 231], [Advanced GIS], [3.0],
  [GEOL 234], [Remote Sensing], [3.0],
  [CJ 202], [Introduction to Criminal Justice], [3.0],
  [AGPS 241], [Introduction to Soil Science], [3.0],
  [AGPS 242], [Introduction to Plant Science], [3.0],
  [FTVE 221], [Introduction to Electronic Media], [3.0],
  [FTVE 225B], [Single Camera TV Production and Editing], [3.0],
  [AERO 1XX], [Agricultural UAS Applications (when available)], [3.0],
)

=== Total: 17.0 units (8.0 core + 9.0 elective)

This structure ensures every graduate has both mapping and inspection competency from the three AERO courses, then allows specialization through the elective block. Students who have already earned a Certificate of Specialization will find that their coursework counts directly toward the Certificate of Achievement, creating a natural stacking pathway with no wasted units.

The elective list draws entirely from existing courses at the college (with the exception of the future agricultural AERO course), which means no new curriculum development is required in partner departments. Students are free to mix electives across disciplines or concentrate in a single area, depending on their career goals.

At 17.0 units, the certificate is comparable to Cloud Computing (16.0 units), Audio Technology I (16.0 units), Welding Technology (18.5 units), and Farm Management (18.0 units), all successful CTE certificates at Cuesta.

= Stacking Model

The following diagram illustrates how credentials build on each other:

#align(center)[
  #block(width: 85%, fill: luma(248), inset: 1.2em, radius: 4pt, stroke: 0.5pt + luma(200))[
    #set text(size: 10pt)
    #set par(spacing: 1em)
    *Level 1 -- Foundation* \
    AERO 100: Basic UAV Operator (3 units) \
    _FAA Part 107 certification preparation_

    #line(length: 100%, stroke: 0.5pt + luma(180))

    *Level 2 -- Certificate of Specialization* (6--9 units) \
    AERO 100 + one applied course + one partner department course \
    _Five tracks: Mapping, Public Safety, Inspection, Agriculture, Videography_

    #line(length: 100%, stroke: 0.5pt + luma(180))

    *Level 3 -- Certificate of Achievement* (17 units) \
    All three AERO courses + 9 units of electives \
    _Comprehensive UAS Technology credential_
  ]
]

This mirrors the Child Development model (Associate Teacher feeds into Teacher, which feeds into Master Teacher) and the Business Career Track model (common core feeds into concentration-specific certificates). Students enter at AERO 100, earn a specialization certificate with one additional semester of coursework, and can continue to the full Certificate of Achievement with one more semester. The entire pathway from entry to the comprehensive credential can be completed in three semesters, or two semesters for students who take a heavier course load.

Every course taken at the specialization level counts toward the Certificate of Achievement. A student who earns the UAS Mapping specialization (8 units) has already completed 8 of the 17 units required for the Certificate of Achievement. This zero-waste stacking approach encourages completion and reduces time to credential.

= Cross-Enrollment Opportunities

A key advantage of this structure is that it creates enrollment pipelines between departments. The following existing courses serve double duty, appearing in both a UAS certificate and their home program's certificate or degree:

#table(
  columns: (auto, 1fr, auto),
  align: (left, left, left),
  table.header([*Course*], [*UAS Certificate Role*], [*Also Serves*]),
  [GEOG 230], [UAS Mapping specialization + C.A. elective], [GIS Certificate of Achievement (12 units)],
  [GEOL 231], [C.A. elective], [GIS Certificate of Achievement],
  [GEOL 234], [C.A. elective], [GIS Certificate of Achievement],
  [CJ 202], [UAS Public Safety specialization + C.A. elective], [A.A.-T. Administration of Justice],
  [AGPS 241], [UAS Agriculture specialization + C.A. elective], [A.S.-T. Agriculture Plant Science],
  [FTVE 221], [UAS Videography specialization + C.A. elective], [A.S.-T. Film, Television, and Electronic Media],
)

This cross-pollination is standard practice at Cuesta. The certificate landscape analysis found 160 distinct courses appearing in more than one certificate program. By designing the UAS certificates to incorporate existing courses rather than creating parallel curriculum, the program contributes enrollment to partner departments while drawing students from those disciplines into AERO coursework.

= Institutional Precedent

This proposal does not introduce a new structural pattern. It applies models the college already uses successfully.

#table(
  columns: (auto, auto),
  align: (left, left),
  table.header([*Design Element*], [*Existing Precedent*]),
  [Common core branching into specialization tracks], [Business Administration Career Track],
  [Stackable credentials from small to large], [Child Development (Associate Teacher to Site Supervisor)],
  [Nested certificates where smaller feeds into larger], [Aviation Mechanic (General to Airframe & Powerplant)],
  [Cross-departmental course sharing], [160 courses appear in multiple certificate programs],
  [Certificates of Specialization at 6--9 units], [23 existing certificates, median 6.0 units],
  [Certificates of Achievement at 15--20 units], [Institutional sweet spot for CTE credentials],
)

The Aviation Mechanic program within the same department is the closest analog. AVMT 110 and AVMT 120 form the General certificate (12 units), which stacks into Airframe (30 units) and Powerplant (30 units), which combine into the full Airframe & Powerplant certificate (48 units). The UAS program applies this same nesting logic at a smaller scale appropriate to an emerging field.

= Next Steps

This proposal outlines the structural framework. The following items need resolution before formal submission:

+ *Confirm course numbers and units.* AERO 110 unit count (2.0 vs. 3.0) is still under discussion. The agricultural course needs a number and formal scope.

+ *Secure departmental buy-in.* Conversations with Geography, Criminal Justice, Agriculture, and FTVE faculty will confirm the specific courses for each specialization and ensure those departments support cross-listing their courses in UAS certificates. The AERO 110 COR already identifies GEOG 230 as an advisory, so that relationship is partially established.

+ *Confirm FTVE course details.* The specific FTVE courses best suited for the Videography track should be confirmed with the Languages and Communication division. FTVE 223 (Introduction to Motion Picture and TV Production) may be preferable to or interchangeable with FTVE 225B.

+ *Develop agricultural course proposal.* The agricultural UAS course is Phase 2, but its outline should begin in consultation with Agriculture faculty to identify the right content scope and the appropriate companion courses.

+ *Draft program-level outcomes.* Each certificate needs 3 to 5 measurable outcomes. The institutional norm is to focus on specific competencies employers expect.

+ *Submit through CurriQunet.* Course Outline Reports for AERO 110 and AERO 120 are drafted. Certificate program proposals are a separate submission that references the approved courses.
