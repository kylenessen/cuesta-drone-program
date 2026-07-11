# Loading and Performance

**Loading and Performance** covers how what a small unmanned aircraft carries, and where it carries it, changes how the aircraft flies. It is the smallest content area on the [Part 107 Knowledge Test](../exams/part-107-knowledge-test.md) at 7 to 11 percent of questions, but its concepts (center of gravity, load factor, and the use of performance data) generalize to every payload decision students will make with mapping cameras, thermal sensors, and delivery mechanisms. [1](../sources/faa-s-acs-10b.md) [2](../sources/remote-pilot-study-guide.md)

## Weight and Balance

Every aircraft has a maximum gross takeoff weight, and under Part 107 the aircraft plus everything attached must also stay under the rule's 55-pound applicability ceiling. Loading changes do two things: added weight reduces climb performance, maneuvering margin, and endurance, and moved weight shifts the center of gravity (CG). A CG outside the manufacturer's limits degrades stability and control authority, which on a multirotor shows up as asymmetric motor loading and reduced control margin, and on a fixed-wing aircraft as pitch stability problems. The remote pilot is responsible for verifying the aircraft is loaded within its limits before flight as part of the section 107.49 preflight, using the manufacturer's performance data rather than intuition. [2](../sources/remote-pilot-study-guide.md) [1](../sources/faa-s-acs-10b.md)

For battery aircraft, weight is endurance: heavier takeoff weight raises hover power and shortens usable flight time, which compounds with the density altitude effects described in [Weather Effects on Performance](weather-effects-on-performance.md). Payload planning against remaining flight time is a practical lab exercise that makes this content area concrete. [2](../sources/remote-pilot-study-guide.md)

## Load Factor

Load factor is the ratio of the total load the aircraft structure supports to the aircraft's weight, expressed in Gs. In a coordinated, constant-altitude turn, load factor rises with bank angle regardless of aircraft type or speed, slowly at first and then at a rapidly increasing rate past about 45 to 50 degrees of bank. The exam's two takeaways: an increased load factor can dangerously overload the structure, and it raises stall speed, so an abrupt steep maneuver can stall a fixed-wing aircraft at an airspeed that seems safe. Multirotor students should still learn this; aggressive maneuvering raises structural and motor loads the same way, and the exam questions are written for the general case. [2](../sources/remote-pilot-study-guide.md)

## Takeoff, Climb, Endurance, and Landing Performance

The AERO 100 performance unit asks students to calculate what the aircraft can actually do on a given day, and the calculation always combines load with atmosphere. Takeoff and climb performance is the thrust margin left over after hovering: a heavy aircraft on a high density altitude day may lift off but climb sluggishly, with little authority left to fight wind or maneuver, so the preflight question is whether the margin suits the mission, not merely whether the aircraft can hover. Endurance is the same margin expressed in time. Manufacturer flight times are measured with no payload in still air, and realistic planning derates them for payload weight, wind, temperature (cold reduces lithium battery capacity), and battery age, then applies a reserve, landing at no less than roughly a quarter charge rather than flying to exhaustion. A useful lab exercise is timing hover endurance with and without a payload and comparing against the manufacturer's number. Landing distance, the classic manned-aviation performance figure, is trivial for a multirotor that lands vertically but real for fixed-wing aircraft, which need an approach path and rollout or a recovery area sized for the day's wind and surface; the general rule that performance data comes from the manufacturer's documentation, not intuition, is the tested point. [1](../sources/faa-s-acs-10b.md) [2](../sources/remote-pilot-study-guide.md)

## Ground Effect and Multirotor Aerodynamics

A multirotor flies on the same aerodynamics the exam tests in general form. Each propeller is a rotating wing producing lift, the flight controller varies individual motor speeds to tilt and turn the aircraft, and forward flight is a controlled lean, trading a slice of vertical thrust for horizontal motion. This is why heavy loading and high density altitude both shrink control authority: everything the aircraft does is spent from the same thrust budget. [2](../sources/remote-pilot-study-guide.md)

Ground effect is the efficiency gain a rotor experiences near the surface, where the ground interrupts the rotor's downwash and reduces the induced flow, so the same power produces more thrust. For rotors the effect is meaningful up to roughly one rotor diameter above the surface and is strongest over smooth, hard surfaces, fading over tall grass, rough terrain, or water. Research on quadrotors confirms the same behavior, with the interacting rotor wakes adding effects a single rotor does not show. Practically, ground effect means a drone hovers efficiently just above the pad and can feel floaty in the last moments of landing, and it flatters the low hover check: an aircraft marginal in ground effect will be weaker once it climbs out of it. The takeoff and landing phases where this matters are walked through in [UAV Flight Operations](uav-flight-operations.md). [3](https://www.faa.gov/regulations_policies/handbooks_manuals/aviation/helicopter_flying_handbook) [4](https://onlinelibrary.wiley.com/doi/10.1155/2017/1823056)

## Related

- [Part 107 Operating Rules](../regulations/part-107-operating-rules.md) contains the weight and speed limits that frame loading decisions.
- [Maintenance and Inspection](maintenance-and-inspection.md) covers verifying the aircraft's condition to carry its load.
- [UAV Flight Operations](uav-flight-operations.md) covers the flight phases where these margins get spent.
- [Weather Effects on Performance](weather-effects-on-performance.md) covers the density altitude half of every performance calculation.

## Citations

[1] [FAA-S-ACS-10B](../sources/faa-s-acs-10b.md), Area of Operation IV, Task A.
[2] [Remote Pilot Study Guide](../sources/remote-pilot-study-guide.md), Chapter 4, Small Unmanned Aircraft Loading.
[3] FAA, Helicopter Flying Handbook (FAA-H-8083-21B), Chapter 2, Aerodynamics of Flight, ground effect. https://www.faa.gov/regulations_policies/handbooks_manuals/aviation/helicopter_flying_handbook
[4] Sanchez-Cuevas, Heredia, and Ollero, Characterization of the Aerodynamic Ground Effect and Its Influence in Multirotor Control, International Journal of Aerospace Engineering, 2017. https://onlinelibrary.wiley.com/doi/10.1155/2017/1823056
