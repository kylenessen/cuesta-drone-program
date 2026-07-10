---
type: Topic
title: Mapping Mission Planning
description: How overlap, altitude, speed, terrain following, and battery endurance interact when planning a photogrammetry flight, and how to reason through the tradeoffs.
tags: [mapping, field-operations]
acs_area: general
timestamp: 2026-07-09T18:00:00Z
---

# Mapping Mission Planning

**Mapping Mission Planning** is the process of translating a data requirement, usually a target ground sample distance and a coverage area, into a flyable automated route. The planner chooses overlap, altitude, speed, and flight line geometry so the camera collects images that a photogrammetry pipeline can reconstruct, within the limits of the aircraft's battery and the pilot's time on site. Every parameter interacts with the others, so good planning is less about memorizing settings and more about understanding the chain of constraints.

## Front lap and side lap

Overlap is what makes reconstruction possible. Photogrammetry software finds common features across images and triangulates their positions, so every ground point must appear in several photos taken from different camera positions. Front lap (also called forward or frontal overlap) is the overlap between consecutive images along a flight line. Side lap is the overlap between adjacent flight lines. Front lap is cheap to increase because it only requires triggering the camera more often. Side lap is expensive because it adds flight lines and therefore flight time.

Pix4D recommends at least 75 percent front lap and 60 percent side lap for general mapping over terrain with good texture [1]. Over flat agricultural fields, where repetitive texture makes feature matching harder, the recommendation rises to at least 80 percent in both directions. Over forest and dense vegetation, where leaves move between exposures and look alike, at least 85 percent in both directions is recommended, along with flying higher so each image captures more context [1]. Corridor projects and 3D facade work have their own conventions, but the general principle holds. More overlap buys reconstruction robustness at the cost of flight time and image count.

## Altitude and ground sample distance

[Ground Sample Distance](/topics/ground-sample-distance.md) (GSD) is the ground footprint of one pixel. It scales linearly with height above ground. Using the standard formula, GSD in centimeters per pixel equals sensor width (mm) times flight height (m) times 100, divided by focal length (mm) times image width (pixels) [2]. Double the altitude and the GSD doubles. The required GSD is usually the client's or the analysis's first fixed constraint, and it pins the altitude for a given camera. A DJI Matrice 4E wide camera, with its 20 MP four thirds sensor and mechanical shutter, reaches roughly 3 cm per pixel class GSD at typical survey altitudes near 120 m, and finer GSD requires flying proportionally lower [3].

## Speed, capture rate, and motion blur

Once altitude and front lap are set, the forward distance between photo centers is fixed. It equals the forward image footprint times one minus the front lap. Flight speed then determines how often the camera must fire. Speed divided into the photo spacing must not exceed what the camera can sustain. The binding constraints are the camera's minimum trigger interval and the rate at which images can be written to storage. The Matrice 4E, for example, supports a shooting interval as short as 0.5 seconds with its mechanical shutter, which is what allows it to map at higher speeds than cameras with 2 second intervals [3]. Fly faster than the camera can keep up and the mission silently loses front lap, which shows up later as reconstruction gaps.

Speed also interacts with exposure through motion blur, covered fully in [Camera Exposure](/topics/camera-exposure.md). Blur distance on the ground is simply flight speed times exposure time. A drone at 10 m/s with a 1/100 s shutter smears each exposure across 10 cm of ground [4]. The working rule is to keep blur below about one GSD, and below half a GSD for high accuracy work [5]. Since low altitude means small GSD, low altitude flights need slower flight speeds, faster shutter speeds, or both. Mechanical shutters remove rolling shutter distortion but do not remove motion blur.

## Terrain following

The GSD formula depends on height above ground, not height above the launch point. In flat country the difference is academic. In San Luis Obispo County's coastal hills it is not. A constant altitude flight planned from a ridge top launch point can end up hundreds of feet higher above the valley floor than intended, degrading GSD and effective overlap there, or dangerously close to the next ridge. Terrain following keeps the aircraft at a constant height above ground so GSD and overlap stay uniform across the site.

