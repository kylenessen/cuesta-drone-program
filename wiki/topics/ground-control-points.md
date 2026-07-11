# Ground Control Points

**Ground Control Points** are surveyed marks on the ground, visible in the imagery, whose known coordinates anchor a photogrammetric model to the real world. Structure from motion produces a reconstruction that is internally consistent but only as absolutely accurate as the positions constraining it. GCPs supply that constraint at survey grade. Even in an era of RTK drones, GCPs remain central, both as control when geotag quality is in doubt and as the independent evidence that a map meets its accuracy claim.

## What GCPs do

During bundle adjustment, the software refines camera positions, orientations, and lens parameters so that observations agree. Marked GCPs enter that adjustment as high-weight constraints. They fix the model's absolute position, scale, and orientation, and they suppress systematic deformation such as vertical doming that camera self-calibration can introduce. Pix4D notes that without GCPs or high-accuracy geotags, a project's absolute accuracy is limited by the accuracy of the image geolocation, which for standalone GNSS means meters [1]. With well-surveyed, well-distributed GCPs, absolute accuracy approaches the accuracy of the survey itself plus a fraction of the ground sample distance.

## Control points versus checkpoints

A point used in the adjustment is a control point. A point withheld from the adjustment and compared against the finished model afterward is a checkpoint. The distinction matters because residuals on control points measure only how well the software honored its constraints, not how accurate the map is elsewhere. Checkpoints provide the honest test. The ASPRS Positional Accuracy Standards base formal accuracy assessment on independent checkpoints, with a minimum of 30 for a full assessment under Edition 2 [2]. Small projects rarely justify 30, but the principle scales down. Withhold at least a few surveyed points from control and report the model's error against them, as covered further in [Mapping Accuracy](mapping-accuracy.md).

## Network design

Distribution matters more than raw count. Pix4D's guidance is that 5 to 10 GCPs are usually enough even for large projects, that additional points contribute little once distribution is good, and that complex topography justifies more [1]. The working pattern for a typical site is one point near each corner region and one or more near the center, forming a perimeter plus interior layout. Avoid placing points exactly at the image edge of the block, where they appear in too few photos. Pix4D recommends each GCP be identifiable in at least five images [1]. Vertical accuracy benefits when points sample the site's elevation range, so put control on high and low ground rather than only on the convenient flat area. Corridor projects follow a different pattern, alternating pairs along the corridor rather than a ring [3].

## Targets and visibility

A target must be unambiguous at mapping altitude. High-contrast patterns with a defined center work best, the classic choices being a black and white checkerboard or an iron cross painted on a mat, plywood square, or tile. As a sizing rule, the target must span enough pixels that its center can be picked confidently, which in practice means scaling the target to the ground sample distance of the flight. At the roughly 1 to 3 centimeter GSDs typical of Matrice 4E mapping flights, targets in the range of half a meter to a meter across are common practice. Painted X marks on pavement work when materials are short. Whatever the type, the surveyed point must be the visual center, the target must lie flat, and it must not move between survey and flight.

## Survey procedure with an RTK rover

With the Reach RS4 base broadcasting corrections, or an NTRIP mount point supplying them, the RX2 rover on a fixed-height pole occupies each target center. The non-negotiable rule is to store points only with a fixed RTK solution, never float. Level the pole carefully or rely on tilt compensation where the receiver supports it, and average the position over a short occupation rather than storing a single epoch. Emlid's survey workflow supports configuring the coordinate system and averaging time per point in the field app [4]. Record the project coordinate system deliberately before the first point. The horizontal system, the vertical reference, ellipsoidal or a named geoid, and the units must match what processing will use. Photograph each occupied target as documentation, and re-observe a previously stored point at the end of the session as a blunder check. If the base was averaged rather than set on known control, the whole survey is accurate relative to itself but shifted by the base error, which is acceptable only when relative accuracy is all the project needs.

## Exporting for processing software

The deliverable from the field is a simple table, typically CSV, with point name, easting and northing or latitude and longitude, and elevation, in a declared coordinate system. Pix4D, Agisoft Metashape, and DJI Terra all import such files and then ask the operator to confirm the CRS and to mark each point in multiple images [5]. Column order and axis convention are frequent stumbling points, since some tools expect X as easting and others accept latitude first. The protection is the same habit throughout this wiki, one declared EPSG code and one declared vertical reference, written into the file name or header and checked at import.

## Related

- [RTK and PPK Positioning](rtk-and-ppk-positioning.md) for the survey technology behind the rover.
- [Mapping Accuracy](mapping-accuracy.md) for how checkpoints turn into defensible accuracy claims.
- [Map Projections and Coordinate Systems](map-projections-and-coordinate-systems.md) and [Vertical Datums and Geoid Models](vertical-datums-and-geoid-models.md) for the coordinate discipline the survey depends on.
- [Structure from Motion](structure-from-motion.md) for how GCPs enter the reconstruction.
- [ASPRS Certified UAS Technologist](../exams/asprs-certified-uas-technologist.md) for the credential whose exam covers ground control practice.

## Citations

[1] Pix4D Support, Getting GCPs on the field or through other sources. https://support.pix4d.com/hc/en-us/articles/202557489
[2] ASPRS, Positional Accuracy Standards for Digital Geospatial Data, Edition 2. https://www.asprs.org/asprs-publications/asprs-positional-accuracy-standards-for-digital-geospatial-data
[3] Pix4D Support, Number and distribution of ground control points in corridor mapping. https://support.pix4d.com/hc/en-us/articles/202559299
[4] Emlid Docs, Reach RS4 documentation. https://docs.emlid.com/reachrs4/
[5] Pix4D Support, How to include GCPs in the project. https://support.pix4d.com/hc/en-us/articles/202560239
