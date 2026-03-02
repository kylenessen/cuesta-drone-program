#import "../equipment-purchasing/cuesta-memo.typ": cuesta-memo

#show: body => cuesta-memo(
  title: "Proposed Certificate Structure for UAS Program",
  audience: "Ron Overacker",
  author: "Kyle Nessen",
  date: "February 2026",
  logo: "../equipment-purchasing/images/CuestaLogo-H-FC-Black.png",
  body: body,
)

= Overview

This document proposes a set of stackable certificates for Cuesta College's proposed UAS (Unmanned Aircraft Systems) program. The structure uses a common foundation course, AERO 100: Basic UAV Operator, as the entry point for all certificate tracks. From that foundation, students select a specialization aligned with their career interests, earning a Certificate of Specialization. Students who complete multiple specializations or a broader set of coursework earn a Certificate of Achievement, the program's primary credential.

The design follows the same branching pattern used by Cuesta's Business Administration program, where a shared Career Track Core certificate leads into concentration-specific credentials in Accounting, Marketing, Small Business Management, and other fields. The UAS program works similarly: a common foundation branches into application-specific specializations, and students who complete a broader set of coursework earn a larger Certificate of Achievement. The result is a shallow and broad structure, one entry point leading to several focused credentials, with a deeper pathway for students who continue.

Drone operations are by their nature interdisciplinary, which creates opportunities to collaborate with other departments within the certificates of specialization. By pairing AERO courses with existing offerings in Geography, Agriculture, Art, and Film/Television, the program creates cross-enrollment pathways that serve students from multiple disciplines while strengthening the enrollment base for all participating departments.

#pagebreak()

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

I am proposing four new courses for the UAS program. Each subsection describes the course purpose, what is needed to bring it to offering, and open questions for discussion. AERO 110 and AERO 120 have Course Outline Reports drafted and ready for review. The two agricultural courses (AERO 130 & AERO 140) are earlier in development and will require additional collaboration before formal proposals are written. Course numbers are placeholders for internal discussion and can be adjusted as needed.

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*COR Status*]),
  [AERO 110], [Drone Mapping and Photogrammetry], [3.0], [Drafted],
  [AERO 120], [Thermal Imaging and Applied Inspection], [3.0], [Drafted],
  [AERO 130], [Multispectral Imaging and Crop Monitoring], [3.0], [Not started],
  [AERO 140], [Agricultural Spray Operations], [3.0], [Not started],
)

== AERO 110: Drone Mapping and Photogrammetry

=== Purpose

Drone mapping and photogrammetry represent the largest commercial drone employment sector. The job market research estimates the mapping and surveying sector offers salaries in the \$60,000--150,000 range, with construction-focused positions typically falling between \$90,000 and \$110,000. This course teaches students to plan and execute professional mapping missions, from RTK positioning and ground control point methodology through photogrammetry processing and deliverable production. Students produce orthomosaics, digital elevation models, and volumetric calculations meeting professional specifications. The course prepares graduates for positions in surveying firms, construction companies, environmental consulting, civil engineering, and county planning departments.

This is the course closest to ready. I have extensive professional experience in drone mapping and photogrammetry, plenty of ideas for curriculum content, and much of the core equipment is in hand.

=== What It Takes to Offer

*Equipment on hand:*
- DJI Matrice 4E mapping drone (secured through separate funding)
- DJI training fleet (Mini 3s and Air 3s for AERO 100, which build prerequisite flight skills)

*Equipment needed:*
- Emlid Reach RS4 base station (\$3,900) and Reach RX2 rover (\$2,400) for RTK positioning
- Base and rover accessories kit including tripod, tribrach, survey pole, and bipod (\$1,294)
- Ground control point targets and survey markers
- Additional Matrice 4E batteries and field charging infrastructure for extended mapping sessions

The Emlid GNSS equipment is recommended for immediate purchase, as detailed in the December 2025 equipment memo (attached as an appendix). Total RTK investment is approximately \$7,594 before tax. This equipment also supports professional field work and course material development ahead of the first offering.

