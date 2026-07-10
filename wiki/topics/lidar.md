---
type: Topic
title: Lidar
description: How drone lidar works, how it differs from photogrammetry, and when photogrammetry's limitations genuinely require it.
tags: [remote-sensing, mapping]
acs_area: general
timestamp: 2026-07-09T18:00:00Z
---

# Lidar

**Lidar** (light detection and ranging) is an active remote sensing method. The sensor fires laser pulses at the ground, times how long each pulse takes to reflect back, and converts that time to a distance. Combined with a precise record of where the sensor was and which way it was pointing at every instant, each range becomes a 3D point, and millions of them together form a point cloud. This article covers lidar conceptually. The program has no lidar hardware, so students work with photogrammetric point clouds hands-on and learn lidar as the technology they will encounter alongside it in industry.

## How drone lidar works

Three subsystems have to work together. The laser scanner emits pulses, often several hundred thousand per second, and sweeps them across the ground in a scan pattern, commonly a repetitive line pattern for mapping or a non-repetitive elliptical pattern that fills in a scene over time. The GNSS receiver, corrected with RTK or PPK, provides centimeter-class position. The inertial measurement unit (IMU) records the sensor's orientation hundreds of times per second. Range plus trajectory yields geometry, and the accuracy of the final cloud is only as good as the weakest of the three.

A single pulse can produce multiple returns. Part of the beam may reflect off a leaf near the top of a canopy while the rest continues through gaps and reflects off branches and finally the ground. Sensors that record several returns per pulse can therefore map both the vegetation surface and the terrain beneath it [3]. The DJI Zenmuse L2, a representative current drone lidar, records up to 5 returns per pulse at a point rate of up to 240,000 points per second, with stated vertical accuracy of 4 cm at 150 m [1]. Point density on the ground, expressed in points per square meter, is the working quality metric and is controlled by pulse rate, altitude, speed, and swath overlap.

## Lidar versus photogrammetry

Photogrammetry reconstructs geometry by matching the same textured surface across overlapping photos. That premise defines both its strengths and its failures. Over bare ground and hard surfaces with good texture, drone photogrammetry with RTK and ground control produces excellent, inexpensive results with true-color detail that lidar cannot match. Its known failure modes, developed in [Limits of Drone Mapping](/topics/limits-of-drone-mapping.md), are the cases where lidar earns its cost.

Vegetation is the classic one. Photogrammetry can only model what the camera sees, so under closed canopy it reconstructs the top of the vegetation, not the ground. Lidar pulses exploit small canopy gaps, and enough last returns reach the ground to build a real terrain model under forest. Texture is the second. Uniform surfaces such as fresh asphalt, sand, snow, and water give image matching nothing to grip, while an active laser does not care about texture. Thin structures are the third. Wires, lattice towers, and railings defeat dense image matching but appear cleanly in lidar, which is one reason utilities value it for transmission corridors.

The tradeoffs run the other way too. A complete drone lidar setup costs far more than a mapping camera. The Zenmuse L2 unit alone retails in the low to mid tens of thousands of dollars, roughly $13,000 to $16,000 at US dealers, before the required Matrice-class aircraft [1] [2]. Lidar point clouds carry no inherent color, so an RGB camera is typically integrated for colorization. And the workflow is less forgiving. Photogrammetry degrades visibly when flown badly. A lidar trajectory error produces a cloud that looks plausible and is silently wrong.

## Processing overview

Lidar processing starts with the trajectory solution, where GNSS observations are post-processed against a base station and fused with the IMU record to produce a smoothed best estimate of position and attitude through the whole flight. The ranges are then georeferenced against that trajectory to generate the raw cloud. Strip alignment (boresight and strip adjustment) corrects small mismatches where overlapping flight lines image the same surface, using the overlap to solve for residual calibration and trajectory errors. Ground classification then labels points as ground or non-ground, usually with progressive filtering algorithms, and the ground class becomes the digital terrain model [4]. Vendor tools such as DJI Terra handle the first steps for integrated systems, while ecosystem tools like TerraSolid, LP360, and open source PDAL cover classification and product generation.

## When to reach for lidar

The honest decision rule is simple. If the deliverable is terrain under vegetation, geometry of thin structures, or surfaces without texture, photogrammetry is the wrong tool and lidar is justified. If the deliverable is an orthomosaic, a textured mesh, or terrain in open ground, photogrammetry is usually cheaper, and its accuracy with RTK and checkpoints is competitive. Many mapping businesses run both and choose per project. Representative current systems beyond the L2 include integrated offerings built around sensors from Hesai, Livox, and RIEGL, spanning a price range from roughly $10,000 for entry integrated units to well over $100,000 for survey-grade systems, with the upper figures varying by configuration.

## Related

- [Drone Payloads](/topics/drone-payloads.md) for lidar as the canonical active sensor.
- [Limits of Drone Mapping](/topics/limits-of-drone-mapping.md) for the photogrammetry failures that justify it.
- [Elevation Models](/topics/elevation-models.md) for the terrain products both methods feed.
- [RTK and PPK Positioning](/topics/rtk-and-ppk-positioning.md) for the trajectory accuracy lidar depends on.

## Citations

[1] DJI Zenmuse L2 specifications. https://enterprise.dji.com/zenmuse-l2/specs
[2] DroneDJ, DJI unveils Zenmuse L2 drone LiDAR module. https://dronedj.com/2023/10/10/dji-zenmuse-l2-lidar-price/
[3] NOAA National Ocean Service, What is lidar? https://oceanservice.noaa.gov/facts/lidar.html
[4] USGS, What is lidar data and where can I download it? https://www.usgs.gov/faqs/what-lidar-data-and-where-can-i-download-it
