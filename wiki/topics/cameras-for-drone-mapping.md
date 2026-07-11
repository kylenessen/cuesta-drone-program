# Cameras for Drone Mapping

**Cameras for Drone Mapping** are judged by different criteria than cameras for photography. A mapping camera is a measurement instrument. Photogrammetry software reconstructs geometry from the precise positions of matched features across thousands of images, so anything that shifts pixels, blurs texture, or buries detail in noise translates directly into reconstruction error. The properties that matter most are shutter design, sensor size and pixel pitch, resolution, focal length, and capture format. The DJI Matrice 4E wide camera, a 4/3-inch 20 MP sensor with a mechanical shutter, is the working example throughout [1].

## Mechanical versus electronic shutter

An electronic shutter on most consumer sensors is a rolling shutter. The sensor is read out line by line, so the top of the frame is captured at a slightly different moment than the bottom. From a moving drone the camera travels between the first and last row, and each row sees the world from a slightly different position. Straight features skew, and worse for mapping, the internal geometry of the image no longer matches the single-projection-center model that photogrammetry assumes. The displacement disrupts feature matching and biases camera calibration, and the effect grows with flight speed and with proximity to the ground [2] [3].

A mechanical shutter exposes the whole frame through a physical curtain, so short exposures effectively freeze one camera position per image [3]. This is why serious mapping drones carry one. The Matrice 4E wide camera offers a mechanical shutter from 2 s to 1/2000 s alongside an electronic shutter reaching 1/8000 s [1]. Modern software such as Pix4D can model and partially correct rolling shutter by interpolating camera positions across the readout, which recovers much of the accuracy at higher flight speeds, but a mechanical or global shutter remains the cleaner starting point [2] [3].

## Sensor size, megapixels, and pixel pitch

Megapixels alone are a poor quality metric. What matters is how those pixels are spread across physical silicon. Pixel pitch is the center-to-center spacing of pixels on the sensor. The Matrice 4E wide camera puts 20 MP (5280 x 3956 maximum image size) on a 4/3-inch sensor [1]. A standard Four Thirds sensor is about 17.3 mm wide, which works out to a pixel pitch of roughly 3.3 microns, though DJI does not publish the exact figure. Compare the drone's own 48 MP medium tele camera on a much smaller 1/1.3-inch sensor [1]. It has more pixels but each is far smaller, collects less light, and produces a noisier signal at the same exposure. Larger pixels mean better signal-to-noise ratio, more usable dynamic range, and more latitude before high ISO degrades the image. For mapping in real-world light, a moderate pixel count on a large sensor usually beats a high count on a tiny one.

## Focal length, field of view, and GSD

Focal length sets the field of view. The Matrice 4E wide camera has a 24 mm full-frame-equivalent focal length and an 84 degree field of view [1]. Together with sensor pixel size and flying height, focal length determines the ground sample distance, the ground footprint of one pixel [4]. A longer lens at the same altitude yields a finer GSD but a narrower swath, so more flight lines are needed to cover the same area. A wider lens covers ground faster but with coarser GSD and stronger perspective at the frame edges. Around 24 mm equivalent has become the common compromise for small mapping drones. The aperture range of f/2.8 to f/11 on the 4E wide camera gives room to manage exposure without leaning on ISO [1].

## JPEG versus RAW

The Matrice 4E wide camera records JPEG and DNG raw, while its medium tele and tele cameras record JPEG only [1]. A JPEG is an 8-bit, compressed, already-processed image. A DNG is the sensor readout with minimal processing, at higher bit depth, in an openly documented Adobe format [5]. Raw files are several times larger than JPEGs, and a mapping flight can produce thousands of images, so the storage and transfer cost is real.

For routine orthomosaic work, well-exposed JPEGs are usually sufficient, and most photogrammetry pipelines are built around them. Raw earns its cost when conditions are hard or the product demands it. High-contrast scenes with deep shadows benefit from the extra dynamic range that can be recovered before export. Radiometrically sensitive work, and any project where white balance or exposure may need correction after the fact, is safer in raw. The tradeoff is a mandatory batch-conversion step before processing, since photogrammetry software generally wants developed images as input. A common professional habit is to capture raw plus JPEG when the flight matters and storage allows, process the JPEGs first, and keep the raws as insurance.

## Related

- [Digital Imaging](digital-imaging.md) for sensor physics, demosaicing, and bit depth.
- [Camera Exposure](camera-exposure.md) for using this hardware well in flight.
- [Ground Sample Distance](ground-sample-distance.md) for how the camera geometry sets the pixel footprint.

## Citations

[1] DJI, Matrice 4 Series Specs, https://enterprise.dji.com/matrice-4-series/specs
[2] Pix4D, Improved accuracy for rolling shutter cameras, https://www.pix4d.com/blog/rolling-shutter-correction
[3] Pix4D, How to correct for the Rolling Shutter Effect, https://support.pix4d.com/hc/en-us/articles/208460436
[4] Pix4D, Ground sampling distance (GSD) in photogrammetry, https://support.pix4d.com/hc/en-us/articles/202559809
[5] Adobe, Digital Negative (DNG), https://helpx.adobe.com/camera-raw/digital-negative.html