*Facilities needed:*
- Computer lab with workstations capable of running photogrammetry processing software. Metashape requires a dedicated GPU, 32+ GB of RAM, and substantial storage. Processing a typical student dataset takes 30--60 minutes on an adequate machine.
- Open outdoor areas with varied terrain for mapping exercises. The SLO Flyers club flying field (https://www.sloflyers.com/) adjacent to Cuesta's SLO campus is well suited for this purpose. It is within walking distance, designated as an FAA FRIA (FAA-Recognized Identification Area), and has tables and seating for students. The field is shared with the RC flying community, and the property is owned by Cal Poly, so access arrangements would need to be worked out with both groups.

*Software needed:*
- Agisoft Metashape for photogrammetry processing (orthomosaics, DEMs, volumetrics). Agisoft offers educational licensing, which should be explored. Metashape handles the full processing pipeline and is the only dedicated processing software required for this course.
- GIS software for viewing, analyzing, and exporting spatial data. We should check with Cuesta's GIS faculty about whether the college already holds ArcGIS licenses through Esri's institutional agreements. If so, AERO students could share that access. If not, QGIS is a capable open-source alternative.
- Emlid Flow for RTK survey operations on mobile devices. Free with Emlid hardware.

=== Open Questions

+ Computer lab availability: My ideal setup is an existing computer lab with machines that can handle Metashape reasonably well, enough storage for a semester's worth of student projects (which can be purged between terms), and a perpetual educational license that is not node-locked. Is there an existing lab that meets these requirements, or what is the pathway to securing one?

+ GIS software licensing: Has Cuesta's GIS program already secured ArcGIS licensing that AERO students could access? This is worth confirming before purchasing anything separately.

== AERO 120: Thermal Imaging and Applied Inspection

=== Purpose

Thermal imaging and visual inspection from drones serve two major employment sectors: infrastructure inspection and public safety. This course could cover infrared theory, thermal camera operation, image interpretation, high-zoom visual inspection techniques, and professional reporting for both sectors. Potential topics include identifying thermal anomalies in electrical systems, building envelopes, and solar installations; using high-zoom cameras to inspect structural features and locate people; and applying these skills to search and rescue, fire assessment, and law enforcement support operations. The course would align with Level 1 thermography certification requirements, an industry credential that significantly enhances employment prospects.

PG&E represents the single largest local employer of drone operators, with 80+ pilots deployed daily and over 300,000 inspections completed in 2024. Entry-level inspection positions pay \$22--48/hour, with experienced inspectors earning \$65,000--85,000 annually. The combination of Part 107 certification (from AERO 100) and thermography certification positions graduates competitively for these roles. Public safety applications serve a different audience, primarily working first responders adding drone skills, and represent a continuing education market.

It is worth noting that the Matrice 4T is a dual-payload drone: it carries both a thermal sensor and a high-zoom visual camera. Infrastructure inspection and search-and-rescue operations rely on both capabilities. The course should teach students to use the full sensor suite.

This course requires more instructor development than AERO 110. I have some foundational thermal imaging knowledge but less direct professional experience in this area compared to mapping. Curriculum development will benefit from partnership with industry practitioners, particularly from the utility inspection and public safety sectors.

=== What It Takes to Offer

*Equipment on hand:*
- DJI Matrice 4T with thermal and zoom payloads (secured through separate funding). This drone aligns with PG&E's equipment standards, which is a meaningful advantage for students targeting utility inspection careers.

*Equipment needed:*
- Thermal calibration targets and controlled heat sources for training scenarios
- Laptop or workstation with thermal analysis software
- Additional Matrice 4T batteries for extended field sessions (can be shared with Matrice 4E)
- Safety equipment for operations near infrastructure (high-visibility gear, communication radios)

The equipment investment for this course is substantially lower than for mapping, since the primary drone is already in hand and the software requirements are less demanding than photogrammetry processing.

*Facilities needed:*
- Access to buildings and infrastructure for inspection exercises. Campus buildings could serve as initial training sites for building envelope assessment. Or the Fire Department training site near SLO's campus. #comment[Please edit this end sentence if necessary. There is a site nearby where fire fighters train. It would require coordination of course.]
- Suitable outdoor areas with controlled access for night operations (SAR exercises). Night flight adds logistical complexity that needs advance planning.

*Software needed:*
- DJI Thermal Analysis Tool (free with DJI hardware)
- FLIR Thermal Studio or similar advanced analysis software
- DJI Pilot 2 for flight operations

*Partnerships to explore:*
- PG&E for curriculum review, equipment standards alignment, and potential hiring pipeline development. Their Paso Robles drone dock operations are local. No contact has been made yet.
- CAL FIRE or SLO County Fire for public safety module input, exercise scenarios, and potential guest instruction. Also no existing relationship.
- Local solar installations for panel inspection training sites. Cal Poly and the California Men's Colony both have small solar operations that may be open to hosting student flights.

*Instructor development:*
- Level 1 thermography certification for myself. Training costs \$1,500--\$5,000 and would strengthen both teaching credibility and the program's relationship with certification bodies.
- Ride-along or observation time with utility inspection operations to build firsthand understanding of professional workflows.
- Consultation with public safety agencies on incident command integration and operational protocols.

*Drone insurance:* This course raises a broader question that applies to the entire program: what does liability insurance look like in the context of Cuesta College drone operations? Flying near buildings, infrastructure, and people carries different risk than open-field mapping. This needs investigation regardless of which courses we offer.

=== Open Questions

+ Night operations logistics: SAR #comment[Do we define SAR anywhere? What does this mean?] exercises would require nighttime flight. I do not yet know what is involved in conducting night flights legally and safely in an educational setting. What are the insurance, facility access, and regulatory considerations for night lab activities on or near campus?

+ Public safety scope: The COR currently combines infrastructure inspection and public safety in one course. The job market research suggests infrastructure inspection is the stronger employment pathway. Most public safety drone positions go to existing personnel rather than external hires. Should the balance shift more toward inspection with public safety as a supporting module?

+ Continuing education audience: Working firefighters and law enforcement represent a potential audience for the public safety material. Would evening and weekend scheduling make sense for this course? And does the inspection content serve that audience, or are they primarily interested in the public safety module?

+ Thermography certification integration: Could the college partner with Infraspection Institute or the Infrared Training Center #comment[What are these instituitions? Are they local? National?] to offer Level 1 certification as part of or alongside this course? This would add significant value for students.

== AERO 130: Multispectral Imaging and Crop Monitoring

=== Purpose

This course teaches students to use multispectral drones for precision agriculture: assessing crop health, identifying stress patterns, detecting pest and irrigation issues, and generating prescription maps for variable-rate fertilizer and chemical application. The agricultural drone market is the fastest-growing segment of commercial UAS operations, with some projections suggesting 80% of future drone usage could come from agriculture.

The course borrows foundational mapping concepts from AERO 110: flight planning, basic orthomosaic production, coordinate systems, but shifts the focus to multispectral sensor operation, vegetation index calculation (NDVI and related indices), and agronomic data interpretation. Ground control points and RTK positioning receive lighter treatment than in AERO 110, since the accuracy requirements for crop monitoring are less stringent than for survey-grade mapping #comment[Is this true?]. Color orthomosaic production is covered as supporting context rather than as the primary deliverable. The emphasis is on getting students efficiently to the point where they can fly a multispectral mission, process the data, interpret the results, and communicate findings to a grower.

=== What It Takes to Offer

*Equipment needed:*
- Multispectral-capable drone. The DJI Mavic 3 Multispectral (approximately \$6,500) is purpose-built for agricultural monitoring, with an integrated multispectral camera capturing red, green, red edge, and near-infrared bands alongside a standard RGB camera. This is a separate purchase from the existing fleet. The Matrice 4T's thermal sensor captures different wavelengths than a multispectral sensor and cannot substitute for it.
- Batteries and accessories for field operations. Battery compatibility with the existing Matrice fleet needs to be confirmed.

*Software needed:*
- Agisoft Metashape handles the full multispectral processing pipeline, including vegetation index generation, orthomosaic production, and prescription map outputs. This is the same software used in AERO 110, so no additional processing software is required.

*Facilities needed:*
- Access to agricultural land for flight exercises. SLO County's vineyards, vegetable operations, and Cal Poly's agricultural facilities are potential sites.
- Computer lab access (shared with AERO 110).

*Departmental collaboration:*
- Agriculture department for AGPS 242 alignment and access to agricultural sites. Agriculture faculty input on which crop systems and management practices are most relevant to the Central Coast region.
- Geography/Geology department if students also pursue GEOL 234 (Remote Sensing) as an elective.

*Instructor development:*
- I have experience with multispectral data collection and understand the processing principles, but I need to better understand how the outputs get applied to real decisions on the ground. Conversations with local growers and vineyard managers would help shape the curriculum around actual workflows rather than theoretical applications. This could be developed through partnerships with local vineyards or agricultural technology companies before the course launches.

=== Open Questions

+ Prerequisites: Should AERO 110 (Mapping) be a prerequisite, an advisory, or neither? Requiring it creates a longer path to the agriculture certificate. Making it an advisory signals that mapping background is valuable without creating a barrier. Borrowing content from AERO 110 into this course eliminates the dependency entirely, which is the current proposal.

+ Agriculture department buy-in: What is the appetite in the Agriculture department for collaboration? Do they see drone technology as relevant to their students?

+ Agricultural field access: Can we secure access to working agricultural operations for flight exercises? Cal Poly's research farms, local vineyards, or SLO County agricultural operations are all possibilities.

+ Regional market: Is the Central Coast agricultural market large enough to justify this course on local employment alone, or is this preparing students for statewide opportunities (Central Valley, Salinas Valley)?

== AERO 140: Agricultural Spray Operations

=== Purpose

Agricultural spraying represents the highest-revenue segment of agricultural drone work. This course would cover spray drone operation, calibration and nozzle selection, drift management, chemical handling safety, and the regulatory stack required for legal operation in California. Graduates would be positioned for employment with agricultural spraying service providers, farm operations, and independent contract spraying.

This course is the most complex to bring to offering. The equipment is expensive, the regulatory requirements are extensive, and the instructor development gap is significant. It is included here because the market opportunity is real and growing. Contract spraying rates of \$10--\$30 per acre translate to significant earning potential, and the Salinas Valley has recently seen commercial drone spraying operations launch. Whether this course is offered as part of the certificate program or as a standalone continuing education offering is an open question.

Realistically, this course would benefit from bringing in an adjunct instructor with direct spray operations experience. I would be happy to support the course development and provide the drone operations foundation, but the spray-specific expertise, certifications (Part 137, QAC/QAL), and practical knowledge should come from someone actively working in the field. If the drone program builds enough enrollment to justify expansion, recruiting an adjunct for this course is a more practical path than developing the expertise in-house.

=== What It Takes to Offer

*Equipment needed:*
- Commercial spray drone such as the DJI Agras T40/T50 or Hylio AG272 (\$20,000--\$30,000). These aircraft exceed 55 lbs loaded, which triggers additional FAA requirements.
- Calibration equipment for nozzle testing and flow rate verification.
- PPE for chemical handling.

The equipment investment is the highest of any proposed course by a wide margin.

*Certifications and regulatory alignment:*
Students completing this course would need to pursue a stack of certifications beyond Part 107:
- FAA Part 137: Agricultural Aircraft Operator Certificate (the same certification required for manned crop dusters). Application approval takes 2--4 months.
- 44807 Exemption: Required for drones over 55 lbs. Must be included in the Part 137 exemption request.
- California QAC/QAL License: State pesticide applicator certification issued by the California Department of Pesticide Regulation. Requires passing exams on laws, regulations, and pest control principles.
- County Registration: Annual registration with each county of operation for legal pesticide application.

The course would need to align with DPR requirements to ensure students are prepared for the state licensing exams.

*Facilities needed:*
- For training purposes, spray exercises could be conducted using water at the SLO Flyers field (https://www.sloflyers.com/) or similar open area. This avoids the need for chemical storage, permitted spray sites, and decontamination facilities during the learning phase. Students would learn calibration, flight patterns, drift management, and operational procedures with water loads, then apply those skills with actual chemicals in professional settings after obtaining their certifications.

*Departmental collaboration:*
- Agriculture department for pesticide application standards, safety protocols, and context on local agricultural needs.
- Coordination with California DPR for applicator training alignment.

=== Open Questions

+ Offering format: Should this be a credit course within the certificate program, or a standalone continuing education offering for operators who already hold Part 107? The regulatory complexity and equipment cost may be better suited to a focused continuing education format.

+ Equipment funding: The spray drone alone costs \$20,000--\$30,000. Is this justifiable given the potential enrollment, or would a partnership with an agricultural operator who already owns the equipment be more practical?

+ Liability: Spray operations carry different liability considerations than mapping or inspection flights, even when training with water. What are the insurance implications for the college?

+ Timing: The core program (AERO 100, 110, 120) should be established and running before this course makes sense. What enrollment and completion benchmarks should trigger development of this offering?

+ Industry partnerships: Are there agricultural spraying companies in the region willing to provide equipment access, guest instruction, or supervised field experience? This could reduce the upfront investment substantially.

= Certificates of Specialization

Certificates of Specialization are Cuesta's smallest credential, typically consisting of two to four courses totaling 3 to 12 units. They target a single employable skill and are designed for quick completion. Four specializations are proposed for the UAS program, each combining the AERO foundation with courses from partner departments.

== UAS Mapping

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [AERO 110], [Drone Mapping and Photogrammetry], [3.0], [Aerospace],
  [GEOG 230], [Introduction to Geographic Information Systems], [3.0], [Geology/Geography],
  table.footer([], [*Total*], [*9.0*], []),
)

This specialization targets the largest commercial drone employment sector: mapping, surveying, and photogrammetry. Pairing AERO 110 with GEOG 230 gives students both the flight and processing skills to produce professional map products and the GIS foundation to work with the spatial data those products generate. GEOG 230 already exists and is the gateway course for Cuesta's 12-unit GIS Certificate of Achievement, so students in this track also begin progress toward that credential.

The collaboration with the Geology/Geography department is natural. Drone-collected data is central to GIS workflows, and Geography students benefit from understanding how that data is acquired. GEOG 230 is currently listed as an advisory on the AERO 110 Course Outline Report.

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

*Career pathways:* Utility inspection (PG&E and other investor-owned utilities), solar installation assessment, building inspection, insurance documentation, cell tower inspection, public safety agencies (for existing personnel adding drone skills).

== UAS Agriculture

Agricultural drone work splits into two distinct disciplines that require different equipment, different certifications, and different knowledge bases. Rather than combining them into a single overloaded course, the program proposes two separate tracks. Both should be developed in consultation with the Agriculture department.

=== Crop Monitoring Track

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [AERO 130], [Multispectral Imaging and Crop Monitoring], [3.0], [Aerospace],
  [AGPS 242], [Introduction to Plant Science], [3.0], [Agriculture],
  table.footer([], [*Total*], [*9.0*], []),
)

