# Lighting and Sun Angle for Mapping

**Lighting and Sun Angle for Mapping** is the part of flight planning that no camera setting can substitute for. The sun's position controls shadow length, scene contrast, and several directional reflectance effects that print themselves into every image. Photogrammetry then multiplies the problem, because an orthomosaic is stitched from thousands of images taken over an hour or more, and any lighting artifact that shifts from image to image becomes a visible seam or a matching failure. Choosing when to fly is as consequential as choosing how high.

## Solar elevation through the day and the year

Solar elevation is the sun's angle above the horizon. It rises from zero at sunrise to a maximum at solar noon, and that maximum swings with the seasons. For San Luis Obispo County at about 35 degrees north latitude, the noon sun reaches roughly 78 degrees at the summer solstice but only about 31 degrees at the winter solstice. These values follow from standard solar geometry and can be computed for any site and date with the NOAA Solar Calculator [1].

Shadow length is the practical consequence. A vertical object casts a shadow equal to its height divided by the tangent of the solar elevation. At 60 degrees of elevation a 10 m tree throws a shadow under 6 m. At 30 degrees the shadow stretches past 17 m, and at 15 degrees past 37 m. A winter mapping day near the coast never offers the shadow conditions of a June midday, and a flight window that works in July can be unusable in December.

## High sun, low sun, and overcast

For most mapping products, higher sun is better. Short shadows hide less ground, illumination is more even, and there is abundant light for a fast shutter at low ISO. Long shadows do more than look dramatic. They occlude terrain, create hard black regions with no matchable texture, and move measurably during a long mission, so the same corner of a building is bright in one flight line and dark in the next. That inconsistency degrades feature matching and leaves shadow ghosting in the mosaic. Low sun has one legitimate mapping use, deliberately exaggerating microtopography for archaeological or geomorphic prospection, but that is a specialty product, not survey practice.

A solid overcast turns the entire sky into a diffuse light source. Shadows nearly vanish, contrast drops, and illumination becomes even across the site, which is why bright overcast is often excellent for orthomosaics and is commonly recommended for reflectance-sensitive work [2]. The tradeoffs are real. Less light forces slower shutter speeds or higher ISO, thin broken clouds are worse than either extreme because cloud shadows sweep across the site and change exposure image by image, and a dark overcast can starve small sensors entirely. A uniform gray sky is a gift. A partly cloudy sky is the condition most worth waiting out.

## The hotspot and sun glint

Ground surfaces are not uniform reflectors. Their brightness depends on the angle of illumination and the angle of view together, a relationship described by the bidirectional reflectance distribution function, or BRDF [3]. The most visible BRDF artifact in drone imagery is the hotspot, a bright region that appears where the viewing direction lines up with the sun behind the camera, partly because from that geometry every shadow is hidden behind the object that casts it [2] [3]. Over vegetation the effect is strong. The hotspot sits at a fixed position relative to the sun, so it drifts across the frame as the aircraft turns and shows up in an orthomosaic as bright patches and radiometric seams between flight lines. It matters most for multispectral and agricultural work, where it corrupts reflectance values, and it is one reason vegetation indices from midsummer midday flights need radiometric care [2].

Water adds a second directional problem. Sun glint is the mirror-like specular reflection of the sun off a water surface that reaches the camera when the reflection geometry lines up, and wind-roughened water spreads that mirror into broad silvery patches [4]. Glinted pixels carry information about the sun, not the water or the streambed, and glint regions in overlapping photos do not match, which frustrates reconstruction over ponds, pools, and coastline. Mitigations include flying when the sun is lower so nadir imagery avoids the glint geometry, accepting an overcast day, or planning line orientation so glint falls outside the area of interest.

## Planning the flight window

The working rule for general mapping is to fly within a few hours of solar noon with the sun comfortably high, with a solar elevation of at least about 30 degrees as a common floor, while remembering that the highest summer sun maximizes hotspot risk over vegetation and glint risk over water [2]. Check the site's solar elevation curve for the planned date with the NOAA calculator [1], estimate shadow lengths from the tallest features on site, and prefer a stable sky, either clear or uniformly overcast, over a fast-changing one. Long missions deserve one more check, that the light at the end of the last battery will still resemble the light at the start of the first.

## Related

- [Camera Exposure](camera-exposure.md) for working with the light the window provides.
- [Electromagnetic Spectrum](electromagnetic-spectrum.md) for the physics underneath reflectance.
- [Multispectral Imaging](multispectral-imaging.md) for the reflectance products most sensitive to these effects.
- [Orthomosaics](orthomosaics.md) for where lighting artifacts end up in the deliverable.

## Citations

[1] NOAA Global Monitoring Laboratory, NOAA Solar Calculator, https://gml.noaa.gov/grad/solcalc/
[2] Remote Sensing (MDPI), Practical Guidelines for Performing UAV Mapping Flights with Snapshot Sensors, https://www.mdpi.com/2072-4292/17/4/606
[3] University of Massachusetts Boston, BRDF Explained (MODIS BRDF/Albedo), https://www.umb.edu/spectralmass/terra-aqua-modis/modis/
[4] NASA Earth Observatory, The Science of Sunglint, https://science.nasa.gov/earth/earth-observatory/the-science-of-sunglint-84333/
