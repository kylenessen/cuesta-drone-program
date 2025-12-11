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

This memo outlines equipment needs for two courses in Cuesta College's drone program: AERO 100 (Basic UAV Operator), which has an approved course outline, and an advanced mapping and photogrammetry course currently in curriculum development.

We have \$80,000 available for equipment purchases. The DJI Mavic 4T and Mavic 4E enterprise drones have already been secured through separate funding.

= AERO 100: Basic UAV Operator

== Purpose

AERO 100 prepares students for FAA Part 107 certification and builds flight proficiency to NIST Level 2 Open Area Maneuvering standards. The course includes 36 lecture hours and 54 lab hours per semester, with a class cap of 25 students.

== Flight Training Drones

The course requires a fleet of consumer-grade drones for hands-on flight training. Consumer drones are ideal for this purpose: they are less intimidating for new pilots, the financial risk of loss or damage is manageable, and purchasing multiples is straightforward. More importantly, the skills transfer directly to larger platforms. Once a student can fly a Mini confidently, they can fly enterprise aircraft with minimal adjustment.

Six drones should be sufficient. With a maximum of three aircraft in the air simultaneously for safe supervision, this quantity allows for battery rotation while keeping a spare available for maintenance.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Decision needed:* DJI Mini series vs. DJI Air series. The Air series offers better wind stability and longer battery life at higher cost. Research pricing for both options with Fly More combo (3 batteries per drone).]
)

Controllers must have built-in screens. Managing separate phones across a fleet of training aircraft creates unnecessary complexity.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Controller options for Mini vs. Air series. Confirm RC 2 or equivalent with integrated display is available.]
)

== Charging and Power

A quality portable power station serves double duty as both a field charging solution and an office charging station. Something like an EcoFlow Delta Pro could support the entire fleet while enabling outdoor lab sessions. With each drone equipped with a Fly More combo (three batteries), this should provide adequate capacity for full lab sessions.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* EcoFlow or similar portable power station options. Capacity should support 18 batteries (6 drones × 3 batteries). Compare against DJI charging hub options.]
)

== Storage and Organization

The goal is a turnkey kit that can be deployed immediately. A custom Pelican case should hold all drones, controllers, and batteries in a single organized unit. Each drone will have a designated name, requiring a label maker for identification. Landing pads provide clean takeoff and landing surfaces in the field.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Pelican case sizing to fit 6 drones, 6 controllers, 18+ batteries, and accessories.]
)

== Course Materials

Budget approximately \$500 for training course materials including targets and obstacles for maneuvering practice.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Idea to explore:* A training course with programmable lights that activate randomly, requiring students to navigate to targets under time pressure.]
)

== Administrative Setup

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Decision needed:* DJI account management approach. One master account for all drones, or individual email aliases for each?]
)

== Curriculum Topics (Equipment-Related)

Battery maintenance and safety warrants significant lecture time. Students need to understand LiPo hazards, proper charging procedures (non-flammable surfaces, appropriate fire extinguisher types), and how to recognize damage. Videos of LiPo fires effectively convey the risks involved.

Students should also understand LiPo charging characteristics. The charging rate is non-linear: 30% to 80% charges much faster than 80% to 100%. This knowledge has practical field applications when trying to maximize flight time.

Thermal management is another important topic. Equipment overheats quickly in direct sun, potentially causing failures. Batteries should not be charged while hot.

Remote ID is worth covering, though primarily as context. Most current DJI drones include it by default, but students may encounter older aircraft without the capability.

= Advanced Mapping and Photogrammetry Course

== Purpose

This course builds on AERO 100 to teach professional mapping workflows. The Mavic 4T and 4E provide enterprise-grade platforms for thermal and photogrammetric data collection. Since we are investing in enterprise mapping drones, the supporting equipment should enable proper professional workflows.

== RTK and Positioning Equipment

RTK capability is essential for professional mapping accuracy and represents a significant portion of the curriculum content.

