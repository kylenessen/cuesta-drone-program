---
type: Topic
title: Delta-T Severity Classification
description: Reporting thermal findings as temperature rise over a reference, the NETA-style severity tiers, and the load, wind, and irradiance conditions that make a classification defensible.
tags:
  - remote-sensing
  - thermography
acs_area: general
timestamp: 2026-07-10T18:00:00Z
---
# Delta-T Severity Classification

**Delta-T Severity Classification** is the interpretation discipline of quantitative thermography. A thermal finding on electrical equipment is reported as a delta-T, the temperature rise of the anomaly above a defined reference, and graded into severity tiers that drive repair priority. It is where the measurement science of [Emissivity and Reflected Temperature](/topics/emissivity-and-reflected-temperature.md) and [Spot Size and Measurement Distance](/topics/spot-size-and-measurement-distance.md) pays off, and it is the skill that separates a certified inspection report from a picture of a hot spot.

## Qualitative versus quantitative thermography

Thermography splits into two working modes. Qualitative thermography reads patterns and contrast without assigning trustworthy temperatures. It answers whether one connector runs hotter than its neighbors, whether a person is present in a debris field, or which module in a solar array differs from the rest. Most search and rescue and public safety work is qualitative, because the job is recognizing the presence or absence of heat rather than measuring it [1]. Quantitative thermography assigns calibrated temperatures with emissivity, reflected temperature, and distance compensation applied, and it is what severity classification and engineering reports require. Qualitative work tolerates a non-radiometric camera and casual settings. Quantitative work demands a radiometric camera, deliberate parameter entry, and a target that fills enough pixels to measure.

## The choice of reference

A delta-T is only meaningful relative to its reference, which is ambient air or, better, an identical component under the same load, such as the same connector on an adjacent phase [2]. The similar-component comparison is preferred because it cancels out most of what corrupts absolute measurement. Both components share the same emissivity, the same solar loading, and the same viewing geometry, so the difference between them is mostly real. The same logic applies on solar arrays, where an anomalous cell is judged against the average of nearby nominal cells [2].

## Severity tiers

Severity is classified into bands, and a widely used scheme derived from NETA maintenance testing guidance grades findings in four tiers [2] [3].

| Temperature rise over reference | Priority | Typical action |
| --- | --- | --- |
| 1 to 10 degrees C | Low | Monitor and correct at scheduled maintenance |
| 11 to 20 degrees C | Intermediate | Plan repair |
| 21 to 40 degrees C | Serious | Schedule repair as soon as possible |
| Over 40 degrees C | Critical | Repair immediately |

## Load, wind, and timing

The classification is only as trustworthy as the conditions behind it. Temperature rise scales with load, because a resistive fault heats in proportion to the current through it, so a modest delta-T on a lightly loaded circuit can represent a defect that becomes critical at full load, and surveys read best when equipment carries substantial load [2]. Wind convectively suppresses the rise, and a low emissivity surface understates it. A defensible report therefore records load, wind, emissivity assumptions, and measurement distance alongside the classification.

Timing follows the same logic. Electrical inspection wants the circuit working hard. Solar thermography wants the sun as the load, and IEC 62446-3, the standard governing thermographic photovoltaic inspection, requires irradiance of at least 600 W/m2, which in practice means flying clear middays roughly between 10:00 and 14:00 in low wind [4]. Building envelope work inverts the rule and avoids the sun entirely, flying early morning or after sunset when interior to exterior differences drive the image. The lesson for students is that the right time of day is an application decision, not a fixed rule.

## Related

- [Emissivity and Reflected Temperature](/topics/emissivity-and-reflected-temperature.md) and [Spot Size and Measurement Distance](/topics/spot-size-and-measurement-distance.md) for what makes the underlying measurement valid.
- [Infrastructure Inspection Operations](/topics/infrastructure-inspection-operations.md) for the utility inspection work this discipline serves.
- [Thermal Imaging](/topics/thermal-imaging.md) for the sensor layer.
- [Level 1 Thermography Certification](/exams/level-1-thermography-certification.md) for the credential that tests this material.

## Citations

[1] FLIR, Your Perfect Palette. https://www.flir.com/discover/ots/outdoor/your-perfect-palette/
[2] The Drone Life, What is a Delta T in Thermography? https://thedronelifenj.com/delta-t-thermography/
[3] Delta Wye Electric, Infrared Electrical Inspections. https://deltawye.com/infrared-electrical-inspection/
[4] vHive, Navigating the IEC Standards for Solar Farm Inspections. https://www.vhive.ai/navigating-the-iec-standards-for-solar-farm-inspections/