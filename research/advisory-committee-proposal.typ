#import "../equipment-purchasing/cuesta-memo.typ": cuesta-memo
#let comment(body) = {}

#show: body => cuesta-memo(
  title: "UAS Program Proposal for Industry Advisory Review",
  audience: [Sam, Sully, Madison \ CC: Ron Overacker, Ryan Harvey],
  author: "Kyle Nessen",
  date: "April 2026",
  logo: "../equipment-purchasing/images/CuestaLogo-H-FC-Black.png",
  body: body,
)

= Purpose of This Document

Cuesta College is building a new UAS (Unmanned Aircraft Systems) program, and this document describes the courses and certificates we are planning to offer. It is a working draft and your feedback will directly shape the next revision before we bring the program through the formal approval process.

Three questions in particular would help us most. First, does the coursework described here match the skills you actually hire for or rely on in your own work? Second, is there anything important missing? Third, is anything here pointed in the wrong direction relative to where the industry is heading? A short reaction is useful. Detailed comments on the sections closest to your work are even more useful.

= Program Structure

The program is built around a common entry course, AERO 100: Basic UAV Operator, which prepares students for FAA Part 107 certification and covers regulations, airspace, weather, flight planning, safety, and hands-on flight proficiency to NIST Level 2 standards. This course is already approved and will be the prerequisite for every other course in the program.

From that foundation, students choose a specialization aligned with their career interests and earn a Certificate of Specialization. Students who complete a broader set of coursework earn a Certificate of Achievement, which is the program's comprehensive credential. The design is intentionally shallow and broad: one entry point branching into several focused credentials, with a deeper pathway for students who continue.

Four specialization tracks are proposed: Mapping, Inspection, Agriculture (in two tracks), and Videography. The sections below describe each one. Where a specialization pairs the AERO course with an existing course from another department at Cuesta, that is called out explicitly, since it shapes the skills students bring out of the program.

= Foundation Course

#table(
  columns: (auto, 1fr, auto),
  align: (left, left, center),
  table.header([*Course*], [*Title*], [*Units*]),
  [AERO 100], [Basic UAV Operator], [3.0],
)

AERO 100 is the entry point for every track. By the end of the course, students are Part 107 certified, have logged meaningful stick time, and understand airspace, weather, and mission planning well enough to operate safely as a commercial pilot. This is table stakes, not a differentiator, and everything that follows assumes it.

= UAS Mapping Specialization

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [AERO 110], [Drone Mapping and Photogrammetry], [3.0], [Aerospace],
  [GEOG 230], [Introduction to Geographic Information Systems], [3.0], [Geology/Geography],
)

Mapping is the largest commercial drone employment sector in our region and the specialization closest to ready, largely because I have direct professional experience in it. AERO 110 teaches students to plan and execute mapping missions end to end: RTK positioning and ground control point methodology, flight planning for photogrammetry, and processing through to orthomosaics, digital elevation models, and volumetric calculations at professional specification. Students leave the course able to deliver the kinds of products a surveying firm, construction site, or environmental consultant would actually accept.

Pairing AERO 110 with GEOG 230 gives students the GIS foundation to work with the spatial data those flights produce. It also plugs them into the existing GIS certificate pathway at Cuesta, which strengthens both programs.

Target career pathways include surveying and engineering firms, construction site monitoring, environmental consulting, county and city planning departments, and agricultural technology companies. Typical salaries in this sector run \$60,000 to \$150,000, with construction-focused roles commonly \$90,000 to \$110,000.

= UAS Inspection Specialization

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [AERO 120], [Thermal Imaging and Applied Inspection], [3.0], [Aerospace],
)

AERO 120 covers infrared theory, thermal camera operation, image interpretation, high-zoom visual inspection technique, and professional reporting. The course is designed around dual-payload aircraft that carry both a thermal sensor and a high-zoom visual camera, since inspection work uses both. Target applications include electrical infrastructure, solar installations, building envelope assessment, and structural inspection, with a supporting module on public safety uses such as search and rescue and fire assessment.

The course is structured to align with Level 1 sUAS thermography certification requirements, so students can come out of the program holding both Part 107 and an industry thermography credential. That combination is the one we see named most often in utility and inspection job postings.

PG&E is doing extensive drone-based survey and inspection work across their assets in this region, and we see them as a major industry member we would like to build a partnership with. Aligning the course with the kind of inspection work they rely on is a natural win-win: PG&E gets a local pipeline of trained operators familiar with their standards, and our students get a clear pathway into one of the most active employers of drone pilots in the area. Public safety drone roles, by contrast, are typically filled by existing sworn personnel adding drone skills rather than by external hires, so we are treating that audience more as a continuing education market than as a primary placement pathway.

