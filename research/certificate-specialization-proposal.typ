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

The interdisciplinary nature of drone operations is a strength. By pairing AERO courses with existing offerings in Geography, Agriculture, Art, and Film/Television, the program creates cross-enrollment pathways that serve students from multiple disciplines while strengthening the enrollment base for all participating departments.

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

Two new courses are in active development, with Course Outline Reports drafted and ready for review. Two additional courses are proposed for future phases.

== Phase 1 Courses

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Format*]),
  [AERO 110], [Drone Mapping and Photogrammetry], [2.0], [1 hr lecture / 4 hr lab],
  [AERO 120], [Thermal Imaging and Applied Inspection], [3.0], [2 hr lecture / 3 hr lab],
)

AERO 110 covers RTK positioning, ground control point methodology, photogrammetry processing, and professional deliverable production. The course prepares students for mapping positions in surveying, construction, environmental monitoring, and civil engineering.

AERO 120 covers infrared theory, thermal camera operation, image interpretation, infrastructure inspection, and public safety operations including search and rescue. The course aligns with Level 1 thermography certification requirements and prepares students for employment in utility inspection and public safety.

== Phase 2 Courses

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Status*]),
  [AERO 1XX], [Multispectral Imaging and Crop Monitoring], [2.0--3.0], [Proposed],
  [AERO 1XX], [Agricultural Spray Operations], [2.0--3.0], [Proposed],
)

The two agricultural courses address distinct segments of the agricultural drone market that require different equipment, different regulatory frameworks, and different skill sets. They are discussed in detail under the Agriculture specializations below.

= Certificates of Specialization

Certificates of Specialization are Cuesta's smallest credential, typically consisting of two to four courses totaling 3 to 12 units. The college currently offers 23 of these certificates, with a median of 6.0 units. They target a single employable skill and are designed for quick completion. Four specializations are proposed for the UAS program, each combining the AERO foundation with courses from partner departments.

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

== UAS Inspection

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [AERO 120], [Thermal Imaging and Applied Inspection], [3.0], [Aerospace],
  table.footer([], [*Total*], [*6.0*], []),
)

This specialization targets the infrastructure inspection and public safety sectors, unified by thermal imaging as the core technical skill. AERO 120 covers electrical infrastructure inspection, solar panel assessment, building envelope analysis, professional reporting workflows aligned with California utility regulations (General Orders 95 and 165), and public safety applications including search and rescue, fire assessment, and incident command integration.

PG&E alone operates over 80 drone pilots daily and completed more than 300,000 inspections in 2024, making utility inspection the single largest local employer of drone operators in our region. The job market research confirms that infrastructure inspection is the dominant civilian employment pathway for thermal imaging skills. Public safety drone positions, by contrast, are typically filled by existing sworn personnel who add drone certification to their skillset rather than by external hires. AERO 120 serves both populations: students targeting civilian inspection careers and working first responders seeking professional development in thermal drone operations.

At 6.0 units and two courses, this certificate matches the institutional median for Certificates of Specialization and provides the fastest path to employment. Combined with the Part 107 certification from AERO 100 and the Level 1 thermography certification pathway in AERO 120, graduates hold two industry credentials that are standard requirements for inspection positions.

*Career pathways:* Utility inspection (PG&E, other IOUs), solar installation assessment, building inspection, insurance documentation, cell tower inspection, public safety agencies (for existing personnel adding drone skills).

== UAS Agriculture

Agricultural drone work splits into two distinct disciplines that require different equipment, different certifications, and different knowledge bases. Rather than combining them into a single overloaded course, the program proposes two separate tracks. Both are Phase 2 offerings that should be developed in consultation with the Agriculture department.

=== Crop Monitoring Track

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [AERO 1XX], [Multispectral Imaging and Crop Monitoring], [2.0--3.0], [Aerospace],
  [AGPS 242], [Introduction to Plant Science], [3.0], [Agriculture],
  table.footer([], [*Total*], [*8.0--9.0*], []),
)

This track focuses on using multispectral drones to assess crop health, identify stress patterns, detect pest and irrigation issues, and generate prescription maps for variable-rate applications. The proposed AERO course would cover multispectral sensor operation, vegetation index calculation (NDVI and related indices), flight planning for agricultural missions, and data analysis workflows. It would borrow foundational mapping concepts from AERO 110 -- flight planning, basic orthomosaic production, coordinate systems -- but with a lighter treatment of ground control points and RTK positioning, focusing instead on the multispectral interpretation and agronomic analysis that distinguish this work. Color orthomosaic production would be covered as supporting context rather than as the primary deliverable.

Pairing the drone course with AGPS 242 (Introduction to Plant Science) gives students the agronomic foundation to interpret what the imagery is telling them. Understanding plant structures, physiology, and crop management is essential context for translating vegetation indices into actionable recommendations. This keeps the certificate efficient -- students do not need the full mapping course or the full remote sensing course to be productive in agricultural monitoring.

Equipment would require a multispectral-capable drone (DJI Mavic 3 Multispectral or equivalent, approximately \$6,500) in addition to the existing fleet. No additional FAA certifications beyond Part 107 are required.

*Career pathways:* Precision agriculture consulting, vineyard and orchard monitoring, farm management technology, agricultural research, crop insurance documentation.

