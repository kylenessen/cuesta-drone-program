# Spot Size and Measurement Distance

**Spot Size and Measurement Distance** describe the geometric limit on how far away a thermal camera can be and still measure a target's temperature. Detection has no such limit, since a hot spot can show contrast from far beyond measurement range, but a valid temperature requires enough pixels on the target. For drone thermography this is the link between flying height and whether the numbers in a report mean anything, and it is a standard unit in a Level 1 thermography course.

## Instantaneous field of view

Each pixel views the scene through a small angle called the instantaneous field of view (IFOV), quoted in milliradians and set by the lens and detector geometry. Projected onto the target, that angle defines the spot size, the area a single pixel covers at a given distance [1]. Spot size grows linearly with distance. Doubling the range doubles the width of ground or equipment each pixel averages together.

## The 3 x 3 pixel rule

A single pixel reading is not trustworthy, because optical imperfections and stray reflections bleed neighboring radiation into it. The practical rule is that a target must span at least 3 x 3 pixels before its temperature can be measured [1]. The resulting distance to size ratio expresses how far the camera can be from a target of a given size and still measure it, and manufacturers publish or let you derive it from the field of view and resolution [1].

## Flying height and lens choice

Altitude directly sets the smallest component that can be measured, and the pixel budget is small to begin with. A 640 x 512 thermal detector, the resolution of the DJI Matrice 4T payload, carries a tiny fraction of the pixels of the visual camera beside it [2]. A hot connector is often visible as an anomaly long before it is measurable, because detection only needs contrast while measurement needs pixels on target. Inspection flights are planned around the stricter standard, by descending, by choosing a longer lens, or by flagging the finding qualitatively and re-shooting closer. The reasoning parallels [Ground Sample Distance](ground-sample-distance.md) in mapping work, where altitude likewise trades coverage against the smallest thing the data can resolve.

## Related

- [Thermal Imaging](thermal-imaging.md) for the sensors whose resolution sets the pixel budget.
- [Ground Sample Distance](ground-sample-distance.md) for the same altitude-versus-detail logic in mapping.
- [Delta-T Severity Classification](delta-t-severity-classification.md) for what a valid measurement feeds.
- [Level 1 Thermography Certification](../exams/level-1-thermography-certification.md) for the credential that tests this material.

## Citations

[1] FLIR, Understanding Distance:Size Ratio. https://www.flir.com/discover/professional-tools/understanding-distancesize-ratio/
[2] DJI Matrice 4 Series specifications. https://enterprise.dji.com/matrice-4-series/specs