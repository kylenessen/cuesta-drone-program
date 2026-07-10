---
type: Topic
title: Thermal Imaging
description: Longwave infrared physics, radiometric measurement, and interpretation traps for drone-based thermal work, with the DJI Matrice 4T as the working example.
tags: [remote-sensing]
acs_area: general
timestamp: 2026-07-09T18:00:00Z
---

# Thermal Imaging

**Thermal Imaging** on drones means capturing longwave infrared (LWIR) radiation, roughly the 8 to 14 micrometer band, and converting it into an image of apparent surface temperature. Every object above absolute zero emits infrared radiation, and the amount emitted rises steeply with temperature. A thermal camera does not see heat directly. It sees radiated infrared energy, and everything about competent thermal work follows from understanding what can corrupt the link between that radiation and the true surface temperature.

Nearly all drone thermal cameras, including the payload on the DJI Matrice 4T, use uncooled vanadium oxide (VOx) microbolometer detectors. Each pixel is a tiny element whose electrical resistance changes as absorbed infrared energy warms it. These sensors need no cryogenic cooling, which keeps them small and affordable, but they trade away some sensitivity and require periodic internal recalibration, the brief freeze and click known as flat field correction.

## Radiometric versus non-radiometric

A non-radiometric camera produces a relative picture. Hot things look bright, cold things look dark, and the pixel values carry no calibrated temperature. A radiometric camera stores a calibrated temperature estimate for every pixel, which allows measurement after the fact in analysis software. For inspection work this distinction is decisive. A defect report that says a connector was 40 degrees C above ambient requires radiometric data. The Matrice 4T thermal payload is radiometric, with a high gain mode covering -20 to 150 degrees C and a low gain mode covering 0 to 550 degrees C, and a stated accuracy of plus or minus 2 degrees C or 2 percent in high gain, whichever is greater [1].

## Emissivity and reflected temperature

The two classic interpretation traps are emissivity and reflected temperature. Emissivity is a surface's efficiency at radiating energy compared to a perfect blackbody, on a scale of 0 to 1. Most organic materials, painted surfaces, and concrete sit near 0.9 or above. Polished and bare metals can fall to 0.1 or lower [2]. A low emissivity surface emits little of its own energy and instead reflects the infrared environment around it, behaving like an infrared mirror. Point a camera at shiny aluminum and most of the signal reaching the detector is reflected from the surroundings, so the reading can be wildly wrong, sometimes by very large margins on hot targets [2] [3]. This is why a shiny conductor clamp can hide a real overheating problem, and why a cold clear sky reflected off metal roofing can produce absurdly low readings. Radiometric software lets you set emissivity and reflected apparent temperature per image or per measurement, and thermographers on the ground sometimes add a patch of high emissivity material such as electrical tape to get a trustworthy reference reading [2].

## Sensitivity and resolution

Thermal sensitivity is quantified as NETD, noise equivalent temperature difference, the smallest temperature difference the sensor can distinguish from its own noise. Smaller is better, and values are quoted in millikelvin. The Matrice 4T sensor is specified at 50 mK or better at f/1.0 [1]. Resolution matters just as much. The 4T's native thermal resolution is 640 x 512 pixels, with a 30 Hz frame rate and a 53 mm equivalent lens giving a 45 degree diagonal field of view [1]. That is respectable for a drone payload but tiny next to visual cameras, so the practical question on every flight is whether the target subtends enough pixels for a valid measurement. Standoff distance, lens choice, and required detail have to be balanced deliberately.

## Environmental effects

The environment routinely dominates the measurement. Solar loading heats surfaces unevenly through the day, so a sun-warmed panel or roof can mask or mimic a defect. Wind convectively cools hot spots and can shrink a genuine electrical anomaly below detection. Time of day is a core planning variable. Building envelope work favors early morning or after sunset, when solar effects have faded and interior to exterior temperature differences drive the image. Search and rescue benefits from night or early morning, when the background has cooled and a warm body stands out. Light rain, fog, and high humidity attenuate LWIR and degrade both detection and measurement.

## Applications

The employment applications map directly onto these fundamentals. Electrical inspection looks for resistive heating at connectors, splices, and equipment, where the failure signature is a localized hot spot. Solar array inspection finds hot cells, bypass diode failures, and offline strings. Building envelope surveys reveal insulation gaps, moisture intrusion, and air leakage. Search and rescue and wildlife surveys exploit the contrast between warm bodies and cool backgrounds. Each application has its own timing and interpretation discipline, but all of them punish an operator who does not understand emissivity and solar loading.

## Thermal orthomosaics

Thermal images can be mapped like any other imagery, and thermal orthomosaics are common for solar farms and large roofs. The workflow inherits every photogrammetry requirement and adds new ones. The low resolution of thermal sensors forces lower altitudes or coarser ground sample distance, and the low contrast and self-similar texture of thermal scenes makes tie point matching harder, so higher overlap is standard practice. Radiometric consistency across a mission is not guaranteed, because the sensor drifts and flat field corrections shift calibration mid flight, so absolute temperatures in a stitched mosaic should be treated cautiously and anchored with ground reference measurements when they matter.

## Certification

The industry credential is Level 1 thermographer certification, offered in a drone-specific form as Level 1 sUAS Thermography by the Infrared Training Center (ITC) and other providers, developed in line with the American Society for Nondestructive Testing's SNT-TC-1A guidelines [4]. It signals to clients and insurers that the operator can plan a survey, set camera parameters correctly, and interpret radiometric data defensibly.

## Related

- [Electromagnetic Spectrum](/topics/electromagnetic-spectrum.md) for where LWIR sits among the bands.
- [Infrastructure Inspection Operations](/topics/infrastructure-inspection-operations.md) and [Public Safety Drone Operations](/topics/public-safety-drone-operations.md) for the work this sensing supports.
- [Orthomosaics](/topics/orthomosaics.md) for the mapping workflow thermal mosaics inherit.
- [Drone Payloads](/topics/drone-payloads.md) for thermal's place in the payload taxonomy.

## Citations

[1] DJI Matrice 4 Series specifications. https://enterprise.dji.com/matrice-4-series/specs
[2] FLIR, How Does Emissivity Affect Thermal Imaging? https://www.flir.com/discover/professional-tools/how-does-emissivity-affect-thermal-imaging/
[3] Fluke, Fixing Infrared Thermography Issues on Reflective Surfaces. https://www.fluke.com/en-us/learn/blog/thermal-imaging/fixing-thermography-reflectivity
[4] FLIR Infrared Training Center, sUAS Thermography Training. https://www.flir.com/support-center/training/suas/