This track focuses on using multispectral drones to assess crop health, identify stress patterns, detect pest and irrigation issues, and generate prescription maps for variable-rate applications. AERO 130 would cover multispectral sensor operation, vegetation index calculation (NDVI and related indices), flight planning for agricultural missions, and data analysis workflows. It borrows foundational mapping concepts from AERO 110 -- flight planning, basic orthomosaic production, coordinate systems -- but with a lighter treatment of ground control points and RTK positioning, focusing instead on the multispectral interpretation and agronomic analysis that distinguish this work. Color orthomosaic production is covered as supporting context rather than as the primary deliverable.

Pairing the drone course with AGPS 242 (Introduction to Plant Science) gives students the agronomic foundation to interpret what the imagery is telling them. Understanding plant structures, physiology, and crop management is essential context for translating vegetation indices into actionable recommendations. This keeps the certificate efficient, students do not need the full mapping course or the full remote sensing course to be productive in agricultural monitoring.

Equipment would require a multispectral-capable drone (DJI Mavic 3 Multispectral or equivalent, approximately \$6,500) in addition to the existing fleet. No additional FAA certifications beyond Part 107 are required.

*Career pathways:* Precision agriculture consulting, vineyard and orchard monitoring, farm management technology, agricultural research, crop insurance documentation.

