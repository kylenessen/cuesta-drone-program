#set page(margin: 1in)
#set text(font: "Libertinus Serif", size: 11pt)
#set par(justify: true, leading: 0.65em)
#show heading.where(level: 1): set text(size: 16pt)
#show heading.where(level: 2): it => block(above: 1.4em, below: 0.8em)[
  #set text(size: 13pt)
  #it.body
]
#show heading.where(level: 3): it => block(above: 1.1em, below: 0.6em)[
  #set text(size: 11pt)
  #it.body
]

= Cuesta College UAS Program: Course Content Overview

#text(size: 10pt, fill: rgb("#555555"))[
  Prepared for the Advisory Committee \
  Kyle Nessen, July 2026
]

#v(0.5em)

This document summarizes the content of the three core courses in the proposed UAS certificate program. AERO 100 is approved and gives students the FAA Remote Pilot Certificate and flight proficiency. AERO 110 and AERO 120 build on that foundation and prepare students for the two largest drone employment sectors, mapping and infrastructure inspection. AERO 100 is the prerequisite for both advanced courses. Each course is 3 units. We welcome the committee's feedback on whether this content matches what employers need.

== AERO 100: Basic UAV Operator

This course has two goals. Students pass the FAA Part 107 knowledge test and earn the Remote Pilot Certificate. Students also build real flight proficiency through recurring field sessions across the term.

*Regulations and certification*
- The Part 107 small UAS rule and its operating limits
- The Remote Pilot Certificate: eligibility, application, and recency requirements
- Drone registration, Remote ID, and operations over people
- Waivers and the pending Part 108 rule for flight beyond visual line of sight

*Airspace and navigation*
- Airspace classes and special use airspace
- Reading sectional charts
- LAANC airspace authorization and the day-of clearance workflow
- NOTAMs, TFRs, airport operations, and radio communications

*Weather*
- Decoding METAR and TAF reports and running a go/no-go briefing
- How wind, density altitude, fronts, fog, and icing affect a small aircraft

*Aircraft performance and human factors*
- Weight and balance, center of gravity, and load factor
- Aeronautical decision-making, hazardous attitudes, and crew resource management
- Pilot physiology: fatigue, impairment, vision, and night effects

*Maintenance, batteries, and emergencies*
- Preflight inspection, maintenance practice, and recordkeeping
- LiPo battery hazards and the charging, storage, and transport discipline that prevents fires
- Emergency procedures: battery fires, lost link, flyaways, and GPS loss

*Flight operations and proficiency*
- The anatomy of a complete flight, from preflight programming through landing
- Precision flight drills built on the NIST test lanes, leading to a flight assessment
- Field discipline: checklists, go/no-go judgment, and shared airspace
- Night operations and anti-collision lighting

*Career preview*
- A closing survey of mapping, thermal inspection, agriculture, and public safety work, the applications the advanced courses cover in depth

== AERO 110: Advanced Drone Mapping and Remote Sensing

This course prepares students for professional mapping work. The arc runs from sensor physics through survey-grade data collection to the deliverables clients pay for. The course also carries the program's agricultural remote sensing content, since multispectral skills apply well beyond agriculture. Content aligns with the ASPRS Certified UAS Technologist credential.

*Remote sensing foundations*
- The electromagnetic spectrum and what cameras can be built to see
- How digital sensors turn light into data
- The payload landscape, from RGB cameras to multispectral sensors and lidar

*Cameras and image quality*
- Sensor size, shutter type, and exposure for mapping-grade images
- Ground sample distance: choosing the detail a job requires and the altitude that delivers it
- Lighting, shadows, and sun angle in the field

*Positioning and geodesy*
- GNSS fundamentals and why standalone receivers give meter-level maps
- RTK and PPK positioning for survey-grade accuracy
- Coordinate systems, map projections, and vertical datums
- Ground control points: network design, targets, and field procedure
- Accuracy validation and reporting against ASPRS standards

*Mission planning and field operations*
- Overlap, altitude, speed, and terrain following on real sites
- Mission planning software and field power management for a full mapping day

*Photogrammetry and deliverables*
- How structure from motion turns photos into maps
- Orthomosaics, elevation models, contours, and volumetric calculations
- Industry software: Metashape, Pix4D, DroneDeploy, and open-source options
- Data management and delivering products to clients

*Agricultural remote sensing*
- Multispectral imaging, NDVI, and vegetation indices, with their honest limits
- Calibration and field practice for reliable data
- Crop scouting, water stress, and prescription maps a tractor can run

*Professional practice*
- Estimating and pricing mapping work
- The legal boundary with licensed surveying under California law
- NDAA compliance and platform selection for government and utility clients

== AERO 120: Drone Infrastructure Inspection

This course prepares students for utility and infrastructure inspection work, planned in partnership with PG&E and IBEW Local 1245. Inspection demands different skills than mapping: precision manual flight, thermal interpretation, and asset knowledge. Thermal fundamentals are core content and align with Level 1 thermography certification, with full exam preparation planned as a second phase.

*The inspection industry*
- Why California utilities fly drones: CPUC inspection mandates and wildfire risk
- PG&E's drone program, the IBEW training model, and the regional employment pipeline

*Thermal imaging foundations*
- Infrared physics and how a thermal camera measures temperature
- Emissivity, reflected temperature, and the traps that produce false readings
- Spot size and measurement distance: how flying height decides whether a reading is valid
- Thermal tuning and palettes: separating the data from the display

*Interpreting and reporting findings*
- Delta-T severity classification and industry-standard severity tiers
- Turning a thermal image into a defensible inspection call
- Thermal anomalies in electrical systems, solar installations, and building envelopes

*Flying the job*
- Flight near energized infrastructure: compass interference, GPS multipath, and minimum approach distances
- Radio link behavior and lost-link failsafes near towers and lines
- Precision manual flight drills at the tighter tolerances inspection demands
- Utility safety culture and inspection field discipline

*Platforms and compliance*
- The dual thermal and high-zoom payload configuration that defines the inspection platform
- NDAA compliance and why platform origin matters to utility clients
