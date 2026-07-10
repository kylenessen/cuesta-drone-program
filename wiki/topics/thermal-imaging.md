---
type: Topic
title: Thermal Imaging
description: Longwave infrared physics, radiometric measurement, thermal tuning, spot size limits, delta-T severity classification, and the interpretation traps of drone-based thermal inspection.
tags:
  - remote-sensing
acs_area: general
timestamp: 2026-07-09T23:30:00Z
---
# Thermal Imaging

**Thermal Imaging** on drones means capturing longwave infrared (LWIR) radiation, roughly the 8 to 14 micrometer band, and converting it into an image of apparent surface temperature. Every object above absolute zero emits infrared radiation, and the amount emitted rises steeply with temperature. A thermal camera does not see heat directly. It sees radiated infrared energy, and everything about competent thermal work follows from understanding what can corrupt the link between that radiation and the true surface temperature.

Nearly all drone thermal cameras, including the payload on the DJI Matrice 4T, use uncooled vanadium oxide (VOx) microbolometer detectors. Each pixel is a tiny element whose electrical resistance changes as absorbed infrared energy warms it. These sensors need no cryogenic cooling, which keeps them small and affordable, but they trade away some sensitivity and require periodic internal recalibration, the brief freeze and click known as flat field correction.

## Radiometric versus non-radiometric

A non-radiometric camera produces a relative picture. Hot things look bright, cold things look dark, and the pixel values carry no calibrated temperature. A radiometric camera stores a calibrated temperature estimate for every pixel, which allows measurement after the fact in analysis software. For inspection work this distinction is decisive. A defect report that says a connector was 40 degrees C above ambient requires radiometric data. The Matrice 4T thermal payload is radiometric, with a high gain mode covering -20 to 150 degrees C and a low gain mode covering 0 to 550 degrees C, and a stated accuracy of plus or minus 2 degrees C or 2 percent in high gain, whichever is greater [1].

## Apparent versus true temperature

A thermal camera never measures temperature directly. It measures the infrared radiance arriving at the detector and converts it to a temperature using assumptions about the target and the path. The uncorrected reading is the apparent temperature, the temperature the target would have if it were a perfect emitter and the air in between were perfectly transparent. Recovering the true surface temperature means compensating for the target's emissivity, for the infrared energy the target reflects from its surroundings, and for atmospheric absorption over the camera-to-target distance [2]. Radiometric software applies these corrections from parameters the operator enters, so a reported temperature is only as good as the parameters behind it. Two people can pull different numbers from the same radiometric image. The certified skill is knowing which number is defensible.

## Emissivity and reflected temperature

The two classic interpretation traps are emissivity and reflected temperature. Emissivity is a surface's efficiency at radiating energy compared to a perfect blackbody, on a scale of 0 to 1. Most organic materials, painted surfaces, and concrete sit near 0.9 or above. Polished and bare metals can fall to 0.1 or lower [2]. A low emissivity surface emits little of its own energy and instead reflects the infrared environment around it, behaving like an infrared mirror. Point a camera at shiny aluminum and most of the signal reaching the detector is reflected from the surroundings, so the reading can be wildly wrong, sometimes by very large margins on hot targets [2] [3]. This is why a shiny conductor clamp can hide a real overheating problem, and why a cold clear sky reflected off metal roofing can produce absurdly low readings. Radiometric software lets you set emissivity and reflected apparent temperature per image or per measurement, and thermographers on the ground sometimes add a patch of high emissivity material such as electrical tape to get a trustworthy reference reading [2].

## Qualitative versus quantitative thermography

Thermography splits into two working modes. Qualitative thermography reads patterns and contrast without assigning trustworthy temperatures. It answers whether one connector runs hotter than its neighbors, whether a person is present in a debris field, or which module in a solar array differs from the rest. Most search and rescue and public safety work is qualitative, because the job is recognizing the presence or absence of heat rather than measuring it [4]. Quantitative thermography assigns calibrated temperatures with emissivity, reflected temperature, and distance compensation applied, and it is what defect severity classification and engineering reports require. The distinction drives equipment and technique. Qualitative work tolerates a non-radiometric camera and casual settings. Quantitative work demands a radiometric camera, deliberate parameter entry, and a target that fills enough pixels to measure, which is the spot size problem.

## Spot size ratio and measurement distance

