# Multispectral Field Practice

**Multispectral Field Practice** covers the working layer of multispectral drone surveys, the calibration and workflow steps that separate a decorative NDVI map from a measurement. The theory, NDVI, the red edge, and why healthy vegetation reflects strongly in the near infrared, is covered in [Multispectral Imaging](multispectral-imaging.md). This page assumes that background and deals with what happens in the field and in processing. The program currently has no multispectral hardware, so this content is taught conceptually against the same radiometric reasoning students practice with RGB and thermal sensors.

## Why calibration is the whole game

A multispectral camera records digital numbers that depend on both the target and the illumination. The same field photographed under thin cloud and under full sun yields different raw values, so vegetation indices computed from raw imagery are not comparable between flights, or even within one flight if the light changed. The point of the calibration workflow is to convert digital numbers to reflectance, a property of the surface alone. Reflectance maps from June can then be compared to reflectance maps from August, which is what agricultural monitoring actually requires.

Two instruments do this work. A calibrated reflectance panel is a target with known reflectance in each band, photographed on the ground immediately before and after each flight. Processing software uses those panel images to anchor the conversion from digital numbers to reflectance. A downwelling light sensor (DLS) rides on top of the aircraft, measures ambient irradiance and sun angle in each band for every image, and writes those values into the image metadata so software can correct for illumination changes mid flight, such as clouds crossing the sun [1]. The panel anchors the flight, the DLS tracks change during it, and serious workflows use both. Field discipline matters here. The panel must be photographed level, unshadowed, and without the operator's reflection in play, and flights in rapidly changing cloud remain compromised even with a DLS.

## Band-to-band registration

Most multispectral cameras are actually several small cameras, one per band, displaced by a few centimeters and firing through separate lenses. The bands therefore do not naturally align pixel for pixel, and every index that divides one band by another assumes they do. Processing software performs band-to-band registration to align the layers before any index is computed. This mostly just works, but it degrades on close-range imagery where parallax between the lenses grows, and misregistration shows up as colored fringing along edges and as nonsense index values on fine structure. It is one reason multispectral surveys are flown higher and with generous overlap rather than at low altitude.

## The honest RGB comparison

Multispectral does not automatically beat a good RGB camera, and the honest comparison is worth teaching. Modern 20 MP mapping cameras like the one on the Matrice 4E resolve far more spatial detail than the roughly 5 MP per-band resolution typical of multispectral sensors. Visible symptoms, stand gaps, lodging, standing water, equipment damage, and gross color differences are often easier to see in high-resolution RGB, and pseudo-indices computed from RGB alone can track gross greenness. Multispectral earns its cost in three situations. First, when the signal is in the NIR and red edge, where stress physiology shows before visible symptoms appear. Second, when measurements must be quantitatively comparable across dates, which requires the reflectance workflow above. Third, when outputs feed models or prescriptions, such as variable-rate fertilizer maps, where a calibrated index is the input a downstream tool expects. For a one-time pretty map of an obviously stressed field, RGB is usually the better spend.

## Representative sensors

Two systems define the current market tiers. The DJI Mavic 3 Multispectral (Mavic 3M) integrates a 20 MP RGB camera with four 5 MP multispectral bands, green (560 nm), red (650 nm), red edge (730 nm), and near infrared (860 nm), plus a built-in sunlight sensor, and supports RTK positioning [2]. It is the accessible entry point for agricultural service work. The AgEagle (formerly MicaSense) RedEdge-P is the professional standard, capturing blue, green, red, red edge, and NIR bands at 1.6 MP each plus a 5.1 MP panchromatic band for pan-sharpening, and shipping with a calibrated reflectance panel and the DLS 2 irradiance sensor [3]. RedEdge-class sensors mount on Matrice-class aircraft and are what research groups and larger ag operations tend to fly.

## Typical products

The standard agricultural deliverables are reflectance orthomosaics per band, index maps such as NDVI and NDRE, and zone or prescription maps derived from them for variable-rate application. Time series of calibrated index maps support crop monitoring through the season, irrigation and nutrient troubleshooting, and trial plot comparison. Ecological applications use the same products for vegetation condition mapping, restoration monitoring, invasive species detection where spectral contrast permits, and riparian and wetland assessment. In every case the product's value rests on the calibration chain, which is why field practice, not sensor choice, is what distinguishes professional multispectral work.

## Related

- [Multispectral Imaging](multispectral-imaging.md) for the theory this practice implements.
- [Vegetation Indices](vegetation-indices.md) for the indices this calibration makes trustworthy.
- [Lighting and Sun Angle for Mapping](lighting-and-sun-angle-for-mapping.md) for the illumination effects calibration fights.
- [Change Detection and Repeat Mapping](change-detection-and-repeat-mapping.md) for the multi-date comparability calibration buys.
- [Agricultural Drone Applications](agricultural-drone-applications.md) and [Prescription Maps](prescription-maps.md) for the farm products this calibration underwrites.
- [Drone Payloads](drone-payloads.md) for multispectral's place in the sensor taxonomy.

## Citations

[1] MicaSense Knowledge Base, What does RedEdge's Downwelling Light Sensor (DLS) do for my data? https://support.micasense.com/hc/en-us/articles/219901327-What-does-RedEdge-s-Downwelling-Light-Sensor-DLS-do-for-my-data
[2] DJI Mavic 3M specifications. https://ag.dji.com/mavic-3-m/specs
[3] MicaSense Knowledge Base, RedEdge-P Integration Guide. https://support.micasense.com/hc/en-us/articles/4410824602903-RedEdge-P-Integration-Guide
