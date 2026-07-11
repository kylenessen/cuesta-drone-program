# Weather Effects on Performance

**Weather Effects on Performance** covers how the atmosphere changes what a small unmanned aircraft can do, from thinner air stealing thrust on a hot afternoon to a gust front arriving ahead of a thunderstorm. The ACS tests this as a single dense task listing density altitude, wind and currents, stability, fronts, thunderstorms and microbursts, tornadoes, icing, hail, fog, ceiling and visibility, and lightning. For drones the emphasis differs from manned aviation: battery aircraft rarely fly far enough to cross a front, but they are acutely sensitive to wind, density altitude, and precipitation. [1](../sources/faa-s-acs-10b.md) [2](../sources/remote-pilot-study-guide.md)

## Density Altitude

Density altitude is the altitude in the standard atmosphere corresponding to the current air density. As air density decreases, from high elevation, high temperature, or high humidity, aircraft performance decreases: propellers and rotors produce less thrust, and motors work harder for the same lift, shortening flight times. The memorable formulation is high, hot, and humid means degraded performance. This links directly to [Loading and Performance](loading-and-performance.md), since a heavily loaded drone on a high density altitude day loses margin at both ends. [2](../sources/remote-pilot-study-guide.md)

## Wind, Stability, and Local Effects

Wind matters more to a 2-pound quadcopter than to anything else in the sky. Surface friction slows and shifts wind near the ground, terrain and buildings generate turbulence and rotors on their lee side, and obstruction turbulence can persist far downwind of hangars and tree lines. Convective currents over differentially heated ground produce the bumpy afternoon air students will feel in summer labs, and are also why the ACS warns against flying near thermal plumes such as smoke stacks and cooling towers.

Wind also displaces the aircraft, and correcting for wind drift is a required navigation skill in the AERO 100 outline. An aircraft moving through an air mass moves with it, so the ground track differs from the heading unless the pilot compensates by angling into the wind, the crab that manned pilots compute as a wind correction angle. GPS position hold hides this by crabbing automatically, but the correction reappears everywhere it cannot be automated: in attitude mode the aircraft simply drifts downwind and the pilot must hold a continuous upwind input; in orbits and other maneuvers the pilot adds power and correction on the upwind side to keep the circle round; and in planning, a battery spent fighting a headwind home is the classic endurance trap, so the working habit is to fly the outbound leg upwind and return with the wind. Practicing hover holds and patterns in attitude mode, as described in [Flight Proficiency and Practice Exercises](flight-proficiency-and-practice-exercises.md), is where students learn drift correction by feel. [2](../sources/remote-pilot-study-guide.md) Atmospheric stability governs whether the day builds cumulus and thunderstorms or traps haze under an inversion; temperature and dew point converging warn of fog, which destroys the visibility and cloud-clearance minimums in the [Part 107 Operating Rules](../regulations/part-107-operating-rules.md). Coastal fog cycles are a defining constraint for San Luis Obispo area field work. [2](../sources/remote-pilot-study-guide.md) [1](../sources/faa-s-acs-10b.md)

## Hazard Weather

Air masses and the fronts between them bring organized weather changes: wind shifts, pressure changes, precipitation, and cloud development, so a forecast frontal passage is a schedule risk for any field session. Thunderstorms concentrate every hazard in one cell (turbulence, downdrafts and microbursts, hail, lightning, and rapid visibility loss) through their cumulus, mature, and dissipating stages, and the beginning of rain at the surface marks the mature stage where downdrafts are strongest. All of these are go or no-go questions decided on the ground using [Aviation Weather Sources](aviation-weather-sources.md) rather than survivable in-flight events for a small UAS. [2](../sources/remote-pilot-study-guide.md)

## Structural Icing and Frost

Structural icing in flight requires two conditions together: the aircraft must be flying through visible moisture such as rain or cloud droplets, and the surface the moisture strikes must be at 0 degrees Celsius or colder, which aerodynamic cooling can produce even when the ambient air is slightly warmer. Ice accumulating on propeller blades and airframes degrades lift, adds weight and drag, and unbalances spinning rotors, and a small UAS carries no anti-ice equipment, so any structural icing is disqualifying. Frost is the ground-based cousin: on cool, clear, calm nights, surfaces radiating heat can drop below a freezing dew point and deposit frost directly. Frost does not change an airfoil's shape the way ice does, yet it disrupts airflow over the surface enough to drastically reduce lift and increase drag, which can prevent a safe takeoff. The rule the study guide states outright is that a small UA must be thoroughly cleaned and free of frost before flight, a realistic morning scenario for cold-season field sessions. [2](../sources/remote-pilot-study-guide.md)

## Related

- [Aviation Weather Sources](aviation-weather-sources.md) covers where these conditions are reported and forecast.
- [Aeronautical Decision-Making](aeronautical-decision-making.md) frames weather as a preflight risk decision.

## Citations

[1] [FAA-S-ACS-10B](../sources/faa-s-acs-10b.md), Area of Operation III, Task B, and Area II, Task B potential flight hazards.
[2] [Remote Pilot Study Guide](../sources/remote-pilot-study-guide.md), Chapter 3, Weather.
