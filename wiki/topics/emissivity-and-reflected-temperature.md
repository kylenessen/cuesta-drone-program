---
type: Topic
title: Emissivity and Reflected Temperature
description: Why a thermal camera reading is only apparent temperature, and how emissivity, reflection, and compensation parameters separate a defensible measurement from a wrong one.
tags:
  - remote-sensing
  - thermography
acs_area: general
timestamp: 2026-07-10T18:00:00Z
---
# Emissivity and Reflected Temperature

**Emissivity and Reflected Temperature** are the two surface properties standing between the infrared radiation a camera detects and the true temperature of the surface emitting it. They are the classic interpretation traps of thermography and the core of the measurement science a Level 1 thermography course teaches. Every temperature reported from the sensors described in [Thermal Imaging](/topics/thermal-imaging.md) passes through them, and misjudging either one produces readings that are confidently, sometimes absurdly, wrong.

## Apparent versus true temperature

A thermal camera never measures temperature directly. It measures the infrared radiance arriving at the detector and converts it to a temperature using assumptions about the target and the path. The uncorrected reading is the apparent temperature, the temperature the target would have if it were a perfect emitter and the air in between were perfectly transparent. Recovering the true surface temperature means compensating for the target's emissivity, for the infrared energy the target reflects from its surroundings, and for atmospheric absorption over the camera-to-target distance [1]. Radiometric software applies these corrections from parameters the operator enters, so a reported temperature is only as good as the parameters behind it. Two people can pull different numbers from the same radiometric image. The certified skill is knowing which number is defensible.

## Emissivity

Emissivity is a surface's efficiency at radiating energy compared to a perfect blackbody, on a scale of 0 to 1. Most organic materials, painted surfaces, and concrete sit near 0.9 or above. Polished and bare metals can fall to 0.1 or lower [1]. High emissivity surfaces are honest subjects, since nearly all the radiation leaving them is their own. Low emissivity surfaces emit little of their own energy, and whatever a camera reads off them is dominated by something other than their temperature.

## The infrared mirror problem

A low emissivity surface instead reflects the infrared environment around it, behaving like an infrared mirror. Point a camera at shiny aluminum and most of the signal reaching the detector is reflected from the surroundings, so the reading can be wildly wrong, sometimes by very large margins on hot targets [1] [2]. This is why a shiny conductor clamp can hide a real overheating problem, and why a cold clear sky reflected off metal roofing can produce absurdly low readings. The failure is invisible in the image itself. Nothing about a reflective surface looks broken on screen, which is why the trap has to be taught rather than discovered.

## Compensation in practice

Radiometric software lets the operator set emissivity and reflected apparent temperature per image or per measurement, and thermographers on the ground sometimes add a patch of high emissivity material such as electrical tape to get a trustworthy reference reading on a metal surface [1]. From a drone the tape trick is unavailable, which pushes aerial work toward comparative judgments between identical components rather than absolute readings on low emissivity targets. Those comparative judgments are formalized in [Delta-T Severity Classification](/topics/delta-t-severity-classification.md), and setting the parameters defensibly is a core competency tested by the [Level 1 Thermography Certification](/exams/level-1-thermography-certification.md).

## Related

- [Thermal Imaging](/topics/thermal-imaging.md) for the sensors these corrections apply to.
- [Delta-T Severity Classification](/topics/delta-t-severity-classification.md) for the comparative technique that sidesteps absolute measurement.
- [Spot Size and Measurement Distance](/topics/spot-size-and-measurement-distance.md) for the other validity limit on a measurement.
- [Level 1 Thermography Certification](/exams/level-1-thermography-certification.md) for the credential that tests this material.

## Citations

[1] FLIR, How Does Emissivity Affect Thermal Imaging? https://www.flir.com/discover/professional-tools/how-does-emissivity-affect-thermal-imaging/
[2] Fluke, Fixing Infrared Thermography Issues on Reflective Surfaces. https://www.fluke.com/en-us/learn/blog/thermal-imaging/fixing-thermography-reflectivity