=== Spray Operations Track

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [AERO 140], [Agricultural Spray Operations], [3.0], [Aerospace],
  [AGPS 242], [Introduction to Plant Science], [3.0], [Agriculture],
  table.footer([], [*Total*], [*9.0*], []),
)

This track addresses the highest-revenue segment of agricultural drone work: aerial application of herbicides, fungicides, insecticides, and fertilizers. AERO 140 would cover spray drone operation, calibration and nozzle selection, drift management, chemical handling safety, and the regulatory stack required for legal operation in California: FAA Part 137 (Agricultural Aircraft Operator Certificate), the 44807 exemption for aircraft over 55 lbs, and the California QAC/QAL pesticide applicator license.

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

This specialization pairs drone flight skills with the visual composition and video production fundamentals that distinguish professional aerial videographers from hobbyists. ART 249A covers the technical and aesthetic foundations: exposure, composition, the elements of design, and camera technology in a digital context. FTVE 225B builds on those fundamentals with hands-on single-camera video production: scripting, shooting on location, portable lighting, audio, editing, and post-production. Together these courses give students both still image composition skills and motion video production capability alongside the drone operation skills from AERO 100.

Rather than developing new videography curriculum within the AERO prefix, this track leverages two existing courses from partner departments. The collaboration benefits all three programs: Art and FTVE students gain a compelling new tool for their production work, while AERO students gain skills that are otherwise absent from the drone curriculum. By the end of AERO 100, students have all the skills necessary to safely and legally operate a drone in most contexts -- it effectively gets them in the sky with a camera. AERO 100 addresses some light camera concepts, but ART 249A and FTVE 225B teach students how to make compelling images and video, which is beyond the scope of the foundation course. Both are existing courses with no prerequisites beyond AERO 100, keeping the path to certification efficient.