Each pixel views the scene through a small angle called the instantaneous field of view (IFOV), quoted in milliradians. Projected onto the target, that angle defines the spot size, the area a single pixel covers at a given distance [5]. A single pixel reading is not trustworthy, because optical imperfections and stray reflections bleed neighboring radiation into it, so the practical rule is that a target must span at least 3 x 3 pixels before its temperature can be measured [5]. The resulting distance to size ratio expresses how far the camera can be from a target of a given size and still measure it [5].

For drone work this is the link between flying height and measurement validity. Doubling the standoff distance doubles the spot size, so altitude directly sets the smallest component that can be measured. A hot connector is often visible as an anomaly long before it is measurable, because detection only needs contrast while measurement needs pixels on target. Inspection flights are planned around the stricter standard, by descending, by choosing a longer lens, or by flagging the finding qualitatively and re-shooting closer.

## Sensitivity and resolution

Thermal sensitivity is quantified as NETD, noise equivalent temperature difference, the smallest temperature difference the sensor can distinguish from its own noise. Smaller is better, and values are quoted in millikelvin. The Matrice 4T sensor is specified at 50 mK or better at f/1.0 [1]. Resolution matters just as much. The 4T's native thermal resolution is 640 x 512 pixels, with a 30 Hz frame rate and a 53 mm equivalent lens giving a 45 degree diagonal field of view [1]. That is respectable for a drone payload but tiny next to visual cameras, so the practical question on every flight is whether the target subtends enough pixels for a valid measurement. Standoff distance, lens choice, and required detail have to be balanced deliberately.

## Thermal tuning and palettes

A radiometric sensor records temperatures across its full gain range, but the display can only spread its shades across a window of that range. Span is the width of the displayed temperature window and level is its midpoint, roughly the contrast and brightness of the thermal image. Automatic scaling stretches the window across the hottest and coldest objects in view, which wastes contrast whenever the scene includes sky or another extreme. Manual thermal tuning narrows the span around the temperatures of interest so subtle differences become visible, and camera features such as FLIR's 1-Touch Level/Span automate the adjustment around a chosen point in the image [6]. A moisture patch or insulation void invisible in an auto-scaled image can be obvious once the span tightens to a few degrees. Because tuning changes only the display, radiometric images can be retuned in software after the flight, which is one more reason to capture radiometric stills.

A palette maps the displayed window onto colors and changes nothing about the underlying data [7]. White hot, the most common palette, renders warm objects light and cool objects dark, and its inverse black hot is favored where a natural looking image helps, as in public safety work [7]. Ironbow is the general purpose inspection palette that makes thermal anomalies stand out quickly, and high contrast rainbow palettes reveal subtle gradients in low contrast scenes [7]. Palette choice is application and preference, and the craft habit is consistency, keeping the same palette and scale across a report so a reviewer compares like with like.

## Environmental effects

The environment routinely dominates the measurement. Solar loading heats surfaces unevenly through the day, so a sun-warmed panel or roof can mask or mimic a defect. Wind convectively cools hot spots and can shrink a genuine electrical anomaly below detection. Time of day is a core planning variable. Building envelope work favors early morning or after sunset, when solar effects have faded and interior to exterior temperature differences drive the image. Search and rescue benefits from night or early morning, when the background has cooled and a warm body stands out. Light rain, fog, and high humidity attenuate LWIR and degrade both detection and measurement.

Timing also interacts with load and irradiance. Electrical thermography needs the circuit working, because a resistive fault heats in proportion to the current through it, and surveys read best when equipment carries substantial load [8]. Solar thermography follows the same logic with the sun as the load. IEC 62446-3, the standard governing thermographic photovoltaic inspection, requires irradiance of at least 600 W/m2, which in practice means flying clear middays roughly between 10:00 and 14:00, in low wind so convection does not erase the signatures [9]. Building envelope work inverts the rule and avoids the sun entirely. The lesson for students is that the right time of day is an application decision, not a fixed rule.

## Delta-T severity classification

Quantitative electrical findings are reported as a delta-T, the temperature rise of the anomaly above a defined reference, rather than as an absolute temperature [8]. The reference is ambient air or, better, an identical component under the same load, such as the same connector on an adjacent phase [8]. Severity is then classified into bands, and a widely used scheme derived from NETA maintenance testing guidance grades findings in four tiers [8] [10].