I recommend Emlid over Trimble. Emlid offers substantially better value, particularly for students or organizations building a drone program from scratch. While some employers use Trimble equipment, the fundamental skills transfer between platforms. Adaptability to different tools is part of being an effective drone operator.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Verify Emlid compatibility with Mavic 4T and 4E. Determine appropriate Emlid models (RS2 or RS3).]
)

The complete setup requires an Emlid base and rover pair, a tripod for the base station, and a survey pole with bipod for the rover. Ground control point markers are fundamental to any serious mapping curriculum.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Ground control point marker options and standard GCP equipment.]
)

== Flight Planning Software

Terrain following capability is critical given the variable topography in the San Luis Obispo area.

UgCS is the most professional option and would be my first choice if budget permits. DroneDeploy is a strong alternative that addresses both flight planning and photogrammetry processing with a single subscription. It works on any computer and provides an effective path from beginner to competent operator.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* UgCS pricing. DroneDeploy educational pricing and terms. Flight planning options included with enterprise DJI drones.]
)

== Photogrammetry Software

The primary goal is giving students a foundation they can build on, not comprehensive mastery of every tool.

Metashape is powerful software that students can grow into over time. The perpetual license model (versus subscription) is a significant advantage. I have extensive experience with it and can speak to its capabilities.

Pix4D is subscription-based but likely easier to learn. An educational discount could make it viable. DroneDeploy handles processing as well, and combined with flight planning, may offer the most streamlined path to producing deliverables.

OpenDroneMap is open source and worth evaluating. The project has matured considerably.

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
  [*Decision point:* DroneDeploy for flight planning and processing offers the most practical beginner workflow. Metashape could supplement for students seeking deeper photogrammetry knowledge. Need to evaluate whether this approach meets course objectives.]
)

== Processing Computers

Photogrammetry processing requires capable hardware, though cloud-based processing through DroneDeploy would significantly reduce local computing requirements.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed:* Metashape minimum and recommended specifications if local processing capability is needed.]
)

== Additional Hardware

Extra batteries for the Mavic 4T and 4E will be necessary, along with field charging capability. Charging infrastructure may be shared with AERO 100 equipment.

== Data Storage and Workflow

Every organization develops its own workflow. The course will teach a baseline folder structure that students can adapt to their future employers' requirements. More sophisticated solutions like DroneDB are optional.

= Equipment Already Secured

The DJI Mavic 4T (thermal imaging) and Mavic 4E (enterprise mapping) have been ordered through separate funding. These support public sector applications and will serve as demonstration platforms in AERO 100 and primary aircraft for the mapping course.

= Future Considerations

The following items fall outside the current \$80,000 budget but represent potential program expansion.

== American-Made Drone Platform

An NDAA-compliant, American-made drone would expose students to alternatives beyond DJI and prepare them for public sector work requiring domestic manufacturing. Inspired Flight, based locally in San Luis Obispo, is the logical choice given their proximity and my existing relationship with them.

#block(
  fill: luma(230),
  inset: 10pt,
  radius: 4pt,
  [*Research needed (future):* Inspired Flight platform options and pricing for mapping applications.]
)

== LIDAR Capability

LIDAR would significantly expand program capabilities but requires substantial additional investment, likely \$50,000 or more. This requires dedicated curriculum development and represents a separate conversation.

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
+ Flight planning software: UgCS pricing, DroneDeploy educational pricing, included DJI options
+ Photogrammetry software: Pix4D educational pricing, DroneDeploy capabilities, OpenDroneMap evaluation
+ Portable power station options (EcoFlow or similar)
+ Pelican case sizing for 6-drone fleet
+ Ground control point marker equipment
+ Computer specifications for photogrammetry (if not using cloud processing)

*Decisions to make:*

+ DJI Mini vs. Air series for AERO 100 fleet
+ DJI account management strategy
+ Flight planning software selection
+ Photogrammetry software selection (or combination approach)
