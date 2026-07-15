# AERO 100 Student-Built Drone

The **AERO 100 Student-Built Drone** is a proposed pivot for the basic operator course, in which students spend the semester building a small GPS-capable quadcopter and then pass the course flight capstone on the aircraft they built. The design target is a drone that mimics a commercial platform, meaning it holds position on GPS, streams live video, returns to home on command, and flies basic autonomous waypoints, while staying small and relatively harmless. The pedagogical bet is that building the aircraft is the fastest way to learn how drones work and, just as important, how they fail: GPS loss, compass calibration, failsafe and return-to-home behavior, telemetry, tuning, and battery management all become hands-on rather than lecture material. The explicit non-goal is first-person-view racing or freestyle athleticism; the aim is careful, competent control of a platform that behaves like the professional aircraft the advanced courses fly.

This page records the build research behind that pivot: what the goal requires, budget tiers with real parts, reference builds and kits, the kit-versus-scratch tradeoff, the weight-class decision, ownership models, and safety. It is a researched proposal under consideration, not a purchase on the books; the currently planned AERO 100 fleet is the consumer DJI [Training Fleet](training-fleet.md), and the two could coexist. The firmware background is in [Flight Controller Firmware](../topics/flight-controller-firmware.md).

## What the goal requires

Mimicking a commercial platform sets a short hardware list beyond a basic drone. The aircraft needs a GPS receiver and ideally a compass for position hold and return-to-home, a barometer for altitude hold, a video or telemetry link so the pilot sees what the aircraft sees, and firmware that can fly waypoint missions. That firmware requirement is the pivotal choice, developed in [Flight Controller Firmware](../topics/flight-controller-firmware.md): iNav delivers GPS position hold, return-to-home, and waypoints on inexpensive hobby hardware, while ArduPilot and PX4 deliver the fuller commercial autopilot behavior on heavier, costlier Pixhawk-class hardware. The program's direction is to start in the iNav-class range for cost and harmlessness and treat the larger autopilot platforms as a later-semester or later-course extension.

## Budget tiers

The three tiers below are per-aircraft parts estimates, hedged as approximate for mid-2026, and are meant to frame the decision rather than to specify a final bill of materials.

The first tier is a small iNav GPS quad, roughly $180 to $280 in parts. The core is an all-in-one flight-controller-and-motor-control board such as the SpeedyBee F405 V4, about $37 for the controller alone and more as a stack with the speed controllers built in [1]. To it are added a 3 to 3.5 inch frame, small motors, a GPS-and-compass module, an ExpressLRS receiver of about $15, a small video or telemetry setup, and a lithium battery. The headline cost surprise is the GPS module: capable units now run only about $10 to $20, for example a Cyclone M1012 near $10 with a built-in compass or an HGLRC M100 near $16 [2]. This tier hits every behavior on the goal list while staying cheap enough that students could buy and keep the aircraft.

The second tier is a genuine autopilot build on ArduPilot, roughly $350 to $550 in parts. It centers on a Matek H743 flight controller, about $96 for the Mini version, chosen because it is flashable to ArduPilot, iNav, or Betaflight, so a single hardware standard can serve the whole teaching progression [3]. Around it go a 5 to 7 inch frame, separate speed controllers, a quality GPS and compass, a telemetry radio, and Mission Planner as the ground station. This tier is heavier than the first and is the honest "commercial stack" option.

The third tier is a turnkey development kit, the Holybro PX4 Development Kit X500 v2 at about $533 [4]. It ships with a Pixhawk 6C or 6X autopilot, a GPS module, a telemetry radio, a carbon frame, motors, speed controllers, and propellers, assembles without soldering in about half an hour, and runs both PX4 and ArduPilot [4]. It is the least "discovery through building," being closer to assembly than fabrication, but the most legitimately professional platform and a common choice in university programs.

## Reference builds and kits

Several existing products and documented builds prove the concept and can seed a parts list. The Flywoo Explorer LR 4 is a bind-and-fly sub-250-gram long-range quad with an integrated GPS module and a return-to-home rescue function, and owners report running iNav on it successfully, which makes it a useful reference for what a small GPS aircraft in this class looks like fully assembled [5]. On the scratch-build side, the documented "Mayfly V2.0" is a sub-250-gram four-inch long-range quad built around a GPS-navigation flight controller, an example of the from-parts version of the same idea [6]. At the turnkey end, the Holybro X500 kit above is the assembled reference [4]. These span the range from buy-it-built to build-it-from-parts without changing the underlying behavior.

## Kit versus scratch for a classroom