This is a track where your input would be especially valuable. I have some thermal knowledge but less direct professional experience than on the mapping side, and I would rather build the course around the workflows and standards you actually use than around textbook material.

= UAS Agriculture Specializations

Agricultural drone work splits cleanly into two disciplines with different equipment, different certifications, and different knowledge bases. Rather than cramming them into one overloaded course, we are proposing two separate tracks. Both would be developed in consultation with Cuesta's Agriculture department, and both pair the AERO course with AGPS 242 (Introduction to Plant Science) so students can interpret what they are seeing in the field.

== Crop Monitoring Track

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [AERO 130], [Multispectral Imaging and Crop Monitoring], [3.0], [Aerospace],
  [AGPS 242], [Introduction to Plant Science], [3.0], [Agriculture],
)

AERO 130 focuses on multispectral flight: assessing crop health, identifying stress patterns, detecting pest and irrigation issues, and generating prescription maps for variable-rate applications. Students learn multispectral sensor operation, vegetation index calculation (NDVI and related indices), flight planning for agricultural missions, and analysis workflows that take the imagery through to agronomic recommendations. The treatment of ground control and absolute accuracy is lighter than in the mapping course, since crop work relies on relative differences across a field rather than survey-grade precision.

Target career pathways include precision agriculture consulting, vineyard and orchard monitoring, farm management technology, agricultural research, and crop insurance documentation. No certifications beyond Part 107 are required for this track.

== Spray Operations Track

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [AERO 140], [Agricultural Spray Operations], [3.0], [Aerospace],
  [AGPS 242], [Introduction to Plant Science], [3.0], [Agriculture],
)

AERO 140 covers spray drone operation, calibration and nozzle selection, drift management, chemical handling safety, and the full regulatory stack required in California: FAA Part 137 (Agricultural Aircraft Operator Certificate), the 44807 exemption for aircraft over 55 lbs, and the California QAC/QAL pesticide applicator license. Training flights would use water loads, with students applying actual chemicals in professional settings after they hold their certifications.

This is the most complex track to bring to offering. Commercial spray drones run \$20,000 to \$30,000, the regulatory pathway is long, and the spray-specific expertise is best provided by an adjunct instructor actively working in the field rather than developed in-house. We may structure this track as a continuing education offering for operators who already hold Part 107, rather than a first-entry credential, since the certification stack is better suited to someone who has decided to commit to spray as a career.

The earning potential is why we are including it anyway. Contract spraying at \$10 to \$30 per acre produces meaningful peak-season revenue, and we have seen commercial operations launch in the Salinas Valley and vineyard work expand across the Central Coast.

= UAS Videography Specialization

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, left),
  table.header([*Course*], [*Title*], [*Units*], [*Department*]),
  [AERO 100], [Basic UAV Operator], [3.0], [Aerospace],
  [ART 249A], [Digital Photography I], [3.0], [Art],
  [FTVE 225B], [Single Camera TV Production and Editing], [3.0], [Film/TV/Electronic Media],
)

Rather than build new videography curriculum under the AERO prefix, this track pulls together existing courses from the Art and Film/TV departments. ART 249A covers exposure, composition, the elements of design, and camera technology. FTVE 225B builds on those fundamentals with hands-on video production: scripting, shooting on location, portable lighting, audio, editing, and post. Paired with the flight skills from AERO 100, students come out able to both fly and produce.

AERO 100 gets students in the sky with a camera and addresses some light camera concepts, but the visual and production craft that separates professional aerial videographers from hobbyists is beyond the scope of a Part 107 course. Partnering with departments that already teach that craft is more honest than pretending we can cover it in passing.

Target career pathways include real estate media, event and wedding videography, tourism and destination marketing, documentary and news production, social media content, and corporate video.

= Certificate of Achievement: UAS Technology

Students who want broader competency across multiple application areas can earn a Certificate of Achievement by completing AERO 100, two additional AERO courses of their choice, and two supporting electives drawn from a list that includes GIS, plant science, and the art and film courses above. A student focused on agriculture might combine AERO 130 and 140 with AGPS 242 and a GIS course. A student focused on inspection might combine AERO 120 with GIS and remote sensing. No one is forced through coursework that does not serve their career goals, and students who already hold a Certificate of Specialization find their coursework stacks directly toward the Certificate of Achievement with no wasted units.
