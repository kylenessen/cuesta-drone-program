# Cuesta College UAS Program: Course Content Overview

Prepared for the Advisory Committee
Kyle Nessen, July 2026

This document summarizes the content of the three core courses in the proposed UAS certificate program. AERO 100 is approved and gives students the FAA Remote Pilot Certificate and flight proficiency. AERO 110 and AERO 120 build on that foundation and prepare students for the two largest drone employment sectors, mapping and infrastructure inspection. AERO 100 is the prerequisite for both advanced courses. Each course is 3 units. We welcome the committee's feedback on whether this content matches what employers need.

## AERO 100: Basic UAV Operator

This course has two goals. Students pass the FAA Part 107 knowledge test and earn the Remote Pilot Certificate. Students also build real flight proficiency through recurring field sessions across the term. The lecture sequence follows the FAA knowledge areas, and the flight work runs alongside it rather than waiting for a block at the end.

**Regulations and certification**

- The Part 107 small UAS rule: its structure, operating limits, and accident reporting requirements
- The Remote Pilot Certificate: eligibility, the application path students follow, and the 24-month recency rule
- Drone registration under Part 48: fees, marking, and weight thresholds
- Remote Identification: the broadcast requirement, modules, and FAA-recognized identification areas
- Operations over people and moving vehicles: the four-category system
- Certificates of waiver: which rules can be waived and how, framed as what becomes possible beyond the defaults
- The pending Part 108 rule for flight beyond visual line of sight, covered briefly so students see where the industry is heading
- The reference shelf: the CFR, advisory circulars, the Chart Supplement, and the publications that keep a certificated pilot current

**Airspace and navigation**

This is the heaviest-weighted knowledge test area and a genuine field skill: knowing where you can fly and how to get permission.

- Airspace classes A through G, special use airspace, and other designated areas
- Reading sectional charts, the tested skill behind nearly every airspace question
- Airspace authorization in practice: LAANC, grid ceilings, DroneZone, and the day-of clearance workflow
- NOTAMs and temporary flight restrictions, and the preflight checking habit
- Airport operations: airport types, traffic patterns, markings, and where to find airport data
- Radio communications: CTAF, UNICOM, ATIS, and the phraseology remote pilots monitor near airports

**Weather**

- Aviation weather sources: METAR and TAF decoding, ASOS and AWOS, and a documented go/no-go briefing workflow
- Weather effects on performance: density altitude, wind, fronts, thunderstorms, fog, and icing as they affect a small aircraft

**Aircraft performance and loading**

- Weight and balance, center of gravity, and load factor

**Human factors**

The pilot as the most failure-prone component of the system.

- Aeronautical decision-making: hazardous attitudes, risk assessment, and crew resource management
- Remote pilot physiology: impairment, fatigue, dehydration, vision, and night effects on the pilot

**Maintenance, batteries, and emergencies**

Battery safety earns substantial lecture time here.

- Maintenance practice, preflight inspection, and recordkeeping
- Battery fundamentals: volts, amps, and watts, LiPo hazards, and the charging, storage, and transport discipline that prevents fires
- Emergency procedures: battery fires, lost link, flyaways, and GPS loss
- The command and video radio links, what degrades them, and the lost-link failsafes students must configure and trust

**Flight operations and proficiency**

The proficiency half of the course, run as recurring field sessions throughout the term.

- The anatomy of a single flight, from preflight programming through takeoff, in-flight control, sensor operation, approach, and landing
- Precision flight drills built on the NIST test lanes, leading to the AERO 100 flight assessment
- Field discipline: checklists, attention management, go/no-go judgment, and operating in shared airspace
- Night operations: the 2021 night rules, anti-collision lighting, and twilight definitions
- Lab sessions include NIST open lane practice, precision maneuvering drills, a dynamic reaction course, a battery charging and field power lab, and preflight inspection briefings

**Career preview**

A closing survey of the operational applications the advanced courses explore in depth.

- Drone mapping: the products clients buy and the decisions those products feed
- Thermal imaging and the utility inspection industry that anchors regional drone employment
- Agricultural applications: scouting, water stress, and the Central Coast market
- Public safety operations: search and rescue, fire support, and drone-as-first-responder programs

## AERO 110: Advanced Drone Mapping and Remote Sensing

This course prepares students for professional mapping work. The arc runs from sensor physics through survey-grade data collection to the deliverables clients pay for. The course also carries the program's agricultural remote sensing content, since multispectral skills apply well beyond agriculture. Content aligns with the body of knowledge tested by the ASPRS Certified UAS Technologist credential, and the course points students toward that certification and the ASPRS student intern pathway into it.

**Remote sensing foundations**

The physics and sensor layer under everything else in the course.

- The platform continuum from kites to satellites, and the resolution-versus-coverage tradeoff that positions drones within it
- The electromagnetic spectrum: visible light as a narrow band, and the infrared and ultraviolet regions cameras can be built to see
- Digital imaging: how sensors turn light into numbers, color and demosaicing, RAW versus JPEG, and bit depth
- The payload taxonomy: passive versus active sensors, from RGB cameras to multispectral sensors and lidar

**Cameras and image quality**

Getting mapping-grade pixels out of the camera before any software touches them.

- Mechanical versus electronic shutter, sensor size, and focal length, and why camera choice constrains map quality
- Exposure: shutter, aperture, ISO as signal amplification, and the motion blur floor a moving aircraft imposes
- Ground sample distance: the formula, choosing the detail a target requires, and the altitude tradeoffs that follow
- Lighting and sun angle: shadows, overcast, the hotspot effect, and sun glint

