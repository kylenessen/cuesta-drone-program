# Thermal Imaging

**Thermal Imaging** on drones means capturing longwave infrared (LWIR) radiation, roughly the 8 to 14 micrometer band, and converting it into an image of apparent surface temperature. Every object above absolute zero emits infrared radiation, and the amount emitted rises steeply with temperature. A thermal camera does not see heat directly. It sees radiated infrared energy, and everything about competent thermal work follows from understanding what can corrupt the link between that radiation and the true surface temperature.

Nearly all drone thermal cameras, including the payload on the DJI Matrice 4T, use uncooled vanadium oxide (VOx) microbolometer detectors. Each pixel is a tiny element whose electrical resistance changes as absorbed infrared energy warms it. These sensors need no cryogenic cooling, which keeps them small and affordable, but they trade away some sensitivity and require periodic internal recalibration, the brief freeze and click known as flat field correction.

## Radiometric versus non-radiometric

A non-radiometric camera produces a relative picture. Hot things look bright, cold things look dark, and the pixel values carry no calibrated temperature. A radiometric camera stores a calibrated temperature estimate for every pixel, which allows measurement after the fact in analysis software. For inspection work this distinction is decisive. A defect report that says a connector was 40 degrees C above ambient requires radiometric data. The Matrice 4T thermal payload is radiometric, with a high gain mode covering -20 to 150 degrees C and a low gain mode covering 0 to 550 degrees C, and a stated accuracy of plus or minus 2 degrees C or 2 percent in high gain, whichever is greater [1].

## Sensitivity and resolution

Thermal sensitivity is quantified as NETD, noise equivalent temperature difference, the smallest temperature difference the sensor can distinguish from its own noise. Smaller is better, and values are quoted in millikelvin. The Matrice 4T sensor is specified at 50 mK or better at f/1.0 [1]. Resolution matters just as much. The 4T's native thermal resolution is 640 x 512 pixels, with a 30 Hz frame rate and a 53 mm equivalent lens giving a 45 degree diagonal field of view [1]. That is respectable for a drone payload but tiny next to visual cameras, so the practical question on every flight is whether the target subtends enough pixels for a valid measurement.

## Measurement science

Turning radiometric data into defensible temperatures is its own body of knowledge, taught as the core of a Level 1 thermography course and spread across this wiki as teachable units. [Emissivity and Reflected Temperature](emissivity-and-reflected-temperature.md) covers why the camera's reading is only an apparent temperature and how surface properties corrupt it. [Spot Size and Measurement Distance](spot-size-and-measurement-distance.md) covers the pixel geometry that limits measurement range and ties it to flying height. [Thermal Tuning and Palettes](thermal-tuning-and-palettes.md) covers the display decisions that determine whether an anomaly is visible at all. [Delta-T Severity Classification](delta-t-severity-classification.md) covers how validated measurements become graded findings on electrical and solar equipment.

## Environmental effects

The environment routinely dominates the measurement. Solar loading heats surfaces unevenly through the day, so a sun-warmed panel or roof can mask or mimic a defect. Wind convectively cools hot spots and can shrink a genuine electrical anomaly below detection. Time of day is a core planning variable. Building envelope work favors early morning or after sunset, when solar effects have faded and interior to exterior temperature differences drive the image. Search and rescue benefits from night or early morning, when the background has cooled and a warm body stands out. Light rain, fog, and high humidity attenuate LWIR and degrade both detection and measurement. How timing interacts with electrical load and solar irradiance is covered in [Delta-T Severity Classification](delta-t-severity-classification.md).

## Applications

The employment applications map directly onto these fundamentals. Electrical inspection looks for resistive heating at connectors, splices, and equipment, where the failure signature is a localized hot spot. Solar array inspection finds hot cells, bypass diode failures, and offline strings. Building envelope surveys reveal insulation gaps, moisture intrusion, and air leakage. Search and rescue and wildlife surveys exploit the contrast between warm bodies and cool backgrounds. Each application has its own timing and interpretation discipline, but all of them punish an operator who does not understand emissivity and solar loading.

## Thermal orthomosaics

Thermal images can be mapped like any other imagery, and thermal orthomosaics are common for solar farms and large roofs. The workflow inherits every photogrammetry requirement and adds new ones. The low resolution of thermal sensors forces lower altitudes or coarser ground sample distance, and the low contrast and self-similar texture of thermal scenes makes tie point matching harder, so higher overlap is standard practice. Radiometric consistency across a mission is not guaranteed, because the sensor drifts and flat field corrections shift calibration mid flight, so absolute temperatures in a stitched mosaic should be treated cautiously and anchored with ground reference measurements when they matter.

## Certification

Clients in utility, solar, and building inspection expect thermal findings from certified thermographers. The industry credential is Level 1 thermographer certification, offered in a drone-specific form as Level 1 sUAS Thermography by the Infrared Training Center (ITC) and other providers, developed in line with the American Society for Nondestructive Testing's personnel qualification guidelines [2]. The certification landscape, course costs, and career value are covered in [Level 1 Thermography Certification](../exams/level-1-thermography-certification.md).

## Related

- [Emissivity and Reflected Temperature](emissivity-and-reflected-temperature.md), [Spot Size and Measurement Distance](spot-size-and-measurement-distance.md), [Thermal Tuning and Palettes](thermal-tuning-and-palettes.md), and [Delta-T Severity Classification](delta-t-severity-classification.md) for the measurement science and craft.
- [Level 1 Thermography Certification](../exams/level-1-thermography-certification.md) for the credential pathway this knowledge feeds.
- [Electromagnetic Spectrum](electromagnetic-spectrum.md) for where LWIR sits among the bands.
- [Infrastructure Inspection Operations](infrastructure-inspection-operations.md) and [Public Safety Drone Operations](public-safety-drone-operations.md) for the work this sensing supports.
- [Agricultural Drone Applications](agricultural-drone-applications.md) for canopy-temperature water-stress and irrigation work.
- [Orthomosaics](orthomosaics.md) for the mapping workflow thermal mosaics inherit.
- [Drone Payloads](drone-payloads.md) for thermal's place in the payload taxonomy.

## Citations

[1] DJI Matrice 4 Series specifications. https://enterprise.dji.com/matrice-4-series/specs
[2] FLIR Infrared Training Center, sUAS Thermography Training. https://www.flir.com/support-center/training/suas/