# Flight Controller Firmware

**Flight controller firmware** is the software running on a small drone's flight controller board that reads the aircraft's sensors and the pilot's stick inputs and turns them into motor commands many times a second. The choice of firmware family, more than any single component, decides what an aircraft can do, because the same hardware can be a manual acrobatic drone or a self-navigating one depending on which firmware it runs. Four families dominate small multirotors: Betaflight, iNav, ArduPilot, and PX4. For a program whose goal is a drone that mimics a commercial platform, meaning GPS position hold, return-to-home, and autonomous waypoints, the practical choice is between iNav and ArduPilot, both of which now run on inexpensive FPV-class hobby hardware, with PX4 and Pixhawk-class boards as the heavier professional tier. Betaflight, the default for racing and freestyle, deliberately leaves autonomous navigation out.

This page explains what the firmware does, how the four families differ, the ground stations and radios that drive them, and how firmware pairs with hardware. It is the technical background behind the platform choice recorded in [AERO 100 Student-Built Drone](../equipment/aero-100-student-built-drone.md).

## What the firmware does

Every multirotor is aerodynamically unstable and cannot be flown by hand without a computer holding it level. The flight controller is that computer, a small board carrying an inertial measurement unit, meaning accelerometers and gyroscopes, usually a barometer for altitude, and connectors for optional sensors such as a GPS receiver and a magnetometer, or compass. The firmware fuses these sensor streams into an estimate of the aircraft's attitude and position and runs a control loop that drives the motors to match what the pilot or the mission commands. It also defines the flight modes available, from fully manual through self-leveling to autonomous, and the failsafe behavior when the radio link or the battery fails. The presence and quality of the position sensors, and the firmware's ability to use them, are what separate a manual drone from one that can hold a spot in the sky and fly itself home.

## Betaflight

Betaflight is the firmware of first-person-view racing and freestyle. It is tuned for low latency and precise manual control in acro mode, where the aircraft holds no attitude of its own and does exactly what the sticks say [1]. It is the most widely used small-multirotor firmware and the easiest to source hardware for, but it is built for pilots who fly by video and stick feel, not for autonomy. Betaflight added a GPS Rescue feature that can bring a lost aircraft back toward its start point, but it has no position hold, no programmed waypoints, and no mission planning, so it does not meet the commercial-platform goal and is set aside for this program [1].

## iNav

iNav began as a fork of the Betaflight and Cleanflight lineage with navigation added, and it occupies the practical middle ground between hobby simplicity and full autonomy [1]. It runs GPS position hold, altitude hold, return-to-home, and uploaded waypoint missions, and it does so on the same inexpensive all-in-one boards the FPV world uses, from makers such as SpeedyBee, Matek, and HGLRC [1] [2]. A working iNav navigation setup wants a GPS receiver and benefits from a barometer and a compass, and iNav requires a minimum number of satellites before it will arm in GPS-dependent modes [3]. Recent versions can fly waypoints and return-to-home without a compass, though installing one is still advised for clean position hold [3]. iNav is sophisticated enough to fly an autonomous mission yet approachable enough to configure in an afternoon, which is why it is the usual way to put GPS behavior onto a small, cheap airframe [1].

## ArduPilot and PX4

ArduPilot and PX4 are the open-source autopilot stacks that run real commercial, survey, and enterprise drones. Both provide manual, assisted, and fully autonomous flight, three-dimensional waypoint missions, geofencing, terrain following, and layered failsafes for lost link, GPS glitch, and low battery [4] [5]. Their traditional home is Pixhawk-class autopilot hardware, but ArduPilot's supported-hardware list now extends well down into FPV-class boards, including 20x20mm stacks such as the SpeedyBee F405 Mini, with the caveat that flash limits exclude some optional features on most F4-generation chips while leaving the navigation core intact [8]. Both stacks expose hundreds of tunable parameters, which is the cost of their capability and the reason they are heavier to learn [1] [4]. ArduPilot's multirotor firmware is called Copter; PX4 shares much of the same hardware and mission concept with a more modern codebase [4]. A single Pixhawk board such as the Holybro Pixhawk 6C can run either stack, shipping with PX4 but flashable to ArduPilot [6]. This family is the truest mimic of a commercial platform, at the price of larger, more expensive aircraft and a steeper configuration curve.

