// Cuesta College Drone Program Equipment Memo
// Draft for Ron Overacker
// Author: Kyle Nessen
// Date: December 2025

#set document(title: "Drone Program Equipment Planning")
#set page(margin: 1in)
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true)

#align(center)[
  #text(size: 16pt, weight: "bold")[Cuesta College Drone Program]
  #linebreak()
  #text(size: 14pt)[Equipment Planning Memo]
  #linebreak()
  #text(size: 10pt, style: "italic")[Draft for Discussion]
]

#v(1em)

= Overview

This memo outlines equipment needs for two courses in Cuesta College's drone program:

+ *AERO 100: Basic UAV Operator* (approved course outline complete)
+ *Advanced Mapping and Photogrammetry* (curriculum in development)

*Budget:* \$80,000 available for equipment purchases.

*Already secured (separate funding):* DJI Mavic 4T and Mavic 4E enterprise drones.

= AERO 100: Basic UAV Operator

== Purpose

AERO 100 prepares students for FAA Part 107 certification and builds flight proficiency to NIST Level 2 Open Area Maneuvering standards. The course emphasizes safe, legal, and ethical UAV operations with 36 lecture hours and 54 lab hours per semester. Class cap is 25 students.

== Flight Training Drones

The course requires a fleet of consumer-grade drones for hands-on flight training. Consumer drones are preferable because:

- Less intimidating for new pilots
- Lower financial risk if lost or damaged
- Easier to purchase multiples
- Flight skills transfer to larger aircraft

*Quantity:* 6 drones. With a maximum of 3 aircraft in the air simultaneously (for safe supervision), this allows for battery rotation and a spare for maintenance.

*Platform:* DJI consumer line

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Decision needed:* DJI Mini series vs. DJI Air series. Air series offers better wind stability and longer battery life but costs more. Research pricing for both options with Fly More combo (3 batteries per drone).]
)

*Controllers:* Must have built-in screens. Using separate phones creates logistical problems.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Which controller options are available for Mini vs. Air series? Confirm RC 2 or equivalent with integrated display.]
)

== Charging and Power

Field charging capability serves dual purposes: supports outdoor lab sessions and provides a reliable office charging station.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* EcoFlow or similar portable power station options. Consider capacity needed to charge 18 batteries (6 drones × 3 batteries each). Compare to DJI charging hub options.]
)

== Storage and Organization

- Custom Pelican case to hold all drones, controllers, and batteries in one organized unit
- Label maker for naming each drone and organizing equipment
- Landing pads for clean takeoff/landing surfaces

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Pelican case sizing. Need to fit 6 drones, 6 controllers, 18+ batteries, and accessories.]
)

== Course Materials

Budget approximately \$500 for training course materials:

- Targets and markers for precision exercises
- Obstacles for maneuvering practice

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Idea to explore:* Programmable lights for dynamic flight exercises where students must react to targets turning on.]
)

== Administrative Setup

Each drone should have a name for easy identification and tracking.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Decision needed:* DJI account management strategy. One master account for all drones, or individual email aliases for each drone?]
)

== Curriculum Topics (Equipment-Related)

The following topics will be covered in lecture and reinforced during lab:

- *Battery maintenance and safety:* Hazards of LiPo batteries, proper charging procedures (on tile, away from flammables), correct fire extinguisher type, recognizing damage. Include videos of LiPo fires.
- *LiPo charging characteristics:* Non-uniform charging rate (30-80% is much faster than 80-100%). Practical implications for field operations.
- *Thermal management:* Equipment overheating in direct sun, battery temperature considerations for charging.
- *Remote ID:* Historical context and compliance. Most new DJI drones have this integrated, but students may encounter older aircraft.

= Advanced Mapping and Photogrammetry Course

== Purpose

This course builds on AERO 100 to teach professional mapping workflows. The Mavic 4T and 4E (already secured) provide enterprise-grade platforms for thermal and photogrammetric data collection.

== RTK and Positioning Equipment

RTK capability is essential for professional-grade accuracy. If students are learning mapping, they should learn to do it correctly.

