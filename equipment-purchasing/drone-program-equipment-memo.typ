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

This memo outlines equipment needs for two courses in Cuesta College's drone program: AERO 100 (Basic UAV Operator), which has an approved course outline, and an advanced mapping and photogrammetry course that is still in curriculum development.

We have \$80,000 available for equipment purchases. The DJI Mavic 4T and Mavic 4E enterprise drones have already been secured through separate funding.

= AERO 100: Basic UAV Operator

== Purpose

AERO 100 prepares students for FAA Part 107 certification and builds flight proficiency to NIST Level 2 Open Area Maneuvering standards. The course has 36 lecture hours and 54 lab hours per semester, with a class cap of 25 students.

== Flight Training Drones

The course needs a fleet of consumer-grade drones for hands-on flight training. Consumer drones make sense here because they are less intimidating for new pilots, and it is not nearly as catastrophic if one is lost or damaged. They are also easier to buy multiples of. The skills transfer anyway. All the drones kind of feel the same: if you can fly a Mini, you can fly an enterprise hexacopter. There are subtleties to the mechanics, but especially if you are being careful, flying one means you can fly the other.

Six drones should be sufficient. With a maximum of three aircraft in the air at once for safe supervision, six allows for battery rotation and keeps a spare available for maintenance or the inevitable collision with a tree.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Decision needed:* DJI Mini series vs. DJI Air series. The Air series is probably more stable in wind with better battery life, but costs more. Need to research pricing for both options with Fly More combo (3 batteries per drone).]
)

The controllers absolutely need to have built-in screens. There is no world where I want separate phones involved. That is just a mess to manage with a fleet of training aircraft.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Controller options for Mini vs. Air series. Confirm RC 2 or equivalent with integrated display is available.]
)

== Charging and Power

A good field charger also makes a good office charger, which is compelling. Something like an EcoFlow Delta Pro could charge the entire fleet and also support outdoor lab sessions. With each drone having a Fly More combo (three batteries), combined with a solid field charging solution, we should have plenty of capacity.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* EcoFlow or similar portable power station options. Need capacity to support 18 batteries (6 drones × 3 batteries). Compare to DJI charging hub options.]
)

== Storage and Organization

The goal is a very solid kit that can be pulled out of the box and flown immediately. A custom Pelican case should hold all the drones, controllers, and batteries in one organized unit. Each drone gets a name, so a label maker is essential for keeping everything straight. Landing pads give a clean surface for takeoff and landing wherever we go.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Pelican case sizing to fit 6 drones, 6 controllers, 18+ batteries, and accessories.]
)

== Course Materials

Budget approximately \$500 for training course materials like targets and obstacles for maneuvering practice.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Idea to explore:* A course with programmable lights where students do not know which one will turn on next and have to fly to it on a dime.]
)

== Administrative Setup

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Decision needed:* DJI account management. One master account for all drones, or individual email aliases for each?]
)

== Curriculum Topics (Equipment-Related)

Battery maintenance and safety could be a whole lecture in itself. It is crucial to cover the hazards of LiPo batteries, best practices for charging (on tile, away from flammables), having the correct fire extinguisher, and looking for signs of damage. I should show videos of LiPo fires to emphasize the danger. Batteries are very dangerous, and students need to understand that.

Students should also understand the charging characteristics of LiPo batteries. The charging rate is not uniform: going from 30 to 80 percent is much faster than going from 80 to 100. That knowledge is genuinely helpful in the field when you are trying to get back in the air.

Thermal management matters too. When you are in direct sun, equipment heats up fast, and that can cause things to seize up. Batteries do not like to be charged when they are very hot.

Remote ID is probably worth mentioning, maybe as a "back in my day" sort of topic. Most new DJI drones have it integrated, but students may encounter older aircraft that do not have it by default.

= Advanced Mapping and Photogrammetry Course

== Purpose

This course builds on AERO 100 to teach professional mapping workflows. The Mavic 4T and 4E provide enterprise-grade platforms for thermal and photogrammetric data collection. Since we are buying enterprise mapping drones, we should have everything needed to actually do mapping properly.

== RTK and Positioning Equipment

If I was doing this for myself, 100 percent, every time I would spend the money on RTK. It is essential for the kind of accuracy that professional mapping requires, and it is a huge part of the curriculum to discuss.

