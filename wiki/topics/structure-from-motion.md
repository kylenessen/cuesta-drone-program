# Structure from Motion

**Structure from Motion** (SfM) is the process that lets photogrammetry software recover 3D geometry from ordinary overlapping photographs. Given a set of images taken from different positions, SfM simultaneously solves for where each camera was, which way it pointed, and where thousands of matched points sit in 3D space. It is the mathematical core of every drone mapping product, from Agisoft Metashape to Pix4D to OpenDroneMap. Everything downstream, including dense point clouds, elevation models, and orthomosaics, inherits its quality from this first solve.

Understanding what happens inside the SfM pipeline matters because the software will almost always produce something. Whether that something is survey grade depends on decisions made at each stage, and on how the project is referenced to the real world.

## Feature detection, matching, and tie points

The pipeline begins by detecting distinctive features in each photo. These are small image patches, such as corners and texture details, that can be recognized again in other photos despite changes in scale, viewing angle, and lighting. Metashape describes this as detecting points that are stable under viewpoint and lighting variation, then generating a descriptor for each point based on its local neighborhood, an approach similar to the well known SIFT algorithm [1].

The software then matches these descriptors across image pairs. A feature that is successfully matched in two or more photos becomes a tie point. Tie points are the currency of the whole reconstruction. They tie the image network together, and their multi-image observations are what make the geometry solvable. Areas with weak texture, such as water, sand, or fresh asphalt, produce few tie points and correspondingly weak geometry.

## Bundle adjustment and self-calibration

With matches in hand, the software estimates camera positions and orientations, then refines everything at once in a bundle adjustment. Bundle adjustment is a large nonlinear least squares optimization that adjusts every camera pose and every tie point coordinate together to minimize reprojection error, the difference between where a 3D point projects into an image and where it was actually observed [1].

Crucially for drone work, the adjustment also refines the camera's interior orientation. This is self-calibration. Consumer and prosumer drone cameras are not metric cameras, so the software estimates focal length, principal point offset, and radial and tangential lens distortion coefficients directly from the image network during alignment [1]. Flight design affects how well this works. Nadir-only imagery over flat ground can leave calibration parameters poorly constrained, which is one reason cross grids and oblique imagery are often recommended for projects that need reliable vertical accuracy.

The product of alignment is a sparse point cloud, made up of the triangulated tie points, plus a set of solved camera positions and calibration parameters [1]. The sparse cloud is not a deliverable. It is a byproduct of solving the cameras, useful mainly for judging alignment quality and for gradual selection and filtering before optimization.

## Depth maps and the dense point cloud

Once cameras are solved, the software can reconstruct the scene densely. In Metashape this happens in two visible steps, build depth maps and build point cloud. A depth map is a per-pixel distance image. Metashape computes depth maps for overlapping image pairs using dense stereo matching, taking the interior and exterior orientation parameters from the bundle adjustment as fixed inputs [1]. The pairwise depth maps computed for each camera are then merged into a combined depth map, with the redundant observations in overlap areas used to filter outliers, and the combined maps are fused into the dense point cloud [1].

This depth-map approach differs from classic dense matching strategies that grow the reconstruction outward from the sparse feature matches, expanding patches around tie points until coverage is achieved. Depth-map pipelines instead attempt a depth estimate for essentially every pixel of every image pair, then rely on merging and filtering to reject bad estimates. In practice the depth-map approach recovers more complete surfaces, and because depth maps are computed per image they also feed later steps directly. Metashape can build meshes, DEMs, and tiled models from depth maps without ever materializing a full dense cloud, which saves time and memory [1].

The dense cloud is typically the first true deliverable of the pipeline, often containing tens or hundreds of millions of points, and it is the source for surface models and orthomosaics.

## Referencing: geotags, ground control, and optimization

An SfM solve is internally consistent but needs external information to sit in the right place on Earth. The first source is the image geotags written by the drone's onboard GNSS. Standard consumer GNSS geotags are accurate to only a few meters, so a project referenced by geotags alone will have absolute accuracy in that same range even when relative accuracy is excellent [4]. RTK-equipped platforms with corrected geotags, such as a Matrice with an RTK module paired against a base like an Emlid unit, tighten this to centimeters [5].

The second source is [Ground Control Points](/topics/ground-control-points.md), surveyed targets marked in the images. In Metashape the workflow is to import GCP coordinates into the Reference pane, place each marker on the photos where it appears, and set appropriate accuracy values for both markers and camera coordinates so the adjustment weights each observation correctly [2]. Agisoft recommends distinguishing control points, which constrain the solution, from check points, which are withheld and used only to measure residual error [3].

Adding control after alignment does not by itself change the geometry. The critical final step is camera optimization. Running Optimize Cameras re-executes the bundle adjustment with the control point observations included, refining camera poses and calibration against the ground truth [2]. Skipping optimization after marking GCPs is one of the most common beginner errors, since the markers will then report error values against a solution they never influenced.

## Related

- [Orthomosaics](/topics/orthomosaics.md) and [Elevation Models](/topics/elevation-models.md) for the products built on this solve.
- [Ground Control Points](/topics/ground-control-points.md) for the control that anchors the adjustment.
- [Photogrammetry Software](/topics/photogrammetry-software.md) for the tools that implement the pipeline.
- [Digital Imaging](/topics/digital-imaging.md) for the image data the pipeline consumes.

## Citations

[1] Agisoft Metashape Professional Edition User Manual, version 2.2. https://www.agisoft.com/pdf/metashape-pro_2_2_en.pdf
[2] Agisoft Helpdesk, Aerial data processing (with GCPs), Orthomosaic and DEM generation. https://agisoft.freshdesk.com/support/solutions/articles/31000153696-aerial-data-processing-with-gcps-orthomosaic-dem-generation
[3] Agisoft Helpdesk, Control and Check points for aerial surveys. https://agisoft.freshdesk.com/support/solutions/articles/31000154132-control-and-check-points-for-aerial-surveys
[4] Pix4D Support, What is the relative and absolute accuracy of drone mapping. https://support.pix4d.com/hc/en-us/articles/202558889
[5] OpenDroneMap Documentation, High Precision Workflows. https://docs.opendronemap.org/map-accuracy/