*Career pathways:* Real estate media, event and wedding videography, tourism and destination marketing, documentary and news production, social media content creation, corporate video.

= Certificate of Achievement: UAS Technology

The Certificate of Achievement is the program's comprehensive credential, designed for students who want broad competency across multiple UAS application areas. At 15 units, the certificate is comparable in size to Cloud Computing (16.0 units), Audio Technology I (16.0 units), and other successful CTE certificates at Cuesta. The Farm Management certificate (18.0 units) is also worth noting, if the Agriculture department is receptive, agricultural drone courses could potentially count toward their certificate as well.

== Proposed Structure

=== Required Core (3.0 units)
#table(
  columns: (auto, 1fr, auto),
  align: (left, left, center),
  table.header([*Course*], [*Title*], [*Units*]),
  [AERO 100], [Basic UAV Operator], [3.0],
)

=== AERO Electives (select 6 units from the following)
#table(
  columns: (auto, 1fr, auto),
  align: (left, left, center),
  table.header([*Course*], [*Title*], [*Units*]),
  [AERO 110], [Drone Mapping and Photogrammetry], [3.0],
  [AERO 120], [Thermal Imaging and Applied Inspection], [3.0],
  [AERO 130], [Multispectral Imaging and Crop Monitoring], [3.0],
  [AERO 140], [Agricultural Spray Operations], [3.0],
)