**Positioning and geodesy**

The survey knowledge that separates professional mapping from casual mapping, and the heart of the RTK field work.

- GNSS fundamentals: how satellite positioning works and why standalone receivers give meter-level maps
- RTK and PPK positioning: base and rover, fix versus float, network corrections, and when to choose each method
- Map projections and coordinate systems: geographic versus projected coordinates, UTM, and State Plane
- Vertical datums and geoid models: ellipsoidal versus orthometric heights and the 30-meter elevation trap
- Ground control points: control versus checkpoints, network design, targets, and survey procedure in the field
- Mapping accuracy: RMSE reporting, checkpoint validation against ASPRS standards, and the common causes of failed accuracy

**Mission planning and field operations**

Designing and executing the data collection flight.

- Mission design: overlap, altitude, speed, capture rate, and terrain following, balanced against each other on real sites
- Mission planning software and the current planner landscape
- Field discipline for a productive mapping day: checklists, go/no-go judgment, and in-field image checks
- Field power management: batteries, charging hubs, generators, and power stations across a full mapping day

**Photogrammetry and deliverables**

Turning photos into products clients pay for.

- Structure from motion: feature matching, bundle adjustment, depth maps, and georeferencing, taught conceptually so software settings make sense
- Orthomosaics: orthorectification, generation artifacts, and true ortho
- Elevation models: surface versus terrain models, contours, volumetric calculations, and formats
- Photogrammetry software: Metashape, Pix4D, DroneDeploy, and open-source options, and the processing hardware they demand
- Data management: project structure, archiving, flight logs, and delivering products to clients
- Lidar, taught conceptually as the tool that takes over where photogrammetry stops

**Agricultural remote sensing**

Built directly on the sensor and photogrammetry foundations above.

- Multispectral imaging: NDVI, the red edge, and how greenness is actually measured
- Vegetation indices beyond NDVI, and the honest limits of index interpretation
- Multispectral field practice: calibration panels, band registration, and when multispectral beats RGB
- Agricultural applications: crop scouting, stand counts, irrigation and water stress, nutrient management, and the Central Coast market
- Prescription maps: turning an index map into management zones and a file a tractor can run

**Professional practice**

The business and legal context students step into.

- The mapping market: the products clients buy and the decisions they feed
- Change detection and repeat mapping: aligning maps across time for trustworthy monitoring
- The limits of drone mapping: where photogrammetry stops being the right tool
- Cost analysis: mobilization-dominated costs, estimating, insurance, and pricing
- The legal boundary with licensed surveying under California's Professional Land Surveyors Act
- NDAA compliance: federal funding restrictions, the Blue UAS Cleared List, and platform selection for government and utility clients

## AERO 120: Drone Infrastructure Inspection

This course prepares students for utility and infrastructure inspection work, planned in partnership with PG&E and IBEW Local 1245. Inspection demands different skills than mapping: precision manual flight, thermal interpretation, and asset knowledge. Thermal fundamentals are core content and align with the Level 1 thermography certification body of knowledge, with full exam preparation planned as a second phase once the utility partnership is established. The course uses a dual-payload platform carrying both a thermal sensor and a high-zoom visual camera, consistent with utility equipment standards.

**The inspection industry**

Why utilities fly drones and what the regional employment pipeline looks like.

- Zoom and thermal inspection work across the asset landscape: towers, turbines, bridges, and solar
- California utility inspection mandates under CPUC General Orders 95 and 165, and the wildfire risk that drives them
- PG&E's drone program: the pilot qualification ladder, the IBEW 1245 training model, and the articulation precedent this course is built around
- Inspection reporting and the deliverables utilities expect

**Thermal imaging foundations**

The physics a thermographer needs before trusting a single temperature reading.

- Longwave infrared physics, microbolometer sensors, and radiometric data
- Emissivity and reflected temperature: apparent versus true temperature and the infrared mirror trap
- Spot size and measurement distance: instantaneous field of view, the 3x3 pixel rule, and how flying height decides whether a measurement is valid at all
- Thermal tuning and palettes: level and span, palette selection, and the discipline of separating the data from the display

**Interpreting and reporting findings**

Turning a thermal image into a defensible inspection call.

- Delta-T severity classification: temperature rise over reference and NETA-style severity tiers
- The inspection conditions that make thermal comparisons honest: load, wind, and solar gain
- Identifying and classifying anomalies in electrical systems, solar installations, and building envelopes

**Flying the job**

The flight environment that makes utility inspection its own discipline, and the precision stick skills it demands.

- Flying near energized infrastructure: compass interference, GPS multipath, minimum approach distances, wire strike, and utility safety culture
- The command and video radio links, interference near towers and lines, and lost-link failsafes in exactly the places they get tested
- Precision manual flight drills, revisited from AERO 100 at the tighter tolerances inspection work demands
- Field discipline applied to inspection days: checklists, attention management, and go/no-go judgment

**Platforms and compliance**

The equipment and procurement context of utility work.

- The dual thermal and high-zoom payload configuration that defines the inspection platform
- NDAA compliance: federal funding restrictions, the Blue UAS Cleared List, and why platform origin matters to utility and government clients

**Certification**

- Level 1 thermography certification: the industry thermal credential this course aligns with, its providers, cost, and career value
