# DJI Matrice 4E

The **DJI Matrice 4E** is the program's mapping aircraft, secured through separate state funding before the main equipment budget, and the platform AERO 110 is built around. It is a compact enterprise quadcopter, about 1.2 kilograms at takeoff, that packs the three ingredients of survey-grade photogrammetry into one airframe: a mechanical shutter camera on a large sensor, an integrated RTK positioning module, and long endurance [1]. Aircraft in this class replaced the Mavic 3 Enterprise as DJI's mapping workhorse in early 2025, and the 4E sells for roughly $5,200 as a bare aircraft as of mid-2026, an order of magnitude less than comparable non-Chinese setups [2].

## Cameras

The main mapping camera is a 20 MP 4/3-inch CMOS with a mechanical shutter rated from 2 s to 1/2000 s [1]. The mechanical shutter is the load-bearing spec. As explained in [Cameras for Drone Mapping](../topics/cameras-for-drone-mapping.md), an electronic rolling shutter exposes the frame row by row, smearing geometry when the aircraft is moving at mapping speed, while a mechanical shutter freezes the whole frame at once. The large sensor buys low-light headroom and cleaner pixels at the ground sample distances worked through in [Ground Sample Distance](../topics/ground-sample-distance.md).

Around the mapping camera sit a 48 MP medium telephoto on a 1/1.3-inch sensor and a 48 MP telephoto on a 1/1.5-inch sensor, giving the aircraft real inspection reach, plus a laser rangefinder that measures targets out to 1,800 m [1]. For coursework the telephotos matter less than the wide camera, but they let the 4E stand in for inspection demonstrations when the [Matrice 4T](dji-matrice-4t.md) is unavailable.

## Positioning

The 4E has RTK built in, with positioning accuracy of 1 cm + 1 ppm horizontal and 1.5 cm + 1 ppm vertical in RTK fix [1]. Corrections can come from DJI's own D-RTK base stations or from any NTRIP source over the controller's internet connection, which is what lets the program's [Emlid Reach RS4 base](emlid-rtk-kit.md) feed it corrections; Emlid documents this integration officially [3]. The aircraft also logs raw GNSS observations for PPK, the post-processed fallback described in [RTK and PPK Positioning](../topics/rtk-and-ppk-positioning.md). Accurately geotagged images constrain the photogrammetric adjustment from above and reduce, though do not eliminate, the need for the ground control points covered in [Ground Control Points](../topics/ground-control-points.md).

## Airframe and endurance

Takeoff weight is 1,219 g with standard propellers, maximum flight time is 49 minutes, and rated wind resistance is 12 m/s [1]. Brochure endurance translates to roughly 25 to 35 minutes of productive mapping per battery once wind, transits, and landing reserve are counted, the arithmetic worked in [Field Power Management](../topics/field-power-management.md). The battery is a 6,741 mAh, 99.5 Wh pack, and the O4 Enterprise transmission system links to the DJI RC Plus 2 controller, which has a built-in 7-inch class screen and runs the flight apps directly [1]. The aircraft carries no standard IP weather rating, so it sits out rain [1].

## Software ecosystem

The controller ships with DJI Pilot 2, which plans mapping grids, oblique missions, and waypoint routes, caches offline maps and elevation data, and flies real-time terrain follow, the capability that matters most in San Luis Obispo County topography as discussed in [Mapping Mission Planning](../topics/mapping-mission-planning.md) [4]. A one-year DJI Terra license for photogrammetric processing is bundled with the aircraft [4]. Third-party planners including DroneDeploy, UgCS, Map Pilot Pro, Dronelink, and Drone Harmony support the Matrice 4 series, generally by installing on the RC Plus 2, though some 4E-specific camera modes such as smart oblique capture remain exclusive to Pilot 2 [5]. The planner landscape and the processing choices are compared in [Mission Planning Software](../topics/mission-planning-software.md) and [Photogrammetry Software](../topics/photogrammetry-software.md).

## Role in the program

AERO 110's course outline names the Matrice 4E as its primary aircraft, paired with the Emlid base and rover for the RTK workflow objectives [6]. Students plan terrain-following missions, fly RTK-corrected mapping grids, and process the imagery into orthomosaics and elevation models. The aircraft was purchased with California Strong Workforce Program funds, so federal NDAA restrictions do not attach to its operation, a distinction unpacked in [NDAA Compliance and Blue UAS](../topics/ndaa-compliance-and-blue-uas.md); the non-DJI mapping alternatives are assessed in [NDAA-Compliant Platform Options](ndaa-compliant-platform-options.md).

## Related

- [Equipment Overview](equipment-overview.md) for the whole fleet.
- [DJI Matrice 4T](dji-matrice-4t.md) for the inspection sibling on the same airframe.
- [Emlid RTK Kit](emlid-rtk-kit.md) for the base and rover that complete the mapping workflow.
- [Cameras for Drone Mapping](../topics/cameras-for-drone-mapping.md) for why the mechanical shutter matters.
- [RTK and PPK Positioning](../topics/rtk-and-ppk-positioning.md) for what the RTK module actually does.

## Citations

[1] DJI, Matrice 4 Series specifications. https://enterprise.dji.com/matrice-4-series/specs
[2] DSLRPros, DJI Matrice 4E Universal Edition listing (price as of mid-2026, approximately $5,189 aircraft only). https://www.dslrpros.com/products/dji-matrice-4e-universal-edition-aircraft-only
[3] Emlid Docs, DJI RTK drone and Reach RS4 base integration. https://docs.emlid.com/reachrs4/integration/dji-rtk/
[4] DJI Enterprise Insights, Top Features of the Matrice 4 Series. https://enterprise-insights.dji.com/blog/top-features-of-the-matrice-4-series
[5] DroneDeploy Support, Matrice 4 Enterprise / Matrice 4 Thermal (M4E/T). https://help.dronedeploy.com/hc/en-us/articles/30917880312343-Matrice-4-Enterprise-Matrice-4-Thermal-M4E-T
[6] AERO 110 course outline draft, equipment justification (curriculum-content/aero-110-cor-draft.md in this repository).
