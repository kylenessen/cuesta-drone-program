---
type: Topic
title: Orthomosaics
description: What an orthomosaic is, how orthorectification works, common generation artifacts, true ortho versus conventional ortho, and why GNSS-only georeferencing can be meters off.
tags: [mapping]
acs_area: general
timestamp: 2026-07-09T18:00:00Z
---

# Orthomosaics

An **orthomosaic** is a single seamless image assembled from many overlapping drone photos, corrected so that it has a uniform scale and can be measured like a map. It is the most requested deliverable in drone mapping. Unlike a simple stitched panorama, an orthomosaic is built on top of a full 3D reconstruction, which is what removes perspective distortion and preserves true distances [1].

The distinction matters commercially and legally. A stitched image looks fine but distances on it are unreliable. An orthomosaic, generated through orthorectification against a surface model, supports measurement, area takeoffs, and GIS overlay [1].

## How orthorectification works

Every raw aerial photo is a perspective projection. Objects displace outward from the image center as a function of their height and their distance from nadir, an effect called relief displacement. Orthorectification reverses this by combining two inputs, the source imagery with its solved camera positions and the digital surface model produced from the dense reconstruction [2]. For each output pixel, the software uses the surface model to determine the ground elevation at that location, projects that 3D position back into the best available source photos, and samples the color from them. The result is an image rendered as if every point were viewed from directly above.

Because the orthomosaic is computed from the DSM, its quality is capped by the DSM's quality. Pix4D's documentation is explicit that if the calibration, dense point cloud, or DSM are poor, the orthomosaic will be distorted, so those earlier steps must be verified first [3].

## Point cloud and orthomosaic are different products

The dense point cloud and the orthomosaic come out of the same pipeline but serve different purposes. The point cloud is the 3D measurement product. It supports elevation modeling, volumetrics, cross sections, and export into CAD and lidar workflows. The orthomosaic is the 2D visual and planimetric product. It supports mapping, inspection records, feature digitizing, and communication with clients who will never open a point cloud viewer. A common professional mistake is delivering only an orthomosaic when the client's real question, such as a stockpile quantity, requires the 3D data.

## Where orthomosaic generation goes wrong

Certain scene contents reliably produce artifacts, and recognizing them is a core skill.

Vegetation is the classic offender. Trees and crops move between exposures and their fine geometry reconstructs poorly, so canopies often appear blurred or melted in the output [2]. Water is worse. It is featureless, reflective, and moving, so it generates almost no valid tie points and often reconstructs as noise or holes [2]. Moving vehicles appear in different positions in different photos, producing ghosted or duplicated cars, though these can be edited out afterward by reassigning which image textures that area [4]. Repetitive textures such as crop rows, roof tiles, and solar arrays can cause false matches during alignment, which corrupts geometry before the ortho step even begins [2].

Buildings introduce their own signature problems. If the surface model does not capture facades and roof edges crisply, tall structures lean away from the image center and their walls smear across the ground [5]. Finally, because the mosaic blends many photos, visible seamlines can appear where adjacent regions were sampled from images with different lighting or slight misalignment. Metashape and similar tools expose seamline editing so an operator can choose which photo textures a given polygon and then update the mosaic [4].

## Conventional ortho versus true ortho

A conventional orthophoto is rectified against a terrain-only elevation model, so the ground is planimetrically correct but everything above the ground, buildings especially, still leans and hides whatever is behind it [6]. A true ortho is rectified against a detailed surface model that includes buildings and other above-ground objects, so rooftops sit directly over their footprints and building lean is removed [6]. True ortho requires a dense, accurate DSM and more computation, and it historically came from dedicated high-overlap aerial programs. Drone photogrammetry blurs the line because its products are DSM-based by default, but edge quality around buildings still depends heavily on overlap, obliques, and reconstruction settings [5].

## Looking perfect while sitting meters off

An orthomosaic georeferenced only by the drone's consumer-grade onboard GNSS can be internally excellent and still be wrong in absolute position. The reconstruction's relative accuracy comes from photogrammetry, so distances and shapes within the map hold up. Its absolute position, though, comes entirely from the image geotags, and a standard single-frequency consumer GNSS receiver is only accurate to a few meters [7]. Pix4D notes that without ground control, absolute accuracy lands in the range of the drone's GNSS receiver, while with GCPs it improves to a few centimeters [7]. DJI's standard image geolocation in particular is documented as not precise enough for survey work on its own [8].

The practical symptom is a beautiful orthomosaic that lands several meters off when overlaid on parcel lines, RTK field shots, or a previous survey. Elevation offsets are often worse than horizontal ones. The fixes are ground control points, RTK or PPK corrected geotags, or both, with check points to prove the result.

## Related

- [Structure from Motion](/topics/structure-from-motion.md) for the reconstruction underneath the mosaic.
- [Elevation Models](/topics/elevation-models.md) for the surface the rectification depends on.
- [Ground Control Points](/topics/ground-control-points.md) and [RTK and PPK Positioning](/topics/rtk-and-ppk-positioning.md) for fixing absolute position.
- [Lighting and Sun Angle for Mapping](/topics/lighting-and-sun-angle-for-mapping.md) for the lighting artifacts that end up in seams.

## Citations

[1] Pix4D Support, Photo stitching vs orthomosaic generation. https://support.pix4d.com/hc/en-us/articles/202558869
[2] Pix4D Support, Distortions and Artifacts in the Orthomosaic. https://support.pix4d.com/hc/en-us/articles/202561099
[3] Pix4D Support, Orthomosaic (PIX4Dmatic). https://support.pix4d.com/hc/en-us/articles/360048200292
[4] Agisoft Helpdesk, Orthomosaic seamline editing (patching). https://agisoft.freshdesk.com/support/solutions/articles/31000148853-orthomosaic-seamline-editing-patching-
[5] Pix4D Support, How to correct Building Artifacts in the DSM and Orthomosaic. https://support.pix4d.com/hc/en-us/articles/202560459
[6] Massachusetts Association of Land Surveyors and Civil Engineers, The Truth about True Ortho. https://www.malsce.org/news/lets-get-things-straight-the-truth-about-true-ortho/
[7] Pix4D Support, What is the relative and absolute accuracy of drone mapping. https://support.pix4d.com/hc/en-us/articles/202558889
[8] Pix4D Support, Information i9013, image geolocation recorded by DJI drones is not precise enough. https://support.pix4d.com/hc/en-us/articles/204857185