*Platform:* Emlid

Emlid was selected over Trimble because:

- Significantly better value
- Appropriate choice for students or organizations starting a drone program from zero
- Skills are transferable to other platforms
- A good drone pilot needs to be adaptable to different tools

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Verify Emlid compatibility with Mavic 4T and 4E. Confirm which Emlid models (RS2? RS3?) are appropriate.]
)

*Equipment needed:*

- Emlid base and rover units (pair)
- Tripod for base station
- Survey pole with bipod for rover
- Ground control point markers

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Ground control point marker options. What equipment is standard for marking GCPs?]
)

== Flight Planning Software

Terrain following is critical for mapping in this region due to variable topography.

*Options under consideration:*

- *UgCS:* Most professional option. Preferred if budget allows.
- *DroneDeploy:* Solves two problems (flight planning and processing). Single subscription, works on any computer. Would effectively get students from zero to one.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* UgCS pricing. DroneDeploy educational pricing and licensing terms. What flight planning is available for free with enterprise DJI drones?]
)

== Photogrammetry Software

*Options under consideration:*

- *Metashape:* Powerful, can grow into it, perpetual license ownership (not subscription). This is the software I know best.
- *Pix4D:* Subscription-based, probably easier to use. May offer educational deals.
- *DroneDeploy:* Cloud-based processing. Combined with flight planning, could be the simplest path to get students producing maps.
- *OpenDroneMap:* Open source. Worth evaluating, though I have not used it recently.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Pix4D educational pricing. DroneDeploy processing capabilities and pricing. Current state of OpenDroneMap.]
)

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Decision point:* DroneDeploy for flight planning + processing is the practical "zero to one" solution. Could supplement with Metashape demonstrations for students who want deeper photogrammetry knowledge. Need to evaluate if this approach meets course objectives.]
)

== Processing Computers

Photogrammetry processing requires capable hardware.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Minimum and recommended specs from Metashape. If using cloud processing (DroneDeploy), computer requirements are much lower.]
)

== Additional Hardware

- Extra batteries for Mavic 4T and 4E
- Field charging solution (may share with AERO 100 equipment)

== Data Storage and Workflow

Every organization will have its own workflow. The course will teach a minimum viable folder structure on a hard drive. More sophisticated solutions (like DroneDB) are optional.

= Equipment Already Secured

The following enterprise drones have been ordered through separate funding:

- *DJI Mavic 4T* (thermal imaging)
- *DJI Mavic 4E* (enterprise mapping)

These cover public sector applications across 14 countries and will be used for operational demonstrations in AERO 100 and as primary platforms for the mapping course.

= Future Considerations

The following items are not included in the current \$80,000 budget but represent potential program growth:

== American-Made Drone Platform

*Manufacturer:* Inspired Flight (local to San Luis Obispo area, existing relationship)

An NDAA-compliant, American-made drone would:

- Expose students to platforms beyond DJI
- Prepare students for public sector work requiring domestic manufacturing
- Support local industry

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed (future):* Inspired Flight platform options and pricing for mapping applications.]
)

== LIDAR Capability

LIDAR would significantly expand program capabilities but requires substantial additional investment (estimated \$50,000+ minimum). This needs dedicated curriculum development before purchasing.

= Summary and Next Steps

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*TODO:* Add summary table with itemized costs once research is complete.]
)

*Immediate research tasks:*

+ DJI Mini vs. Air series pricing with Fly More combo
+ Controller options with integrated screens
+ Emlid model selection and Mavic 4T/4E compatibility
+ Flight planning software: UgCS pricing, DroneDeploy edu pricing, free options
+ Photogrammetry software: Pix4D edu pricing, DroneDeploy capabilities
+ Portable power station options (EcoFlow or similar)
+ Pelican case sizing for 6-drone fleet
+ Ground control point marker equipment
+ Computer specs for photogrammetry (if not using cloud processing)

*Decisions to make:*

+ DJI Mini vs. Air series for AERO 100 fleet
+ DJI account management strategy
+ Flight planning software selection
+ Photogrammetry software selection (or combination approach)
