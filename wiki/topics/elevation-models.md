---
type: Topic
title: Elevation Models
description: DSM versus DTM, ground classification, contour generation, volumetric analysis, raster resolution relative to GSD, and standard deliverable formats.
tags: [mapping]
acs_area: general
timestamp: 2026-07-09T18:00:00Z
---

# Elevation Models

**Elevation Models** are the raster surfaces derived from a photogrammetric point cloud, and they carry most of the analytical value in a drone mapping project. The orthomosaic answers what is there. The elevation model answers how high, how steep, and how much. Contours, cut and fill, stockpile volumes, drainage analysis, and design surface comparisons all run on elevation rasters, so knowing which surface you are looking at and how it was made is not optional.

## DSM versus DTM

The two fundamental products are the digital surface model and the digital terrain model. A DSM represents the elevation of the first surface visible from above, including buildings, vehicles, and vegetation canopy [1]. A DTM, in the sense the drone mapping industry uses the term, represents the bare earth with above-ground objects removed. Terminology is genuinely messy here. USGS notes that in traditional US usage a DTM is a vector dataset of mass points and breaklines, while in much international and software usage DTM simply means a bare-earth elevation raster [1]. Photogrammetry vendors follow the second convention, and the umbrella term DEM can refer to either surface.

Photogrammetry has a structural limitation worth stating plainly. The camera only sees the top surface, so under dense canopy there are no true ground measurements to recover. A photogrammetric DTM in a forested area is an interpolation across the gaps, unlike lidar, which can return ground points through small openings in the canopy.

## Ground point classification

A DTM is produced by classifying the dense point cloud into ground and non-ground points and then interpolating a surface from the ground class only. Metashape's Classify Ground Points routine works by dividing the cloud into cells, finding the lowest points, building an approximate terrain surface, and then adding points that fall within user-set thresholds of that surface, controlled by parameters such as maximum angle, maximum distance, and cell size [2]. Pix4Dmapper likewise generates its DTM by filtering and smoothing the DSM after classifying the point cloud [3]. Automatic classification is good but never perfect. Low vegetation, vehicles, and sharp terrain breaks are common failure points, and professional workflows include manual review and reclassification before publishing a terrain product.

## Contours and choosing an interval

Contour lines are generated directly from an elevation raster, and every major package exports them. The important professional judgment is the interval. Software will happily draw contours far finer than the data supports. The legacy ASPRS map standard tied the two together explicitly, requiring vertical RMSE no worse than one third of the contour interval for the highest map class [4]. The current ASPRS Positional Accuracy Standards moved to accuracy statements that are independent of contour interval, but the old ratio survives as a sound rule of thumb [4]. If checkpoint testing shows roughly 5 cm vertical RMSE, publishing quarter-foot contours invites trouble, while half-foot or one-foot contours are defensible. Contours from a DSM are rarely useful. Generate them from the DTM, and expect to smooth them for presentation.

## Volumetric analysis

Volumes are computed by comparing a surface against a reference base. The software multiplies each raster cell's area by the height difference between the surface and the base at that cell, then sums the results. Material above the base counts as cut and material below counts as fill [5]. For a stockpile, the operator draws a boundary around the pile and the software constructs a base surface from the boundary points, using either a fitted plane or a triangulated base, then reports the enclosed volume [5]. Smaller cell sizes capture irregular shapes more faithfully [5]. Cut and fill mapping between two dates works the same way with an earlier survey as the base surface, which is the standard approach for tracking earthwork progress. Accuracy depends on the vertical quality of both surfaces and on a clean toe line around the pile, so overhanging material, equipment parked on the pile, and vegetation all bias results.

## Resolution relative to GSD

Elevation rasters are gridded at some multiple of the ground sample distance of the imagery. Pix4Dmapper's default DSM resolution is 1 times GSD, and its default DTM resolution is 5 times GSD [3]. The coarser DTM default reflects reality. Terrain is smoother than the first surface, and after removing non-ground points there is less true information per cell. A useful habit is to treat 1x GSD elevation rasters as oversampled. The effective vertical information content is coarser than the grid spacing, typically on the order of 1 to 3 times GSD depending on texture and overlap, so downsampling a DTM costs little and shrinks files substantially.

## Deliverable formats

Raster elevation products are almost universally delivered as GeoTIFF, a TIFF image with embedded georeferencing that every GIS and CAD translator reads. Elevation GeoTIFFs should be 32-bit floating point with a defined nodata value, and both horizontal and vertical coordinate reference systems documented.

Point clouds are delivered in LAS, the open binary format specified by ASPRS for lidar and point cloud interchange, currently at version 1.4 [6]. LAS carries per-point attributes including classification codes, so a properly classified deliverable preserves the ground and non-ground distinction. LAZ is the losslessly compressed form of LAS, typically shrinking files to a small fraction of their original size, and it is the delivery format USGS specifies for 3DEP point cloud data [7]. Photogrammetry packages export both, and LAZ is the sensible default for handoff and archival. Contours are usually delivered as shapefile, GeoPackage, or DXF for CAD users.

## Related

- [Structure from Motion](/topics/structure-from-motion.md) for the point cloud these surfaces come from.
- [Orthomosaics](/topics/orthomosaics.md) for the companion 2D product.
- [Mapping Accuracy](/topics/mapping-accuracy.md) for the vertical accuracy that governs contour intervals.
- [Vertical Datums and Geoid Models](/topics/vertical-datums-and-geoid-models.md) for what the elevations are measured against.

## Citations

[1] U.S. Geological Survey, 3D Elevation Program Standards and Specifications, including the Lidar Base Specification glossary. https://www.usgs.gov/3d-elevation-program-standards-and-specifications
[2] Agisoft Metashape Professional Edition User Manual, version 2.2, Classify Ground Points. https://www.agisoft.com/pdf/metashape-pro_2_2_en.pdf
[3] Pix4D Support, Processing Options, DSM, Orthomosaic and Index, DSM and Orthomosaic. https://support.pix4d.com/hc/en-us/articles/202557769
[4] Penn State GEOG 892, The New ASPRS Positional Accuracy Standards for Digital Geospatial Data. https://courses.ems.psu.edu/geog892/node/707
[5] Pix4D Support, How Pix4Dmapper calculates the Volume. https://support.pix4d.com/hc/en-us/articles/202559239-How-Pix4Dmapper-calculates-the-Volume-
[6] Library of Congress, LAS (LASer) File Format, Version 1.4. https://www.loc.gov/preservation/digital/formats/fdd/fdd000418.shtml
[7] U.S. Geological Survey, Point Cloud Delivery in LAZ Format. https://www.usgs.gov/ngp-standards-and-specifications/point-cloud-delivery-laz-format