The learning value and the reliability risk pull in opposite directions. Scratch-building from a parts pile is where the real teaching lives, soldering, wiring, flashing firmware, calibration, and debugging why an aircraft will not arm, which is exactly the "discovery through building" the pivot is after. The risk is time and yield: a from-scratch build can consume weeks and produce dead boards, which is a serious hazard when the instructor is also learning. A common middle path in college programs is a parts list that the college pre-vets and buys in bulk, so the build is reproducible year to year, while students still perform all assembly and configuration. That keeps the pedagogy of scratch-building with much of the reliability of a kit, and it fits either ownership model below. Community-college precedents for build-it-yourself drone courses exist to borrow from, including programs at Germanna and Fullerton and the Carnegie Mellon CoDrone curriculum.

## Weight class and what it teaches

The build's weight is a deliberate curriculum lever rather than a fixed constraint. An aircraft kept under 250 grams is exempt from FAA registration and from Remote Identification, while one at 250 grams or more triggers both [7]. Because the flight capstone scores the same at any weight, as noted in [NIST Open Test Lane](../exams/nist-open-test-lane.md), the program can choose the weight class for its teaching value. The current direction is not to impose a hard sub-250-gram limit: a build at or above 250 grams pulls [Drone Registration](../regulations/drone-registration.md) and [Remote Identification](../regulations/remote-identification.md) into the course as compliance tasks students actually perform, turning two regulatory topics into lived procedure. The tradeoff is that a heavier aircraft is less harmless and loses the simplicity of the unregistered class, so the decision is a balance between administrative ease and richer regulatory content.

## Ownership models

Two models were raised, and the parts choices suit both. In the first, Cuesta owns a fleet: the college buys a pile of parts, students build and later disassemble the aircraft, and the parts are reused the following year. This favors durable, standardized, repairable components and a fixed bill of materials. In the second, students buy their own parts and keep the finished drone, which favors low per-student cost and clear individual sourcing. The pre-vetted-parts-list approach serves either model, and the first, cheaper tier is the one that makes the buy-and-keep model realistic for students.

## Safety

Keeping the aircraft harmless rests on a few levers. Staying small, and where possible sub-250-gram, keeps prop energy low; propeller guards or ducts reduce injury and damage risk further; and early manual-flight weeks flown in a net enclosure or gymnasium contain the roughest attempts. Lithium-polymer battery handling is its own discipline, covered in [Battery Fundamentals and Safety](../topics/battery-fundamentals-and-safety.md), and a build course adds charging-bag, storage-voltage, and fireproof-charging-area practice to it. These habits are themselves teachable content that transfers directly to the enterprise aircraft.

## Open questions and next steps

The budget per drone is not yet set, and it drives the tier choice, so it is the first decision to make. The suggested prototyping path is to build one first-tier sub-250-gram iNav GPS quad to learn the whole pipeline cheaply and quickly, while pricing a Matek H743 build in parallel as the "does the course want the real commercial stack" comparison. The H743 is the recommended hedge, because a single reflashable board can serve both the harmless small build and the commercial-autopilot goal depending on configuration, which keeps Cuesta's bulk-parts model coherent.

## Related

- [Flight Controller Firmware](../topics/flight-controller-firmware.md) for the iNav, ArduPilot, and PX4 choice this build rests on.
- [Training Fleet](training-fleet.md) for the currently planned consumer DJI aircraft this pivot would supplement or replace.
- [Equipment Overview](equipment-overview.md) for how AERO 100 equipment fits the program budget.
- [NIST Open Test Lane](../exams/nist-open-test-lane.md) for the weight-agnostic flight capstone this aircraft is built to pass.
- [Drone Registration](../regulations/drone-registration.md) and [Remote Identification](../regulations/remote-identification.md) for the rules a build at or above 250 grams brings into scope.
- [Battery Fundamentals and Safety](../topics/battery-fundamentals-and-safety.md) for the lithium-battery discipline a build course teaches.

## Citations

[1] SpeedyBee F405 V4 Flight Controller listing (price approximate, mid-2026). https://www.progressiverc.com/products/speedybee-f405-v4-flight-controller
[2] Oscar Liang, I Tested 20 GPS Modules to Find the Best for FPV Drones (module names and prices, mid-2026). https://oscarliang.com/gps-review/
[3] Matek H743-Slim V3 Flight Controller listing, RaceDayQuads (price approximate, mid-2026). https://www.racedayquads.com/products/matek-h743-slim-30x30-flight-controller
[4] Holybro, PX4 Development Kit X500 v2 (kit contents, no-solder assembly, PX4 and ArduPilot support, price about $533 mid-2026). https://holybro.com/products/px4-development-kit-x500-v2
[5] Flywoo Explorer LR 4 sub-250g long-range quad with GPS return-to-home (getfpv listing). https://www.getfpv.com/flywoo-explorer-lr-hd-4-v2-micro-long-range-fpv-ultralight-quad-bnf-w-caddx-nebula-pro-hd-system.html
[6] "Mayfly V2.0" sub-250g 4" long-range GPS build (documented build, RotorBuilds). https://rotorbuilds.com/build/30031
[7] FAA, Register Your Drone (250 gram registration and Remote ID threshold). https://www.faa.gov/uas/getting_started/register_drone
