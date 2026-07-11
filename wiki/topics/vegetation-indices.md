# Vegetation Indices

A **vegetation index** is a number computed from reflectance in two or more spectral bands that summarizes some property of a plant canopy, most often how much healthy, photosynthesizing leaf area is present. NDVI is the one everyone knows, but it is only the first of a family, and an advanced mapping course that serves agricultural students has to teach the rest, because NDVI fails in exactly the dense, high-value canopies that Central Coast growers care about. This page covers the indices beyond NDVI, when each earns its place, and the honest limits of what any index can tell you. It assumes the reflectance and red edge background from [Multispectral Imaging](multispectral-imaging.md) and the calibration chain from [Multispectral Field Practice](multispectral-field-practice.md), because every index below is only meaningful on calibrated reflectance, not raw digital numbers.

## Why NDVI is not enough

NDVI contrasts near-infrared and red reflectance, and its weakness follows directly from the red band. Chlorophyll absorbs red light so strongly that once a canopy closes and leaf layers stack up, almost all the red is already absorbed by the top of the canopy. Adding more leaf area, or more chlorophyll per leaf, barely changes the red signal, so NDVI flattens out near its maximum and stops responding. This is saturation, and it is not a rare edge case in agriculture. It is the normal condition of a vigorous vineyard in summer, a corn canopy after tasseling, or any irrigated row crop at peak growth [1] [2]. An NDVI map of a healthy mid-season field is often a nearly uniform wash of high values that hides the very within-field variation the grower is paying to see.

## The red edge and NDRE

The fix is to move the sensitive band off the saturated red and onto the red edge, the steep ramp in reflectance between red and near-infrared introduced in [Multispectral Imaging](multispectral-imaging.md). NDRE, the Normalized Difference Red Edge index, replaces NDVI's red band with a red edge band, so it is computed as the normalized difference between near-infrared and red edge reflectance. Red edge light is absorbed less completely than red, so it penetrates deeper into a closed canopy and keeps responding to changes in chlorophyll and leaf area well after NDVI has saturated [1] [3]. In practice NDRE outperforms NDVI whenever the canopy is dense and the season is well along. It tracks canopy chlorophyll, which is closely tied to nitrogen status, so it is the workhorse index for in-season nitrogen management in cereals and for vigor mapping in mature vineyards, where NDVI would show a flat green rectangle [1] [3]. The teaching rule is simple. Early in the season, over open canopies with soil showing between plants, NDVI is fine and often better. Once the canopy closes, switch to NDRE. A sensor that lacks a red edge band, which includes most consumer RGB conversions, cannot produce NDRE at all, and this is one of the concrete reasons a grower buys a real multispectral camera rather than a modified RGB one.

## Soil-adjusted indices

The opposite problem happens early. When a crop is just emerging and rows are mostly bare ground, the reflectance of the soil itself leaks into every pixel and contaminates NDVI, because bright or dark soil shifts the red and near-infrared values independently of the sparse vegetation. Soil-adjusted indices were built to suppress that background. SAVI, the Soil-Adjusted Vegetation Index, inserts a soil brightness correction term L into the NDVI denominator and rescales the result, with L set toward 1 for very sparse cover, around 0.5 for moderate cover, and toward 0 for full cover, at which point SAVI collapses back to NDVI [4] [5]. OSAVI fixes that adjustment at 0.16 as a good general compromise, and MSAVI computes the correction from the imagery itself so the operator does not have to guess L, which makes it the common choice for early-season emergence and stand assessment when soil dominates the frame [4] [5]. The practical lesson is that index choice tracks the calendar. Soil-adjusted indices at emergence, NDVI through canopy development, red edge indices once the canopy closes.

## Other indices worth naming

Two more come up often enough to name. GNDVI substitutes green for red and is sometimes more sensitive to chlorophyll variation at higher biomass than NDVI, a milder version of the same reasoning that motivates NDRE. Chlorophyll indices such as the red edge chlorophyll index (CIred-edge) use band ratios rather than normalized differences and are used similarly to NDRE for nitrogen and chlorophyll work [2]. The point for a course is not to memorize a catalog. It is to understand that indices are engineered tools, each built to be sensitive to one thing (greenness, chlorophyll, soil suppression) while being blind to others, and that the professional picks the index that matches the crop stage and the question.

## The honest limits of index interpretation

The most important thing to teach about indices is what they cannot do. An index is a symptom detector, not a diagnosis. A low or declining NDVI or NDRE zone says that something is suppressing photosynthetic vigor in that part of the field. It does not say what. Water stress, nitrogen deficiency, root disease, nematodes, salinity, compaction, gopher damage, a clogged drip line, and a spray miss can all produce the same dip in the same index. The map narrows the search to a place and flags that a problem exists. A person still has to walk that zone and find the cause, which is why the agronomic term for the workflow is scouting, and why the honest value proposition is targeted scouting rather than remote diagnosis. Two further cautions matter. Index values are only comparable across dates if the imagery was radiometrically calibrated to reflectance, the whole subject of [Multispectral Field Practice](multispectral-field-practice.md), so an uncalibrated NDVI number has no absolute meaning and cannot be trended. And absolute index thresholds do not transfer between crops, sensors, or even growth stages, so professional practice reads relative patterns within a field and within a date far more than any single published cutoff. An index map is a good question, not an answer.

## Related

- [Multispectral Imaging](multispectral-imaging.md) for NDVI, the red edge, and why healthy vegetation reflects strongly in the near-infrared.
- [Multispectral Field Practice](multispectral-field-practice.md) for the calibration that makes any index comparable across dates.
- [Agricultural Drone Applications](agricultural-drone-applications.md) for the scouting, nutrient, and irrigation work these indices feed.
- [Prescription Maps](prescription-maps.md) for how an index or zone map becomes a variable-rate instruction a tractor can run.
- [Electromagnetic Spectrum](electromagnetic-spectrum.md) for the red, red edge, and near-infrared regions the indices sample.

## Citations

[1] EOS Data Analytics, NDVI vs. NDRE: What's The Difference And How To Choose. https://eos.com/blog/ndvi-vs-ndre/
[2] Cropaia, Beyond NDVI: What Other Indices Tell Us About the Crop. https://cropaia.com/blog/beyond-ndvi-what-other-indices-tell-us-about-the-crop/
[3] Farmonaut, NDVI Vs NDRE: Top 5 Differences For Precision Farming. https://farmonaut.com/precision-farming/ndvi-vs-ndre-top-5-differences-for-precision-farming
[4] Huete, A.R. (1988), A soil-adjusted vegetation index (SAVI), Remote Sensing of Environment. https://www.sciencedirect.com/science/article/abs/pii/003442578890106X
[5] EOS Data Analytics, Vegetation Indices To Meet Challenges Of Agri Market. https://eos.com/blog/vegetation-indices/