## Ground control stations and radios

Autonomous flight needs a ground control station, meaning software on a laptop or tablet that plans missions and monitors telemetry. ArduPilot is driven by Mission Planner, PX4 by QGroundControl, and both are the same tools professional operators use, while iNav plans simpler waypoint missions in the iNav Configurator and triggers return-to-home from a switch on the radio [4] [5]. The radio link is largely independent of the firmware. A single modern control radio using the ExpressLRS protocol, such as a RadioMaster handset, works across all four firmware families, and a separate telemetry radio carries mission data to the ground station on ArduPilot and PX4 builds.

## Pairing firmware with hardware

The hardware constrains the firmware, though less than it once did. Pixhawk autopilots run ArduPilot or PX4 only, not the hobby firmwares [6]. FPV all-in-one boards all run Betaflight and iNav, and a growing share of them, including the SpeedyBee F405 Mini, also carry official ArduPilot support, with F4-generation chips giving up some optional features to flash limits [8]. Boards that bridge the worlds are valuable for teaching: an H743-class board such as the Matek H743 is flashable to iNav, Betaflight, or full-featured ArduPilot, so one piece of hardware can be reconfigured from a manual drone to a hobby-navigation drone to a scaled-down commercial autopilot as a course progresses [7] [8]. Choosing such a board lets a program standardize on a single hardware bill of materials while still exposing students to more than one firmware ecosystem.

## Relevance to the curriculum

The firmware families map onto a clear teaching progression. Betaflight teaches manual control and the mechanics of a build. iNav adds GPS behavior, meaning position hold, return-to-home, and waypoints, on cheap hardware and surfaces the real-world failure modes that matter, GPS loss, compass calibration, and failsafe response, without the weight and cost of a full autopilot. ArduPilot and PX4 are the professional destination, the stack behind the mapping and inspection platforms the advanced courses fly. Because a reflashable board can carry a student from the first to the second, the firmware choice does not have to be made once for the whole program; it can be staged. The specific platform and budget decisions built on this background are in [AERO 100 Student-Built Drone](../equipment/aero-100-student-built-drone.md).

## Related

- [AERO 100 Student-Built Drone](../equipment/aero-100-student-built-drone.md) for the build platform, budget tiers, and parts that rest on this firmware choice.
- [Drone Radio Links and Interference](drone-radio-links-and-interference.md) for the control and video links these firmwares depend on.
- [Emergency Procedures](emergency-procedures.md) for the lost-link, flyaway, and GPS-loss behavior the failsafes handle.
- [UAV Flight Operations](uav-flight-operations.md) for the flight phases these flight modes execute.
- [GNSS Fundamentals](gnss-fundamentals.md) for how the GPS positioning behind these navigation modes works.

## Citations

[1] Unmanned Tech, Betaflight vs iNav vs ArduPilot: Which Firmware Wins? https://www.unmannedtechshop.co.uk/blogs/knowledge-base/betaflight-vs-inav-vs-ardupilot-which-firmware
[2] iNAV Flight, INAV: Navigation-enabled flight control software (project repository). https://github.com/iNavFlight/inav
[3] Zbotic, iNAV Setup Guide: GPS Autonomous Flight Step-by-Step. https://zbotic.in/inav-setup-guide-gps-autonomous-flight-step-by-step/
[4] Circuit Cellar, Intro to Ardupilot and PX4 (Part 1). https://circuitcellar.com/research-design-hub/intro-to-ardupilot-and-px4-part-1/
[5] ArduPilot, Planning a Mission with Waypoints and Events (Copter documentation). https://ardupilot.org/copter/docs/common-planning-a-mission-with-waypoints-and-events.html
[6] Holybro, PX4 Development Kit X500 v2 (Pixhawk 6C compatible with PX4 and ArduPilot). https://holybro.com/products/px4-development-kit-x500-v2
[7] ArduPilot, Mateksys H743-Wing/SLIM/MINI/WLITE (Copter documentation). https://ardupilot.org/copter/docs/common-matekh743-wing.html
[8] ArduPilot, Autopilot Hardware Options (Copter documentation; supported-board list including the SpeedyBee F405 Mini, with the F4 flash-limitation note). https://ardupilot.org/copter/docs/common-autopilots.html
