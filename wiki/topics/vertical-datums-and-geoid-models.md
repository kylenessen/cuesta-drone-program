---
type: Topic
title: Vertical Datums and Geoid Models
description: Ellipsoidal versus orthometric heights, GEOID18 and NAVD88 in current US practice, and why mishandled datums shift drone elevations by roughly 30 meters.
tags: [mapping]
acs_area: general
timestamp: 2026-07-09T18:00:00Z
---

# Vertical Datums and Geoid Models

**Vertical Datums and Geoid Models** explain the single most common gross error in drone mapping, elevations that are off by around 30 meters even though the map looks perfect. GNSS measures height above a mathematical ellipsoid. Engineering, floodplain, and construction work uses height above a gravity-defined surface that approximates sea level. The two differ by tens of meters, the difference varies from place to place, and a geoid model is the bridge between them. A mapping professional who cannot state which height type a dataset uses cannot defend its elevations.

## Ellipsoidal versus orthometric heights

An ellipsoidal height, usually written h, is the distance from the reference ellipsoid to the point, measured along the ellipsoid normal. It is what GNSS receivers natively produce, a purely geometric quantity with no physical meaning. Water can flow between two points with the same ellipsoidal height. An orthometric height, written H, is measured from the geoid along the plumb line and corresponds to the everyday idea of elevation above sea level. Water does not flow between points of equal orthometric height on a level surface. The two are related through the geoid height N, the separation between geoid and ellipsoid, by the simple equation H equals h minus N [1].

## What the geoid is

The geoid is the equipotential surface of Earth's gravity field that best fits global mean sea level. Because rock density and topography vary, the geoid undulates relative to the smooth ellipsoid, higher where mass is concentrated and lower elsewhere. Geoid models are grids of N values. NGS distinguishes gravimetric geoids, built purely from gravity data, from hybrid geoids, which warp a gravimetric model to fit the published leveling-based benchmarks of an official vertical datum so that GNSS users land on the same heights surveyors use [1] [2].

## GEOID18 and NAVD88 in current US practice

The official vertical datum of the conterminous United States is the North American Vertical Datum of 1988, NAVD88, realized historically through leveled benchmarks. The current hybrid model is GEOID18, which converts NAD83(2011) epoch 2010.0 ellipsoidal heights to NAVD88 orthometric heights. Its fit to GPS-on-benchmark data has a standard deviation of about 1.27 centimeters across CONUS [1]. In practical terms, an RTK rover or an RTK drone measures h in NAD83, software applies GEOID18 to get N, and the deliverable reports H in NAVD88. Every link in that chain must be declared. Processing software, base station configuration, and GIS all offer geoid options, and silently skipping the geoid step is easy.

## Why drone elevations go wrong by tens of meters

Across California the geoid sits roughly 30 or more meters below the NAD83 ellipsoid, with published examples near negative 31 meters, so h and H at the same point differ by about that amount [2]. The classic failure modes all trace to this gap. If a drone's geotags carry ellipsoidal heights and the processing software treats them as orthometric, the whole model floats about 30 meters high. If GCP heights are orthometric NAVD88 but the project vertical system is set to ellipsoidal, the model is pulled the other way, or the software reports huge GCP errors. If the base station coordinate was averaged or entered with the wrong height type, every rover point and every geotag inherits the offset. A related subtler error is applying the wrong geoid model, or applying GEOID18 to WGS84 rather than NAD83 heights, which produces errors at the meter level rather than the 30 meter level and is harder to notice. The diagnostic habit is to compare a drone-derived elevation against a known benchmark early in processing, and to treat any disagreement near 30 meters as a datum problem, not a sensor problem.

## The modernized NSRS

NGS is replacing the entire framework. The modernized National Spatial Reference System retires NAD83 and NAVD88 in favor of four new terrestrial reference frames, including the North American Terrestrial Reference Frame of 2022, NATRF2022, and a new geopotential datum, NAPGD2022, in which orthometric heights come from a gravimetric geoid model rather than leveled benchmarks [3]. The rollout has slipped from its original 2022 target. Under the timeline in the October 2024 Federal Register notice, NGS is releasing components for public testing on its beta site through 2025 and 2026, the Federal Geodetic Control Subcommittee is expected to vote on approval around mid 2026, and official adoption is anticipated toward the end of 2026, with the current NSRS remaining official until then [3] [4]. For a curriculum, the practical takeaway is that NAD83, NAVD88, and GEOID18 are the working system today, and that datum transformations between old and new frames will be a routine professional task within the careers of current students.

## Related

- [Map Projections and Coordinate Systems](/topics/map-projections-and-coordinate-systems.md) for the horizontal half of the coordinate question.
- [GNSS Fundamentals](/topics/gnss-fundamentals.md) for why receivers natively measure ellipsoidal heights.
- [RTK and PPK Positioning](/topics/rtk-and-ppk-positioning.md) for the workflows these datums flow through.
- [Mapping Accuracy](/topics/mapping-accuracy.md) for datum confusion as the top cause of failed accuracy tests.

## Citations

[1] NOAA National Geodetic Survey, GEOID18 Technical Details. https://geodesy.noaa.gov/GEOID/GEOID18/geoid18_tech_details.shtml
[2] GPS World, The differences between GEOID18 values and NAD 83, NAVD 88 values. https://www.gpsworld.com/the-differences-between-geoid18-values-and-nad-83-navd-88-values/
[3] NOAA National Geodetic Survey, New Datums Frequently Asked Questions. https://geodesy.noaa.gov/datums/newdatums/FAQNewDatums.shtml
[4] Federal Register, Updated Implementation Timeline for the Modernized National Spatial Reference System (NSRS). https://www.federalregister.gov/documents/2024/10/09/2024-23347/updated-implementation-timeline-for-the-modernized-national-spatial-reference-system-nsrs
