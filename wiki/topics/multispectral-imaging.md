# Multispectral Imaging

**Multispectral imaging** measures reflected light in specific wavelength bands, including bands outside visible color, to reveal properties of the land that an ordinary photograph cannot show. Its best known product in drone work is NDVI, a measure of how photosynthetically active vegetation is, and it anchors an entire branch of agricultural drone applications. [1]

## NDVI

NDVI, the Normalized Difference Vegetation Index, uses the contrast between near-infrared and red reflectance to gauge photosynthetic activity, often described simply as greenness. The physical basis is well established: chlorophyll absorbs most red light for photosynthesis, while the internal cell structure of a leaf reflects near-infrared strongly, so a plant with more chlorophyll reflects more near-infrared than a stressed or unhealthy one. [2] The index normalizes that difference between the near-infrared and red bands into a single value, which is why it tracks photosynthetic activity. Because it depends on precise reflectance measurements, NDVI needs the raw sensor values discussed in [Digital Imaging](digital-imaging.md) rather than a processed JPEG. The near-infrared region it relies on is introduced in [Electromagnetic Spectrum](electromagnetic-spectrum.md). [1]

## The Red Edge

Between red and near-infrared, vegetation reflectance rises sharply over a narrow span around 690 to 730 nanometers, a transition called the red edge that is especially informative in agricultural settings. As chlorophyll content increases, absorption in the red deepens and the position of the edge shifts to longer wavelengths, which is what makes it a sensitive indicator of plant status. [3] One complication is that crops bred for agriculture are, in the brainstorm's phrase, unnaturally photosynthetic. Their photosynthetic signal can be so strong that a broadband index like NDVI saturates in a dense, healthy canopy, which reduces the ability to discern how photosynthetic capacity varies across a field. Red-edge indices are one response to that saturation, as covered in [Vegetation Indices](vegetation-indices.md). [1][3]

## Beyond Agriculture

NDVI and agriculture are the largest branch of this work, but greenness is something people care about well beyond farming, and the same measurement supports environmental and land monitoring more broadly. A practical teaching point is that analytic multispectral images look flat and boring when first opened, because their information sits across a wide range of values that must be stretched appropriately to be interpreted. That ties directly back to bit depth and raw values in [Digital Imaging](digital-imaging.md). [1]

## Related

- [Vegetation Indices](vegetation-indices.md) extends NDVI into NDRE, soil-adjusted indices, and the limits of index interpretation.
- [Electromagnetic Spectrum](electromagnetic-spectrum.md) covers the infrared region NDVI depends on.
- [Digital Imaging](digital-imaging.md) explains why analytic images need raw values and careful stretching.
- [Multispectral Field Practice](multispectral-field-practice.md) covers the calibration that makes indices comparable across dates.
- [Agricultural Drone Applications](agricultural-drone-applications.md) covers the farm use cases this measurement anchors.
- [Drone Payloads](drone-payloads.md) covers the camera and sensor payloads that capture these bands.

## Citations

[1] [Drone Course Content Brainstorm](../sources/drone-course-content-brainstorm.md), July 2026 course-content voice memo, sections on infrared and NDVI.
[2] NASA Science, "Reflected Near-Infrared Waves," on chlorophyll, near-infrared reflectance, and assessing vegetation health. https://science.nasa.gov/ems/08_nearinfraredwaves/
[3] "Red edge," on the sharp 690 to 730 nm rise in vegetation reflectance and the chlorophyll-driven shift in its position. https://en.wikipedia.org/wiki/Red_edge