Terrain following algorithms sample a digital elevation model along each flight line and insert altitude changes or additional waypoints so the route tracks the ground surface. The output quality depends on the DEM. UgCS ships with SRTM elevation data at roughly 30 m resolution as its global default and accepts custom DEM, DTM, or DSM imports in GeoTIFF and other georeferenced raster formats for sites where SRTM is too coarse [6]. DJI Pilot 2 offers DSM based terrain follow with imported or downloaded terrain files, plus a real time follow mode on some aircraft including the Matrice 4E [7]. A coarse DEM smooths over gullies and cut banks, so critical low altitude work over sharp terrain justifies flying or importing a better surface model first.

## Balancing constraints

Planning is a negotiation among four quantities. Required GSD fixes altitude. Altitude plus overlap fixes flight line spacing and photo spacing. Photo spacing plus camera trigger limits cap speed. Speed, line spacing, and area determine total flight time, which battery endurance and time on site must cover. When the numbers do not close, something must give. The usual moves are relaxing GSD slightly, trimming side lap toward the minimum the surface can tolerate, splitting the area across batteries or days, or accepting more site time.

Flight time can be estimated as total line length divided by speed, plus an allowance for turns, climbs, and transits. Total line length is approximately the area divided by the line spacing. This is why flight time scales nonlinearly when altitude changes linearly. The image footprint shrinks with altitude in both dimensions, so halving the altitude halves the line spacing (doubling total line length) and also halves the photo spacing, which often forces a slower speed to respect the trigger interval. Time can therefore grow by roughly four times or more, and image count grows by about four times, when altitude is cut in half. Small GSD improvements are expensive.

## Launch, landing, and line of sight

Part 107 requires the remote pilot or a visual observer to keep the unaided visual line of sight to the aircraft throughout the flight [8]. In variable topography this constrains the launch point as much as battery logistics do. Choose launch and landing locations that are elevated or central enough that no flight line passes behind a ridge, tree line, or structure. For large or convoluted sites, plan multiple launch points and split the mission rather than stretching sight lines. Walking the site or checking a viewshed against the DEM before committing to a plan is cheap insurance, and the same DEM used for terrain following can be used to sanity check what the pilot will be able to see.

## Related

- [Ground Sample Distance](/topics/ground-sample-distance.md) for the resolution requirement that starts the plan.
- [Camera Exposure](/topics/camera-exposure.md) for the motion blur limit on speed.
- [Mission Planning Software](/topics/mission-planning-software.md) for the tools that execute these plans.
- [Field Operations Best Practices](/topics/field-operations-best-practices.md) for flying the plan well on the day.
- [Field Power Management](/topics/field-power-management.md) for covering the battery cycles the plan demands.

## Citations

[1] Pix4D, Step 1. Before Starting a Project. Designing the Image Acquisition Plan. https://support.pix4d.com/hc/en-us/articles/202557459
[2] Pix4D, Ground sampling distance (GSD) in photogrammetry. https://support.pix4d.com/hc/en-us/articles/202559809
[3] DJI, DJI Matrice 4 Series Specs. https://enterprise.dji.com/matrice-4-series/specs
[4] Drones Made Easy, Motion Blur and Automatic Light-based Speed Adjustment. https://support.dronesmadeeasy.com/hc/en-us/articles/208235483-Motion-Blur-and-Automatic-Light-based-Speed-Adjustment
[5] Hammer Missions, Preventing Motion Blur in Drone Photogrammetry Flights. https://www.hammermissions.com/post/preventing-motion-blur-in-drone-photogrammetry-flights
[6] SPH Engineering, UgCS Manual, Custom elevation layers (DEM, DTM, DSM). https://manuals-ugcs.sphengineering.com/docs/custom-elevation-layers
[7] Propeller Aero, How to Plan a Terrain Follow Mission with DJI Pilot 2. https://help.propelleraero.com/hc/en-us/articles/19384883356439-How-to-Plan-a-Terrain-Follow-Mission-with-DJI-Pilot-2
[8] eCFR, 14 CFR 107.31, Visual line of sight aircraft operation. https://www.ecfr.gov/current/title-14/chapter-I/subchapter-F/part-107/subpart-B/section-107.31