Emlid is the right choice over Trimble. Trimble is not a good value. Emlid is. If a student is starting a drone program from zero, Emlid is the better choice. And realistically, part of being a good drone pilot in this day and age is being adaptable to different tools. Every drone program looks different. Even if a company already has Trimble gear, the skills transfer. It is not that complicated to switch between base stations.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Verify Emlid compatibility with Mavic 4T and 4E. Confirm which Emlid models (RS2? RS3?) are appropriate.]
)

The full setup requires an Emlid base and rover pair, a tripod for the base station, and a decent survey pole with a bipod so we can stand them up properly. Ground control point markers are fundamental to this curriculum and a reasonable ask for any serious mapping program.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Ground control point marker options and standard equipment for marking GCPs.]
)

== Flight Planning Software

Terrain following is critical in our neck of the woods because of the variable topography around San Luis Obispo.

If money was not a concern, I would teach UgCS. It is the most professional option, hands down. But DroneDeploy is a strong contender. We used it for a long time. It solves two problems at once: flight planning and photogrammetry processing. With a single subscription, students could use any computer, and it would get them from zero to one effectively.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* UgCS pricing. DroneDeploy educational pricing and terms. What flight planning options come free with the enterprise DJI drones?]
)

== Photogrammetry Software

I am not trying to impart everything I know. I am just trying to get students from zero to one. That said, I want to give them a foundation they can grow from.

Metashape is the software I know best, and I think it is some of the best out there. It has never let me down. You can grow into it, and you can actually own the license, which is a huge plus over subscription software.

Pix4D is subscription-based, but it is probably very good and easier to use. If they offer a solid educational deal, it could work. I could always demonstrate Metashape as an alternative in my classes for students who want to dive deeper.

DroneDeploy handles processing too, which is attractive. Combined with flight planning, it might be the most practical path to get students producing maps quickly.

OpenDroneMap is open source and worth throwing in as an option. It has been years since I tried it, and I am much more technical now than I was then. The project has likely evolved.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Pix4D educational pricing. DroneDeploy processing capabilities. Current state of OpenDroneMap.]
)

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Decision point:* DroneDeploy for flight planning and processing is the practical "zero to one" solution. Could supplement with Metashape for students who want deeper photogrammetry knowledge. Need to evaluate if this approach meets course objectives.]
)

== Processing Computers

Photogrammetry processing requires capable hardware, though if we go with cloud-based processing through DroneDeploy, the computer requirements drop significantly.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Minimum and recommended specs from Metashape if we need local processing capability.]
)

== Additional Hardware

We will need extra batteries for the Mavic 4T and 4E, plus field charging capability. The charging infrastructure may be shared with the AERO 100 equipment.

== Data Storage and Workflow

Every organization will have its own workflow. We can teach a minimum viable folder structure on a hard drive. More sophisticated solutions like DroneDB are optional and feel more like something to mention than to require.

= Equipment Already Secured

The DJI Mavic 4T (thermal imaging) and Mavic 4E (enterprise mapping) have been ordered through separate funding. These cover public sector applications and will be used for operational demonstrations in AERO 100 and as the primary platforms for the mapping course.

= Future Considerations

The following items are not included in the current \$80,000 budget but represent potential program growth.

== American-Made Drone Platform

An NDAA-compliant, American-made drone would expose students to platforms beyond DJI and prepare them for public sector work that requires domestic manufacturing. Inspired Flight is local to San Luis Obispo and I have an existing relationship with them, which makes them the natural choice when this becomes feasible.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed (future):* Inspired Flight platform options and pricing for mapping applications.]
)

== LIDAR Capability

LIDAR would significantly expand program capabilities but requires substantial additional investment, likely \$50,000 or more at minimum. This needs dedicated curriculum development before purchasing and represents a separate, larger conversation.

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
+ Flight planning software: UgCS pricing, DroneDeploy edu pricing, free options with DJI
+ Photogrammetry software: Pix4D edu pricing, DroneDeploy capabilities, OpenDroneMap evaluation
+ Portable power station options (EcoFlow or similar)
+ Pelican case sizing for 6-drone fleet
+ Ground control point marker equipment
+ Computer specs for photogrammetry (if not using cloud processing)

*Decisions to make:*

+ DJI Mini vs. Air series for AERO 100 fleet
+ DJI account management strategy
+ Flight planning software selection
+ Photogrammetry software selection (or combination approach)
