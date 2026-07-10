# Multispectral Imaging

**Multispectral imaging** measures reflected light in specific wavelength bands, including bands outside visible color, to reveal properties of the land that an ordinary photograph cannot show. Its best known product in drone work is NDVI, a measure of how photosynthetically active vegetation is, and it anchors an entire branch of agricultural drone applications. [1]

## NDVI

NDVI, the Normalized Difference Vegetation Index, uses the contrast between near-infrared and red reflectance to gauge photosynthetic activity, often described simply as greenness. Healthy, actively photosynthesizing vegetation reflects strongly in the near-infrared and absorbs red light, and the index normalizes that difference into a single value. Because it depends on precise reflectance measurements, NDVI needs the raw sensor values discussed in [Digital Imaging](/topics/digital-imaging.md) rather than a processed JPEG. The near-infrared region it relies on is introduced in [Electromagnetic Spectrum](/topics/electromagnetic-spectrum.md). [1]

## The Red Edge

Between red and near-infrared, vegetation reflectance rises sharply, a transition called the red edge that is especially informative in agricultural settings. One complication is that crops bred for agriculture are, in the brainstorm's phrase, unnaturally photosynthetic. Their photosynthetic signal can be so strong that it saturates, which reduces the ability to discern how photosynthetic capacity varies across a field. [1]

## Beyond Agriculture

NDVI and agriculture are the largest branch of this work, but greenness is something people care about well beyond farming, and the same measurement supports environmental and land monitoring more broadly. A practical teaching point is that analytic multispectral images look flat and boring when first opened, because their information sits across a wide range of values that must be stretched appropriately to be interpreted. That ties directly back to bit depth and raw values in [Digital Imaging](/topics/digital-imaging.md). [1]

## Related

- [Electromagnetic Spectrum](/topics/electromagnetic-spectrum.md) covers the infrared region NDVI depends on.
- [Digital Imaging](/topics/digital-imaging.md) explains why analytic images need raw values and careful stretching.
- [Drone Payloads](/topics/drone-payloads.md) covers the camera and sensor payloads that capture these bands.

## Citations

[1] [Drone Course Content Brainstorm](/sources/drone-course-content-brainstorm.md), July 2026 course-content voice memo, sections on infrared and NDVI.