=== Supporting Electives (select 6 units from the following)
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
)

=== Total: 15.0 units (3.0 core + 6.0 AERO electives + 6.0 supporting electives)

This structure gives students flexibility to build the certificate around their career interests. A student focused on agriculture takes AERO 130 and 140 alongside AGPS 242, while a student focused on inspection takes AERO 120 alongside GIS coursework. No one is forced through courses that do not serve their goals.

Students who have already earned a Certificate of Specialization will find that their coursework counts directly toward the Certificate of Achievement, creating a natural stacking pathway with no wasted units.

The supporting elective list draws entirely from existing courses at the college, which means no new curriculum development is required in partner departments. Students are free to mix electives across disciplines or concentrate in a single area, depending on their career goals.

== Cross-Enrollment Opportunities

A key advantage of this structure is that it creates enrollment pipelines between departments. The following existing courses serve double duty, appearing in both a UAS certificate and their home program's certificate or degree:

#table(
  columns: (auto, 1fr, auto),
  align: (left, left, left),
  table.header([*Course*], [*UAS Certificate Role*], [*Also Serves*]),
  [GEOG 230], [UAS Mapping specialization + C.A. supporting elective], [GIS Certificate of Achievement (12 units)],
  [GEOL 231], [C.A. supporting elective], [GIS Certificate of Achievement],
  [GEOL 234], [C.A. supporting elective], [GIS Certificate of Achievement],
  [AGPS 242], [UAS Agriculture specializations + C.A. supporting elective], [A.S.-T. Agriculture Plant Science],
  [ART 249A],
  [UAS Videography specialization + C.A. supporting elective],
  [Photography Certificate of Achievement (17 units)],

  [FTVE 225B],
  [UAS Videography specialization + C.A. supporting elective],
  [A.S.-T. Film, Television, and Electronic Media],
)

This kind of cross-pollination is standard practice at Cuesta. Many courses across the college already appear in more than one certificate program. By designing the UAS certificates to incorporate existing courses rather than creating parallel curriculum, the program contributes enrollment to partner departments while drawing students from those disciplines into AERO coursework.
