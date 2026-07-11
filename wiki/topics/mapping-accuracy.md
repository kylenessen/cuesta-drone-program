# Mapping Accuracy

**Mapping Accuracy** is the discipline of stating, measuring, and defending how close a drone-derived map is to the truth. Accuracy claims carry professional and legal weight. A contractor grades to the surface, an engineer designs to the contour, and an insurer relies on the measurement. The industry framework for making these claims is the ASPRS Positional Accuracy Standards for Digital Geospatial Data, and the working currency is root mean square error computed against independent checkpoints.

## Horizontal versus vertical accuracy

Horizontal accuracy describes error in easting and northing. Vertical accuracy describes error in elevation, and for photogrammetry it is reliably the weaker of the two. The reasons are structural. Height in a photogrammetric model comes from parallax between overlapping images, so vertical precision degrades with the base-to-height geometry of near-vertical photography. Errors in the self-calibrated camera model, especially focal length and radial distortion, project preferentially into the vertical, producing systematic doming or bowling of the surface. And the vertical result additionally rides on the datum chain described in [Vertical Datums and Geoid Models](vertical-datums-and-geoid-models.md), where a mishandled geoid shifts everything by tens of meters. A practical rule of thumb is to expect vertical RMSE two to three times the horizontal RMSE from the same flight, and to plan checkpoints accordingly.

## The ASPRS standards

The current standard is Edition 2 of the ASPRS Positional Accuracy Standards for Digital Geospatial Data, first published in August 2023 with a version 2 revision in June 2024 [1] [2]. Edition 2 made several changes that matter for drone work. It eliminated references to the 95 percent confidence level as an accuracy measure, making RMSE the sole reporting statistic. It abandoned fixed accuracy classes in favor of unlimited classes, meaning the producer or client states the required RMSE and that value becomes the standard the product is tested against. It raised the minimum checkpoint count for a full assessment from 20 to 30 and capped required checkpoints at 120 for large projects. It relaxed the older rule that control had to be several times more accurate than the product, instead propagating control and checkpoint error into the reported product accuracy. It also removed the pass or fail requirement on Vegetated Vertical Accuracy, which is now reported as found, while Non-Vegetated Accuracy remains the acceptance threshold [2] [3]. Usefully for a drone program, Edition 2 ships with six addenda of best practices, including one dedicated to UAS photogrammetric and lidar operations and one on field surveying of control and checkpoints [3].

## RMSE-based reporting

RMSE is the square root of the mean of squared differences between coordinates measured on the product and the same points' surveyed coordinates. It is computed per component, RMSE in easting, RMSE in northing, and RMSE in elevation, with horizontal accuracy reported as a combined RMSE of the two horizontal components and vertical accuracy reported as the elevation RMSE [1]. Because RMSE blends bias and scatter, a competent report also examines the mean error. A vertical mean error near the vertical RMSE signals a systematic offset, usually a datum or base station problem, rather than random noise. An accuracy statement is only meaningful with its context attached, the coordinate system and geoid, the number and distribution of checkpoints, and whether the checkpoints were truly independent.

## Validating with independent checkpoints

The test points must not have participated in the adjustment. Checkpoints are surveyed with the same care as control, ideally with an RTK rover on fixed solutions as described in [Ground Control Points](ground-control-points.md), distributed evenly across the product and across the site's elevation range [2]. After processing, each checkpoint's map-derived coordinates are compared to its surveyed coordinates and the residuals feed the RMSE computation. Software-reported GCP residuals and the optimistic accuracy summaries in processing reports are not validation. They describe the fit of the adjustment to its own constraints. Only withheld checkpoints measure the product. For coursework-scale projects the full 30-checkpoint regime is impractical, but the logic holds at any scale. Even three to five withheld points expose gross errors and give an honest, if statistically weak, estimate.

## Common causes of accuracy failure

Most failed accuracy tests trace to a short list. Datum confusion is first, an ellipsoid treated as orthometric, the wrong geoid, the wrong foot, or a base station coordinate entered incorrectly, producing offsets from decimeters to about 30 meters. Poor ground control is second, float solutions stored as fixed, targets that moved, misidentified target centers, or all control clustered in one corner so the model pivots around it. Weak camera calibration is third. Flying a single altitude with only nadir images over flat terrain gives self-calibration little information, and the resulting focal length error appears as a smooth vertical dome. Adding oblique images, cross grids, or altitude variation, and using a mechanical shutter camera such as the Matrice 4E's wide camera, strengthens the solution [4]. Bad overlap is fourth. Insufficient forward or side overlap starves the reconstruction of tie points, and Pix4D's general recommendation is at least 75 percent frontal and 60 percent side overlap for standard mapping [5]. Each failure is cheap to prevent in planning and expensive to discover after the client does.

## Related

- [Ground Control Points](ground-control-points.md) for the checkpoints that make claims testable.
- [RTK and PPK Positioning](rtk-and-ppk-positioning.md) for the survey accuracy underneath the assessment.
- [Vertical Datums and Geoid Models](vertical-datums-and-geoid-models.md) for the largest single failure mode.
- [Ground Sample Distance](ground-sample-distance.md) for why resolution and accuracy are separate claims.
- [ASPRS Certified UAS Technologist](../exams/asprs-certified-uas-technologist.md) for the credential from the body that publishes these standards, and [ASPRS Geospatial Intern Program](../exams/asprs-geospatial-intern-program.md) for the student pathway into it.

## Citations

[1] ASPRS, Positional Accuracy Standards for Digital Geospatial Data, Edition 2. https://www.asprs.org/asprs-publications/asprs-positional-accuracy-standards-for-digital-geospatial-data
[2] GeoCue, New ASPRS Positional Accuracy Standards for Digital Geospatial Data released. https://support.geocue.com/new-asprs-positional-accuracy-standards-digital-geospatial-data-released/
[3] LIDAR Magazine, Overview of the ASPRS Positional Accuracy Standards for Digital Geospatial Data. https://lidarmag.com/2025/06/30/overview-of-the-asprs-positional-accuracy-standards-for-digital-geospatial-data/
[4] DJI, Matrice 4 Series specifications. https://enterprise.dji.com/matrice-4-series/specs
[5] Pix4D Support, Designing the image acquisition plan. https://support.pix4d.com/hc/en-us/articles/202557459