| Temperature rise over reference | Priority | Typical action |
| --- | --- | --- |
| 1 to 10 degrees C | Low | Monitor and correct at scheduled maintenance |
| 11 to 20 degrees C | Intermediate | Plan repair |
| 21 to 40 degrees C | Serious | Schedule repair as soon as possible |
| Over 40 degrees C | Critical | Repair immediately |

The classification is only as trustworthy as the conditions behind it. Temperature rise scales with load, so a modest delta-T on a lightly loaded circuit can represent a defect that becomes critical at full load [8]. Wind suppresses the rise, and a low emissivity surface understates it. A defensible report therefore records load, wind, emissivity assumptions, and measurement distance alongside the classification.

## Applications

The employment applications map directly onto these fundamentals. Electrical inspection looks for resistive heating at connectors, splices, and equipment, where the failure signature is a localized hot spot. Solar array inspection finds hot cells, bypass diode failures, and offline strings. Building envelope surveys reveal insulation gaps, moisture intrusion, and air leakage. Search and rescue and wildlife surveys exploit the contrast between warm bodies and cool backgrounds. Each application has its own timing and interpretation discipline, but all of them punish an operator who does not understand emissivity and solar loading.

## Thermal orthomosaics

Thermal images can be mapped like any other imagery, and thermal orthomosaics are common for solar farms and large roofs. The workflow inherits every photogrammetry requirement and adds new ones. The low resolution of thermal sensors forces lower altitudes or coarser ground sample distance, and the low contrast and self-similar texture of thermal scenes makes tie point matching harder, so higher overlap is standard practice. Radiometric consistency across a mission is not guaranteed, because the sensor drifts and flat field corrections shift calibration mid flight, so absolute temperatures in a stitched mosaic should be treated cautiously and anchored with ground reference measurements when they matter.

## Certification

Clients in utility, solar, and building inspection expect thermal findings from certified thermographers. The industry credential is Level 1 thermographer certification, offered in a drone-specific form as Level 1 sUAS Thermography by the Infrared Training Center (ITC) and other providers, developed in line with the American Society for Nondestructive Testing's personnel qualification guidelines [11]. It signals that the operator can plan a survey, set camera parameters correctly, and interpret radiometric data defensibly. The certification landscape, course costs, and career value are covered in [Thermography Certification](/topics/thermography-certification.md).

## Related

- [Thermography Certification](/topics/thermography-certification.md) for the credential pathway this knowledge feeds.
- [Electromagnetic Spectrum](/topics/electromagnetic-spectrum.md) for where LWIR sits among the bands.
- [Infrastructure Inspection Operations](/topics/infrastructure-inspection-operations.md) and [Public Safety Drone Operations](/topics/public-safety-drone-operations.md) for the work this sensing supports.
- [Orthomosaics](/topics/orthomosaics.md) for the mapping workflow thermal mosaics inherit.
- [Drone Payloads](/topics/drone-payloads.md) for thermal's place in the payload taxonomy.

## Citations

[1] DJI Matrice 4 Series specifications. https://enterprise.dji.com/matrice-4-series/specs
[2] FLIR, How Does Emissivity Affect Thermal Imaging? https://www.flir.com/discover/professional-tools/how-does-emissivity-affect-thermal-imaging/
[3] Fluke, Fixing Infrared Thermography Issues on Reflective Surfaces. https://www.fluke.com/en-us/learn/blog/thermal-imaging/fixing-thermography-reflectivity
[4] FLIR, Your Perfect Palette. https://www.flir.com/discover/ots/outdoor/your-perfect-palette/
[5] FLIR, Understanding Distance:Size Ratio. https://www.flir.com/discover/professional-tools/understanding-distancesize-ratio/
[6] FLIR, What is 1-Touch Level/Span? https://www.flir.com/discover/professional-tools/what-is-1-touch-levelspan/
[7] FLIR, Picking a Thermal Color Palette. https://www.flir.com/discover/industrial/picking-a-thermal-color-palette/
[8] The Drone Life, What is a Delta T in Thermography? https://thedronelifenj.com/delta-t-thermography/
[9] vHive, Navigating the IEC Standards for Solar Farm Inspections. https://www.vhive.ai/navigating-the-iec-standards-for-solar-farm-inspections/
[10] Delta Wye Electric, Infrared Electrical Inspections. https://deltawye.com/infrared-electrical-inspection/
[11] FLIR Infrared Training Center, sUAS Thermography Training. https://www.flir.com/support-center/training/suas/