# Change Detection and Repeat Mapping

**Change Detection and Repeat Mapping** is the practice of flying the same site on multiple dates and comparing the results. It sounds like ordinary mapping done twice, but it is harder than that. A single map only has to be internally consistent and roughly in the right place. A pair of maps used for change detection must agree with each other well enough that the differences between them reflect the site, not the survey. Monitoring programs, from construction earthwork tracking to estuary restoration, live or die on this distinction.

## The alignment problem

Two orthomosaics or elevation models of the same site will never line up perfectly on their own. Each flight has its own GNSS solution, its own photo network, and its own processing run, and each introduces positional error. If flight one is 5 cm east of truth and flight two is 5 cm west, a naive comparison shows 10 cm of apparent movement that never happened. The core design principle of repeat mapping is that relative accuracy between epochs matters more than the absolute accuracy of any single epoch. Everything below serves that principle.

## Ground control strategy across epochs

The strongest tool for inter-epoch consistency is using the same ground control in every flight. For sites that will be flown repeatedly, practitioners install permanent ground control, such as painted targets on concrete, anchored monuments, or marked pavement features, survey them once with high quality GNSS or total station work, and reuse the coordinates for every subsequent flight [1] [2]. This ties every epoch to one fixed reference frame, so residual errors are shared rather than independent. Permanent control also cuts field time on every revisit, which matters for program cost. Markers should sit on stable, open ground away from vegetation that will grow over them, and a monitoring program should include a few extra markers as insurance against loss to construction, vandalism, or erosion [2].

RTK and PPK drones reduce the number of targets needed, but vendor guidance still recommends independent checkpoints, and a small set of reused control points remains cheap insurance that all epochs share a datum [1].

## Co-registration when control is imperfect

Legacy data, lost markers, and opportunistic flights mean control is often inconsistent between epochs. The standard remedy is co-registration, aligning one dataset to another using features that are known to be stable. In practice this means identifying surfaces that should not have changed, such as pavement, bedrock outcrops, or building roofs, and either adjusting one model to minimize disagreement over those surfaces or at least measuring the disagreement there. Point cloud alignment tools in common software implement variants of this idea. The residual disagreement over stable surfaces is your honest estimate of the smallest change you can claim anywhere else in the map. If stable pavement differs by 6 cm between epochs, a 4 cm change signal in a dune or channel is not detectable.

## Seasonal and radiometric differences

Change detection compares appearance as well as geometry, and appearance changes for reasons that have nothing to do with the site. Sun angle differs between a June flight and a December flight, moving shadows and altering apparent texture. Vegetation phenology changes color and canopy volume seasonally, so a surface model of a shrub field can rise and fall with the seasons even when the ground is static. Wet versus dry soil changes tone. Programs that care about vegetation or landform trends should schedule flights at the same time of year, and ideally similar time of day, so that seasonal signal does not masquerade as change. Where the target is the ground surface itself, seasonal canopy differences argue for flying in the leaf-off or low growth season, or for lidar, as discussed in [Limits of Drone Mapping](/topics/limits-of-drone-mapping.md).

## The elevation differencing trap

The most seductive product of repeat mapping is a DEM of difference, one elevation model subtracted from another to map erosion, deposition, or fill. The trap is that each DEM carries its own vertical uncertainty, and differencing does not cancel that uncertainty, it combines it. The geomorphology community has developed explicit methods for this problem, propagating the uncertainty of each surface into the difference map and applying a minimum level of detection below which apparent change is treated as noise [3] [4]. Tools such as the Geomorphic Change Detection software formalize the workflow [3]. The practical rule is blunt. If the change you are trying to measure is smaller than the combined vertical uncertainty of your two surfaces over stable ground, the difference map is not evidence. Report volumes and elevation changes with thresholds, and show the stable-area residuals that justify them.

## Designing a trustworthy program

A defensible repeat mapping program is designed before the first flight. Install and document permanent control. Fix the coordinate system, geoid model, and units once and never change them mid-program. Standardize the flight design, meaning altitude, overlap, camera, and processing settings, so epochs differ as little as possible. Schedule flights for consistent season and lighting. Include stable reference surfaces in every flight and report the disagreement over them alongside every change product. These habits cost little and are the difference between a time series a client can act on and a stack of pretty maps that cannot be compared.

## Related

- [Ground Control Points](/topics/ground-control-points.md) for the permanent control that anchors a program.
- [Elevation Models](/topics/elevation-models.md) for the surfaces being differenced.
- [Mapping Accuracy](/topics/mapping-accuracy.md) for the uncertainty math the thresholds rest on.
- [Lighting and Sun Angle for Mapping](/topics/lighting-and-sun-angle-for-mapping.md) for the seasonal light consistency problem.
- [Applications of Drone Mapping](/topics/applications-of-drone-mapping.md) for the monitoring programs this serves.

## Citations

[1] DroneDeploy, Best Practices for Ground Control Points (GCPs) and Checkpoints. https://help.dronedeploy.com/hc/en-us/articles/11138616177047-Best-Practices-for-Ground-Control-Points-GCPs-and-Checkpoints
[2] Civil Tracker, All About Ground Control Points. https://civiltracker.xyz/all-about-ground-control-points/
[3] ESSA Technologies and Riverscapes Consortium, Geomorphic Change Detection (GCD) software. https://www.essa.com/explore-essa/tools/geomorphic-change-detection/
[4] Wheaton, J. M., Brasington, J., Darby, S. E., and Sear, D. A. (2010), Accounting for uncertainty in DEMs from repeat topographic surveys: improved sediment budgets, Earth Surface Processes and Landforms. https://doi.org/10.1002/esp.1886
