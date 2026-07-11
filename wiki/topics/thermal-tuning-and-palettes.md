# Thermal Tuning and Palettes

**Thermal Tuning and Palettes** are the display decisions of thermography. They determine whether an anomaly is visible on screen, and they change nothing about the underlying radiometric data. That separation between data and display is one of the first disciplines a Level 1 thermography course installs, because an untuned image hides real defects and a dramatic palette can manufacture apparent ones. The sensors producing the data are covered in [Thermal Imaging](thermal-imaging.md).

## Level and span

A radiometric sensor records temperatures across its full gain range, but the display can only spread its shades across a window of that range. Span is the width of the displayed temperature window and level is its midpoint, roughly the contrast and brightness of the thermal image. Automatic scaling stretches the window across the hottest and coldest objects in view, which wastes contrast whenever the scene includes sky or another extreme. Manual thermal tuning narrows the span around the temperatures of interest so subtle differences become visible, and camera features such as FLIR's 1-Touch Level/Span automate the adjustment around a chosen point in the image [1]. A moisture patch or insulation void invisible in an auto-scaled image can be obvious once the span tightens to a few degrees.

Because tuning changes only the display, radiometric images can be retuned in software after the flight. That is one more reason to capture radiometric stills, since a poorly tuned but radiometric image is recoverable and a non-radiometric screenshot is not.

## Palettes

A palette maps the displayed window onto colors and, like tuning, changes nothing about the data [2]. White hot, the most common palette, renders warm objects light and cool objects dark, and its inverse black hot is favored where a natural looking image helps, as in public safety work [2]. Ironbow is the general purpose inspection palette that makes thermal anomalies stand out quickly, and high contrast rainbow palettes reveal subtle gradients in low contrast scenes [2]. Palette choice is application and preference, and the craft habit is consistency, keeping the same palette and scale across a report so a reviewer compares like with like.

## Related

- [Thermal Imaging](thermal-imaging.md) for the radiometric data these decisions display.
- [Delta-T Severity Classification](delta-t-severity-classification.md) for the interpretation the tuned image feeds.
- [Level 1 Thermography Certification](../exams/level-1-thermography-certification.md) for the credential that tests this material.

## Citations

[1] FLIR, What is 1-Touch Level/Span? https://www.flir.com/discover/professional-tools/what-is-1-touch-levelspan/
[2] FLIR, Picking a Thermal Color Palette. https://www.flir.com/discover/industrial/picking-a-thermal-color-palette/