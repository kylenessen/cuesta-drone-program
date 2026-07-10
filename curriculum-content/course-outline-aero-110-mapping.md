# AERO 110: Advanced Drone Mapping and Remote Sensing - Topic Outline

This outline sequences the wiki articles that back the advanced mapping course. The course now absorbs the agricultural remote sensing content that was previously planned as its own class, so the arc runs from sensor physics through professional photogrammetry and ends with the multispectral and agricultural unit built on the same foundations. AERO 100 is the prerequisite. Course number is a placeholder pending Ron's input.

## Unit 1: Remote Sensing Foundations

The physics and sensor layer under everything else in the course.

- [Remote Sensing Platforms](../wiki/topics/remote-sensing-platforms.md): the platform continuum from kites to satellites and the resolution-versus-coverage tradeoff that positions drones within it.
- [Electromagnetic Spectrum](../wiki/topics/electromagnetic-spectrum.md): visible light as a narrow band, wavelength filters, and the infrared and ultraviolet regions cameras can be built to see.
- [Digital Imaging](../wiki/topics/digital-imaging.md): how sensors turn light into numbers, color and demosaicing, RAW versus JPEG, and bit depth.
- [Drone Payloads](../wiki/topics/drone-payloads.md): passive versus active sensors and the payload taxonomy from RGB cameras to LiDAR.

## Unit 2: Cameras and Image Quality

Getting mapping-grade pixels out of the camera before any software touches them.

- [Cameras for Drone Mapping](../wiki/topics/cameras-for-drone-mapping.md): mechanical versus electronic shutter, sensor size, focal length, and why camera choice constrains map quality.
- [Camera Exposure](../wiki/topics/camera-exposure.md): shutter, aperture, ISO as signal amplification, and the motion blur floor a moving aircraft imposes.
- [Ground Sample Distance](../wiki/topics/ground-sample-distance.md): the formula, choosing the GSD a target requires, and the altitude tradeoffs that follow.
- [Lighting and Sun Angle for Mapping](../wiki/topics/lighting-and-sun-angle-for-mapping.md): shadows, overcast, the hotspot effect, and sun glint.

## Unit 3: Positioning and Geodesy

The survey knowledge that separates professional mapping from casual mapping, and the heart of the RTK field work.

- [GNSS Fundamentals](../wiki/topics/gnss-fundamentals.md): how satellite positioning works and why standalone receivers give meter-level maps.
- [RTK and PPK Positioning](../wiki/topics/rtk-and-ppk-positioning.md): base and rover, fix versus float, NTRIP and CRTN, and when to choose RTK versus PPK.
- [Map Projections and Coordinate Systems](../wiki/topics/map-projections-and-coordinate-systems.md): geographic versus projected coordinates, UTM, State Plane Zone 5, and EPSG codes.
- [Vertical Datums and Geoid Models](../wiki/topics/vertical-datums-and-geoid-models.md): ellipsoidal versus orthometric heights and the 30 meter elevation trap.
- [Ground Control Points](../wiki/topics/ground-control-points.md): control versus checkpoints, network design, targets, and survey procedure in the field.
- [Mapping Accuracy](../wiki/topics/mapping-accuracy.md): RMSE reporting, ASPRS Edition 2, checkpoint validation, and the common causes of failed accuracy.

## Unit 4: Mission Planning and Field Operations

Designing and executing the data collection flight.

- [Mapping Mission Planning](../wiki/topics/mapping-mission-planning.md): overlap, altitude, speed, capture rate, and terrain following, balanced against each other on real sites.
- [Mission Planning Software](../wiki/topics/mission-planning-software.md): UgCS, DJI Pilot 2, and the rest of the planner landscape.
- [Field Operations Best Practices](../wiki/topics/field-operations-best-practices.md): checklists, go/no-go judgment, in-field image checks, and the discipline of a productive mapping day.
- [Field Power Management](../wiki/topics/field-power-management.md): batteries, charging hubs, generators, and power stations on a full mapping day.

## Unit 5: Photogrammetry and Products

Turning photos into deliverables clients pay for.

- [Structure from Motion](../wiki/topics/structure-from-motion.md): feature matching, bundle adjustment, depth maps, and georeferencing, taught conceptually so software settings make sense.
- [Orthomosaics](../wiki/topics/orthomosaics.md): orthorectification, generation artifacts, true ortho, and absolute position.
- [Elevation Models](../wiki/topics/elevation-models.md): DSM versus DTM, contours, volumetrics, and formats.
- [Photogrammetry Software](../wiki/topics/photogrammetry-software.md): Metashape, Pix4D, DroneDeploy, OpenDroneMap, and the hardware they demand.
- [Geospatial Data Management](../wiki/topics/geospatial-data-management.md): project structure, archiving, flight logs, and delivering orthos to clients.
- [Lidar](../wiki/topics/lidar.md): active laser mapping, taught conceptually as the tool that takes over where photogrammetry stops.

## Unit 6: Agricultural Remote Sensing

The absorbed ag remote sensing content, built directly on the sensor and photogrammetry foundations above.

- [Multispectral Imaging](../wiki/topics/multispectral-imaging.md): NDVI, the red edge, and how greenness is actually measured.
- [Vegetation Indices](../wiki/topics/vegetation-indices.md): NDRE, soil-adjusted indices, and the honest limits of index interpretation.
- [Multispectral Field Practice](../wiki/topics/multispectral-field-practice.md): calibration panels, band registration, and when multispectral beats RGB.
- [Agricultural Drone Applications](../wiki/topics/agricultural-drone-applications.md): scouting, stand counts, irrigation and water stress, nutrient management, and the Central Coast market.
- [Prescription Maps](../wiki/topics/prescription-maps.md): turning an index map into management zones and a file a tractor can run.

## Unit 7: The Mapping Profession

The business and legal context students step into.

- [Applications of Drone Mapping](../wiki/topics/applications-of-drone-mapping.md): the products clients buy and the decisions they feed.
- [Change Detection and Repeat Mapping](../wiki/topics/change-detection-and-repeat-mapping.md): aligning maps across time for trustworthy monitoring.
- [Limits of Drone Mapping](../wiki/topics/limits-of-drone-mapping.md): where photogrammetry stops being the right tool.
- [Mission Cost Analysis](../wiki/topics/mission-cost-analysis.md): mobilization-dominated costs, estimating, insurance, and pricing.
- [Drone Mapping and Licensed Surveying](../wiki/topics/drone-mapping-and-licensed-surveying.md): the legal boundary with California's PLS Act.
- [NDAA Compliance and Blue UAS](../wiki/topics/ndaa-compliance-and-blue-uas.md): federal funding restrictions, the Cleared List, and the non-DJI platform landscape.

## Certifications

Professional credentials this course points students toward.

- [ASPRS Certified UAS Technologist](../wiki/exams/asprs-certified-uas-technologist.md): the professional mapping credential and how its exam matrix maps to this curriculum.
- [ASPRS Geospatial Intern Program](../wiki/exams/asprs-geospatial-intern-program.md): the student pathway into ASPRS certification and its conversion timeline.

## Reference

- [ASPRS Recommended Reading List](../wiki/analysis/asprs-recommended-reading-list.md): the nine exam preparation texts, with per-text relevance for mining additional course content.
