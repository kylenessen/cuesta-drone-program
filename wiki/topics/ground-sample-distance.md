# Ground Sample Distance

**Ground Sample Distance** (GSD) is the distance on the ground between the centers of two adjacent pixels in an image, usually expressed in centimeters per pixel [1]. It is the single most quoted number in drone mapping because it summarizes what a dataset can and cannot show. A 3 cm GSD means each pixel covers a 3 cm by 3 cm patch of ground, and no amount of processing will recover features meaningfully smaller than that. GSD drives altitude selection, flight time, storage volume, and client expectations, so a mapping professional needs to compute it, choose it deliberately, and explain what it does not promise.

## The formula and a worked example

GSD follows from similar triangles in the camera geometry. In its simplest form, GSD equals sensor pixel size multiplied by flying height above ground, divided by lens focal length. The equivalent form used by Pix4D works from whole-sensor numbers, GSD in cm/px equals sensor width (mm) times height (m) times 100, divided by focal length (mm) times image width (px) [1] [2].

Take the DJI Matrice 4E wide camera as the example, with a 20 MP image 5280 pixels wide and a 24 mm full-frame-equivalent focal length [3]. DJI does not publish the physical sensor width or real focal length, but the equivalent values can be used together, treating the sensor as a 36 mm full-frame equivalent. At 120 m above ground, GSD is (36 x 120 x 100) / (24 x 5280), which is about 3.4 cm/px. Using typical Four Thirds sensor dimensions instead gives roughly 3.2 cm/px, so a working figure of about 3.3 cm/px at 120 m is reasonable. The image footprint follows directly, 5280 pixels times 3.4 cm is a swath about 180 m wide and about 134 m along the other axis.

## Choosing the GSD a job requires

The right GSD comes from the smallest feature the deliverable must resolve, and from whether the job requires merely detecting that feature or identifying and measuring it. A useful rule of thumb from remote sensing practice is that a feature must span at least two to three pixels to be detected as present at all, and closer to five to ten pixels to be identified with confidence and measured. These multipliers are working guidance rather than a formal standard, but they hold up well in practice.

Concrete cases make it clear. Mapping a fence line does not require resolving the wire, which no practical GSD will show. It requires seeing the posts and the linear break they make in the landscape, which works at a 3 to 5 cm GSD. Counting individual plants is far more demanding. A seedling 10 cm across occupies only three pixels at 3 cm GSD, enough to suspect something is there but not enough to count reliably, so plant-count work typically calls for a GSD of 1 to 2 cm and therefore a low, slow flight. Ordering the deliverable question first, then computing the altitude, is the professional habit.

## Altitude, coverage, and flight time

Altitude scales GSD linearly, but its effect on flight time is not linear, and this surprises people. Each image footprint scales with altitude in both width and length, so the area covered by one photo scales with the square of altitude. Fly at half the altitude and each photo covers a quarter of the area, so the mission needs roughly four times as many photos. Flight distance grows less than that, since line length is fixed by the site while line spacing halves, roughly doubling the distance flown. On top of that, twice as many flight lines means twice as many turns, which are dead time, and a finer GSD often forces a slower flight speed to keep motion blur under control. The combined result is that halving GSD typically much more than doubles total flight time and can turn a one-battery job into a multi-battery one.

In the United States the tradeoff has a hard upper boundary. Part 107 caps operations at 400 feet (about 122 m) above ground level unless flying within 400 feet of a structure or holding a waiver [4], so the coarsest available GSD from a given camera is fixed by regulation, not preference.

## GSD is resolution, not accuracy

A fine GSD is often mistaken for an accurate map. They are different properties. GSD describes how much detail the imagery resolves. Positional accuracy describes how close mapped coordinates are to their true positions on the earth, and it is governed by georeferencing quality, meaning RTK or PPK corrections, ground control, and calibration, not by pixel size. A 1 cm GSD orthomosaic can sit meters from its true position if it was georeferenced by unaided GNSS. The ASPRS Positional Accuracy Standards, Edition 2, make the separation explicit. Accuracy classes are stated purely as RMSE values and are formally independent of GSD, with recommended pairings of GSD and achievable RMSE relegated to an annex as best-practice guidance [5] [6]. Report GSD and accuracy as two separate numbers, and expect informed clients to ask for both.

## Related

- [Cameras for Drone Mapping](cameras-for-drone-mapping.md) for the camera geometry behind the formula.
- [Camera Exposure](camera-exposure.md) for the motion blur limit that GSD sets.
- [Mapping Mission Planning](mapping-mission-planning.md) for turning a required GSD into a flyable plan.
- [Mapping Accuracy](mapping-accuracy.md) for the positional accuracy that GSD does not promise.
- [ASPRS Certified UAS Technologist](../exams/asprs-certified-uas-technologist.md) for the mapping credential that tests flight planning knowledge like this.

## Citations

[1] Pix4D, Ground sampling distance (GSD) in photogrammetry, https://support.pix4d.com/hc/en-us/articles/202559809
[2] Pix4D, Computing the Flight Height for a given GSD, https://support.pix4d.com/hc/en-us/articles/202557469
[3] DJI, Matrice 4 Series Specs, https://enterprise.dji.com/matrice-4-series/specs
[4] eCFR, 14 CFR 107.51 Operating limitations for small unmanned aircraft, https://www.ecfr.gov/current/title-14/chapter-I/subchapter-F/part-107/subpart-B/section-107.51
[5] LIDAR Magazine, Overview of the ASPRS Positional Accuracy Standards for Digital Geospatial Data, https://lidarmag.com/2025/06/30/overview-of-the-asprs-positional-accuracy-standards-for-digital-geospatial-data/
[6] GPS World, ASPRS approves edition 2 of the ASPRS Positional Accuracy Standards for Digital Geospatial Data, https://www.gpsworld.com/asprs-approves-edition-2-of-the-asprs-positional-accuracy-standards-for-digital-geospatial-data/