=== Spray Operations Track

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [AERO 1XX], [Agricultural Spray Operations], [2.0--3.0], [Aerospace],
  [AGPS 242], [Introduction to Plant Science], [3.0], [Agriculture],
  table.footer([], [*Total*], [*8.0--9.0*], []),
)

This track addresses the highest-revenue segment of agricultural drone work: aerial application of herbicides, fungicides, insecticides, and fertilizers. The proposed AERO course would cover spray drone operation, calibration and nozzle selection, drift management, chemical handling safety, and the regulatory stack required for legal operation in California: FAA Part 137 (Agricultural Aircraft Operator Certificate), the 44807 exemption for aircraft over 55 lbs, and the California QAC/QAL pesticide applicator license.

This track requires substantially different equipment and carries higher costs than other specializations. Commercial spray drones (DJI Agras T40/T50, Hylio AG272) cost \$20,000--\$30,000, and the regulatory pathway is more complex. However, the earning potential is significant: contract spraying rates of \$10--\$30 per acre translate to peak-season revenues of several thousand dollars per day for operators with their own equipment. The Salinas Valley has recently seen commercial drone spraying operations launch, and vineyard spraying on the Central Coast represents a growing niche.

The spray operations course could also be structured as a continuing education offering for students who have already completed other AERO courses and want to add this specialization. Part 137 certification, in particular, may be better suited as a post-program add-on than as an embedded requirement, allowing students to complete a foundational certificate first and pursue spray certification as their career develops.

*Career pathways:* Agricultural spraying service providers, farm operations, vineyard management, agricultural cooperatives, independent contract spraying.

== UAS Videography

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [ART 249A], [Digital Photography I], [3.0], [Art],
  [FTVE 225B], [Single Camera TV Production and Editing], [3.0], [Film/TV/Electronic Media],
  table.footer([], [*Total*], [*9.0*], []),
)

This specialization pairs drone flight skills with the visual composition and video production fundamentals that distinguish professional aerial videographers from hobbyists. ART 249A covers the technical and aesthetic foundations -- exposure, composition, the elements of design, and camera technology in a digital context. FTVE 225B builds on those fundamentals with hands-on single-camera video production: scripting, shooting on location, portable lighting, audio, editing, and post-production. Together these courses give students both still image composition skills and motion video production capability alongside the drone operation skills from AERO 100.

Rather than developing new videography curriculum within the AERO prefix, this track leverages two existing courses from partner departments. The collaboration benefits all three programs: Art and FTVE students gain a compelling new tool for their production work, while AERO students gain skills that are otherwise absent from the drone curriculum. Both ART 249A and FTVE 225B are existing courses with no prerequisites beyond AERO 100, keeping the path to certification efficient.

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
  [AGPS 242], [Introduction to Plant Science], [3.0],
  [ART 249A], [Digital Photography I], [3.0],
  [FTVE 225B], [Single Camera TV Production and Editing], [3.0],
  [AERO 1XX], [Multispectral Imaging and Crop Monitoring (when available)], [3.0],
  [AERO 1XX], [Agricultural Spray Operations (when available)], [3.0],
)

=== Total: 17.0 units (8.0 core + 9.0 elective)

This structure ensures every graduate has both mapping and inspection competency from the three AERO courses, then allows specialization through the elective block. Students who have already earned a Certificate of Specialization will find that their coursework counts directly toward the Certificate of Achievement, creating a natural stacking pathway with no wasted units.

The elective list draws primarily from existing courses at the college, which means no new curriculum development is required in partner departments. Students are free to mix electives across disciplines or concentrate in a single area, depending on their career goals.

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
    _Four tracks: Mapping, Inspection, Agriculture, Videography_

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
  [AGPS 242], [UAS Agriculture specializations + C.A. elective], [A.S.-T. Agriculture Plant Science],
  [ART 249A], [UAS Videography specialization + C.A. elective], [Photography Certificate of Achievement (17 units)],
  [FTVE 225B], [UAS Videography specialization + C.A. elective], [A.S.-T. Film, Television, and Electronic Media],
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

+ *Confirm course numbers and units.* AERO 110 unit count (2.0 vs. 3.0) is still under discussion. The agricultural courses need numbers and formal scope.

+ *Secure departmental buy-in.* Conversations with Geography, Agriculture, Art, and FTVE faculty will confirm the specific courses for each specialization and ensure those departments support including their courses in UAS certificates. The AERO 110 COR already identifies GEOG 230 as an advisory, so that relationship is partially established.

+ *Develop agricultural course proposals.* The two agricultural courses (crop monitoring and spray operations) need Course Outline Reports developed in consultation with Agriculture faculty. The crop monitoring course can borrow foundational content from AERO 110 while focusing on multispectral workflows. The spray operations course requires coordination with California DPR for applicator training alignment and a significant equipment investment decision.

+ *Draft program-level outcomes.* Each certificate needs 3 to 5 measurable outcomes. The institutional norm is to focus on specific competencies employers expect.

+ *Submit through CurriQunet.* Course Outline Reports for AERO 110 and AERO 120 are drafted. Certificate program proposals are a separate submission that references the approved courses.
