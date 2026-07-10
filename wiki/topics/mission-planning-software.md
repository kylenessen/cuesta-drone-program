---
type: Topic
title: Mission Planning Software
description: A survey of drone mapping mission planning tools, anchored on UgCS, with DJI Pilot 2, Map Pilot Pro, DroneDeploy, FlightHub 2, Drone Harmony, open source options, and criteria for choosing among them.
tags: [mapping]
acs_area: general
last_checked: 2026-07-09
timestamp: 2026-07-09T18:00:00Z
---

# Mission Planning Software

**Mission Planning Software** turns a mapping requirement into an executable flight plan. The planner draws an area or corridor, sets GSD or altitude, overlap, and speed, and the software generates flight lines, camera triggers, and terrain aware altitudes, then uploads the route to the aircraft. Tools differ widely in terrain following quality, camera control, supported aircraft, and cost, and those differences matter more in complex coastal topography than in flat country. This article surveys the main options relevant to the program, anchored on UgCS, which is the instructor's preferred planner.

## UgCS

UgCS, from Latvia based SPH Engineering, is a desktop ground control and mission planning application aimed at professional survey work. It supports a large range of aircraft, including the DJI Matrice 4 series, M350 RTK, M300 RTK, Matrice 30, and Mavic 3 Enterprise, along with ArduPilot and PX4 based platforms and airframes from Freefly, Autel, Inspired Flight, and others. Depending on the aircraft, it connects directly, integrates with DJI Pilot 2, or exports routes [1].

Its photogrammetry tool generates flight lines and camera triggering from camera specifications and a desired GSD, with control over gimbal pitch, speed, and turn behavior, plus large area splitting and battery swap resume [1] [2]. Terrain following is a core strength. UgCS ships with SRTM elevation data at roughly 30 m resolution as its global default and accepts custom DEM, DTM, and DSM imports in GeoTIFF and other georeferenced raster formats, using the best available data for route calculation [3]. Higher tiers add features marketed for fast changing terrain such as cliff faces and quarry walls.

Licensing spans a free UgCS Open tier for evaluation and three paid editions sold as subscriptions or perpetual licenses. As of mid 2026 the shop lists PRO at 109 USD per month, 790 USD per year, or 1,090 USD perpetual, EXPERT (adding LiDAR, vertical scan, and corridor tools) at 189 USD per month or 1,890 USD perpetual, and ENTERPRISE (all features, SDK connections) at 279 USD per month or 2,790 USD perpetual, with annual support plans for perpetual licenses [4]. Verify current pricing and tier contents before purchase since these change.

## DJI Pilot 2

DJI Pilot 2 is the native flight application on DJI enterprise remote controllers, including those shipped with the Matrice 4E and 4T. It plans waypoint, area (grid), linear, and oblique routes without any third party software, and its terrain follow works either from an imported or downloaded DSM in TIFF format or, on aircraft such as the Mavic 3 Enterprise and Matrice 4E, from a real time follow mode [5] [6]. Because it is free, on the controller, and tightly integrated with the aircraft's cameras and RTK, Pilot 2 is the baseline every DJI operator should know, and for many area mapping jobs it is sufficient. Its planning surface is less configurable than a desktop planner, and its DSM handling depends on the user supplying good terrain data.

## Other notable options

Map Pilot Pro, from Drones Made Easy, is an iOS app paired with the Maps Made Easy processing service. It offers terrain awareness from downloadable terrain data with custom terrain import, multi pass linear missions, and flight log sync [7]. It has a long track record with DJI consumer and prosumer aircraft. Check current aircraft compatibility against the fleet before relying on it.

DroneDeploy provides a flight app integrated with its cloud processing and analytics platform. Flight planning, capture, upload, and processing live in one subscription ecosystem, which appeals to organizations that want a single vendor workflow rather than best of breed tools [8].

DJI FlightHub 2 is DJI's cloud operations platform. It adds web based mission planning, fleet and device management, live streaming, and mapping functions, and it is the planning surface for DJI Dock deployments [9]. It suits organizations running multiple aircraft or remote docked operations more than a single pilot mapping program.

Drone Harmony, a Swiss company now part of the DJI ecosystem of third party planners, emphasizes scene based 3D planning. It supports the DJI enterprise lineup and offers facade scan tools and a terrain following approach marketed as Hill Scan for steep slopes, plus a web application and dock support [10]. It is a strong candidate when vertical surfaces and complex structures dominate the work.

On the open source side, Mission Planner (ArduPilot) and QGroundControl (PX4 and ArduPilot) are free ground stations with survey pattern generation and terrain awareness for open autopilot aircraft [11] [12]. They do not control DJI enterprise aircraft, so in a DJI fleet their role is limited, but they matter wherever NDAA compliant or custom airframes running open autopilots enter the picture.

## How to evaluate a planner

Six criteria separate these tools in practice. First, terrain following quality, meaning what elevation data the tool uses by default, whether custom DEMs can be imported, and how faithfully routes track sharp terrain. Second, camera control, including trigger interval handling, gimbal control, and support for the specific sensors on the fleet. Third, corridor and facade tools for linear infrastructure and vertical surfaces, which generic grid planners handle poorly. Fourth, cost and license model, weighing subscriptions against perpetual licenses and what happens when support lapses. Fifth, logging and fleet features such as flight logs, sync, multi operator management, and compliance records. Sixth, platform breadth beyond DJI, which determines whether the tool survives a future fleet change. A program that teaches UgCS alongside native Pilot 2 planning covers both the professional desktop workflow and the baseline every DJI pilot already has in hand.

## Related

- [Mapping Mission Planning](/topics/mapping-mission-planning.md) for the parameters these tools implement.
- [NDAA Compliance and Blue UAS](/topics/ndaa-compliance-and-blue-uas.md) for why platform breadth beyond DJI matters.
- [Photogrammetry Software](/topics/photogrammetry-software.md) for the processing side of the pipeline.

## Citations

[1] SPH Engineering, UgCS Drone Flight Planning Software. https://www.sphengineering.com/flight-planning/ugcs
[2] SPH Engineering, Photogrammetry Mission Planning in UgCS: Step-by-Step Guide. https://www.sphengineering.com/news/photogrammetry-mission-planning-ugcs
[3] SPH Engineering, UgCS Manual, Custom elevation layers (DEM, DTM, DSM). https://manuals-ugcs.sphengineering.com/docs/custom-elevation-layers
[4] SPH Engineering Shop, UgCS Mission Planning Software. https://shop.sphengineering.com/collections/ugcs
[5] Propeller Aero, How to Plan a Terrain Follow Mission with DJI Pilot 2. https://help.propelleraero.com/hc/en-us/articles/19384883356439-How-to-Plan-a-Terrain-Follow-Mission-with-DJI-Pilot-2
[6] DJI Enterprise Insights, DJI Enterprise Geospatial Solutions Advanced FAQ. https://enterprise-insights.dji.com/blog/geospatial-solutions-faq
[7] Drones Made Easy, Map Pilot Pro. https://dronesmadeeasy.com/map-pilot
[8] DroneDeploy. https://www.dronedeploy.com/
[9] DJI, FlightHub 2 User Manual. https://fh.dji.com/user-manual/en/overview.html
[10] Drone Harmony, Flight Plan Creation. https://www.droneharmony.com/post/3-flight-plan-creation
[11] ArduPilot, Mission Planner Documentation. https://ardupilot.org/planner/
[12] QGroundControl, User Guide. https://docs.qgroundcontrol.com/
