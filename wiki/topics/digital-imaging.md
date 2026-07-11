# Digital Imaging

**Digital imaging** is how a camera turns light into numbers, and understanding it is foundational for professional drone work. A student who grasps what a sensor actually records, and how much of a familiar photograph is the product of later processing, can reason about the full range of a camera's capabilities rather than treating the final picture as ground truth. This matters most when images are used as data rather than as pictures. [1]

## How a Sensor Works

A digital sensor is a surface divided into a grid of tiny cells. When light strikes a cell it is converted into an electrical signal, and that signal is translated into a brightness value. A single cell yields one measurement. Millions of these measurements arranged in a grid, viewed together from a distance, form an image. The sensor on its own measures only brightness, not color. [1]

## Color and Demosaicing

Color comes from filtering the light before it reaches the cells, so that some cells see only red light, others only green, and others only blue. Each cell still records a single brightness value, now for one color. An algorithm then reconstructs a full-color image by combining neighboring cells, a step known as demosaicing. The consequence is that a color photograph is already an interpretation, built up from single-color brightness readings by software. The filtering that selects which wavelengths reach the cells is covered in [Electromagnetic Spectrum](electromagnetic-spectrum.md). [1]

## Raw Values and Processing

The image a sensor produces before processing looks flat, subtle, and unimpressive compared to what people are used to seeing. Software transforms those values, stretching and enhancing them, so the final picture looks like the scene the eye expects. This is the difference between a raw image and a processed one. The familiar photograph is the processed result, not what the sensor literally recorded. [1]

## RAW versus JPEG

A RAW file preserves the unprocessed values straight from the sensor. JPEG is a lossy format that discards information to shrink the file, collapsing detail in exchange for smaller size. For casual photography JPEG is the right choice. A reference snapshot only needs to be seen, not measured, and there is no reason to fill storage with raw values. For professional work the calculus flips. Shooting RAW preserves the most latitude to edit and the highest quality for images that will be sold or published. A RAW file can always be converted to JPEG later, but a JPEG can never be unbaked back into raw values. When images are used as data, for observation and measurement rather than viewing, RAW is essential because it stays as close as possible to what the sensor truly saw. Calculating a vegetation index such as NDVI, covered in [Multispectral Imaging](multispectral-imaging.md), depends on having those raw values. [1]

## Bit Depth

Bit depth is the number of distinct values a pixel can take, and it sets the precision of the image. Because each bit doubles the count, the total is a power of two. A standard 8-bit image allows 256 possible values, or shades of gray per channel. Analytic and multispectral images use much higher bit depths, on the order of tens of thousands of values. The brainstorm recalls figures around 32,000, which points to roughly 15- or 16-bit data, so the exact figure depends on the sensor. A useful way to picture it is a ruler. A coarse ruler marked only every quarter foot forces every measurement into a few options, which is fine for building a fence but useless for furniture. A ruler marked to fractions of an inch measures far more finely. More markings mean more precision, at a cost. On a physical ruler that cost would be weight. For a digital image the cost is storage on disk. Higher bit depth preserves more information and more ability to discern fine differences, and it is why analytic images have to be stretched carefully before they can be read at all. [1]

## Related

- [Electromagnetic Spectrum](electromagnetic-spectrum.md) explains the filtering that lets a sensor capture specific wavelengths.
- [Multispectral Imaging](multispectral-imaging.md) shows why analytic images need raw values and careful stretching.

## Citations

[1] [Drone Course Content Brainstorm](../sources/drone-course-content-brainstorm.md), July 2026 course-content voice memo, sections on understanding light and sensors, RAW versus JPEG, and bit depth.
