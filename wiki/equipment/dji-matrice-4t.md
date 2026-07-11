# DJI Matrice 4T

The **DJI Matrice 4T** is the program's inspection aircraft, the thermal and zoom sibling of the [Matrice 4E](dji-matrice-4e.md) on the same 1.2 kilogram enterprise airframe, secured through the same separate state funding. Where the 4E trades its telephoto stack for a mechanical shutter mapping camera, the 4T carries a radiometric thermal camera, a deep hybrid zoom, and a near-infrared auxiliary light, which makes it a utility inspection and public safety machine [1]. It anchors AERO 120, and its payload combination mirrors what regional employers, above all PG&E, fly on their own inspection routes [2]. As a bare aircraft it lists around $7,700 as of mid-2026 [3].

## Thermal camera

The thermal imager is an uncooled vanadium oxide microbolometer, the standard technology explained in [Thermal Imaging](../topics/thermal-imaging.md), with 640 x 512 native resolution and a super-resolution mode that outputs 1280 x 1024 [1]. It is radiometric, meaning every pixel carries a temperature measurement rather than just a relative brightness, which is what inspection reporting requires. Getting defensible temperatures out of it still depends on the operator disciplines the thermography unit teaches: emissivity and reflected temperature handling ([Emissivity and Reflected Temperature](../topics/emissivity-and-reflected-temperature.md)), keeping targets larger than the measurement spot ([Spot Size and Measurement Distance](../topics/spot-size-and-measurement-distance.md)), and honest palette and span work ([Thermal Tuning and Palettes](../topics/thermal-tuning-and-palettes.md)). Severity calls against reference temperatures follow [Delta-T Severity Classification](../topics/delta-t-severity-classification.md).

## Zoom and visual cameras

The visual stack is a 48 MP wide camera on a 1/1.3-inch sensor with an f/1.7 aperture, a 48 MP medium telephoto, and a 48 MP telephoto on a 1/1.5-inch sensor that combine for up to 112x hybrid zoom [1]. In practice that means reading component-level detail, insulator condition, hardware corrosion, or a license plate, from hundreds of meters away, which is exactly the standoff distance discipline that [Flying Near Energized Infrastructure](../topics/flying-near-energized-infrastructure.md) demands. A laser rangefinder measures target distance to 1,800 m, useful for documenting standoff and for the spot-size arithmetic [1]. The 4T's cameras use electronic shutters only, one reason the 4E remains the mapping aircraft of the pair [1].

## Airframe, endurance, and positioning

Airframe numbers match the 4E: roughly 1,420 g maximum takeoff weight, up to 49 minutes of flight, 12 m/s wind resistance, 99.5 Wh batteries, O4 Enterprise transmission to the RC Plus 2 controller, and no standard IP weather rating [1]. The 4T also carries the integrated RTK module with 1 cm + 1 ppm horizontal accuracy, so it can fly precision-tagged missions and serve as a backup mapping demonstrator even though its electronic shutter and smaller wide sensor make it second choice for photogrammetry [1].

## Role in the program

AERO 120's course outline names the Matrice 4T as its primary aircraft for infrared theory labs, electrical and building envelope inspection exercises, solar assessment, and the public safety module, and notes that it aligns with PG&E's equipment standards [2]. That alignment is strategic: PG&E is the largest local employer of drone pilots, and training students on the payload class its inspectors fly shortens the distance from classroom to job, the pipeline mapped in [PG&E Drone Program and Training Pipeline](../analysis/pge-drone-program-and-training-pipeline.md). The operational context lives in [Infrastructure Inspection Operations](../topics/infrastructure-inspection-operations.md) and [Public Safety Drone Operations](../topics/public-safety-drone-operations.md).

Like the 4E, the 4T was purchased with state funds, so federal NDAA restrictions do not bind its use, but agencies transitioning to compliant fleets are precisely this aircraft's customer base, and the compliant alternatives, led by the Skydio X10 with its own 640 x 512 radiometric thermal sensor, are assessed in [NDAA-Compliant Platform Options](ndaa-compliant-platform-options.md).

## Related

- [Equipment Overview](equipment-overview.md) for the whole fleet.
- [DJI Matrice 4E](dji-matrice-4e.md) for the mapping sibling.
- [Thermal Imaging](../topics/thermal-imaging.md) for the sensor physics under the payload.
- [Infrastructure Inspection Operations](../topics/infrastructure-inspection-operations.md) for the work this aircraft does.
- [NDAA-Compliant Platform Options](ndaa-compliant-platform-options.md) for the compliant inspection alternatives.

## Citations

[1] DJI, Matrice 4 Series specifications. https://enterprise.dji.com/matrice-4-series/specs
[2] AERO 120 course outline draft, equipment justification (curriculum-content/aero-120-cor-draft.md in this repository).
[3] DSLRPros, DJI Matrice 4T Universal Edition listing (price as of mid-2026, $7,699 aircraft only). https://www.dslrpros.com/products/dji-matrice-4t-universal-edition-aircraft-only
