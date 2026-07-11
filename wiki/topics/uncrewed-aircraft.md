# Uncrewed Aircraft

An **uncrewed aircraft**, commonly called a drone, is an aircraft that does not require a human pilot physically onboard. The pilot operates it remotely from a distance, or the aircraft follows a programmed route, while the person responsible stays on the ground. This simple definition is the anchor for an advanced applications course, because everything else, the airframe, the sensors it carries, and the work it performs, hangs off the idea of flight without a pilot in the cockpit. [1]

The terminology is worth getting right, because three overlapping labels are in play and each carries a slightly different scope. The same machine is called a drone, a UAV (uncrewed or unmanned aerial vehicle), or a UAS (uncrewed or unmanned aircraft system). The distinction that matters is that UAS names the whole system rather than just the airframe. The FAA defines an unmanned aircraft system as the unmanned aircraft plus the associated elements, meaning the communication links and the components that control the aircraft, that a remote operator needs to operate safely in the national airspace system. [2][3] So "UAV" or "drone" points at the flying vehicle, while "UAS" points at the vehicle plus its control link and ground station, which is why the regulations reach for the systems term.

The unmanned-versus-uncrewed choice is a live shift rather than an open question. The FAA's regulatory language in [Part 107](../regulations/part-107.md) is still built on "small unmanned aircraft system," and federal statute likewise defines "unmanned aircraft," so "unmanned" remains the legally operative word a Part 107 student will meet on the test and in the rules. [2][3] Outside the regulations, though, much of the field has moved deliberately toward "uncrewed." NASA adopted non-gender-specific language for its programs as far back as 2006, the FAA's own Drone Advisory Committee took up gender-neutral language in 2021, and the peer-reviewed Journal of Unmanned Vehicle Systems renamed itself Drone Systems and Applications in 2022 specifically to drop the gendered term. [4][5] The practical guidance for the course is to teach "uncrewed" as the preferred contemporary usage while making clear that the FAA's rules and the Part 107 exam still say "unmanned," so students recognize both. [1]

## Airframe and Payload

For hobby flying the aircraft is the point. First-person-view (FPV) drones and toys are flown for the experience itself. Professional drones are different. They exist to carry something useful, so it helps to separate the airframe, the flying platform, from the payload, the equipment attached to it that does the actual work. A working drone is a way to lift a sensor or other payload into the sky and bring back its measurements. The range of payloads and the sensor types they represent are covered in [Drone Payloads](drone-payloads.md). [1]

## Types, Components, and Uses

The approved AERO 100 outline asks for types of UAV and their components and uses, and the taxonomy is simple enough to teach in one pass. Multirotors, with four or more fixed-pitch propellers on electric motors, dominate small drone work because they hover, take off and land vertically, and hold position for inspection and photography; nearly every aircraft in this program is one. Fixed-wing drones fly like small airplanes, trading the hover for far greater endurance and area coverage, which suits large mapping and agricultural jobs. Hybrid VTOL designs bolt lift rotors onto a fixed wing to take off vertically and then cruise on the wing, and single-rotor helicopters, efficient but mechanically complex, fill a small niche including heavy lift and spraying. [6]

Whatever the layout, the system decomposes into the same components, and naming them gives students the vocabulary the rest of the program builds on. The airframe carries brushless motors, electronic speed controllers, and propellers, driven by a rechargeable battery covered in [Battery Fundamentals and Safety](battery-fundamentals-and-safety.md). A flight controller with inertial sensors keeps the aircraft stable, aided by a GNSS receiver for position holding and navigation. The command and control link and the video downlink tie the aircraft to its ground control station, whether that is a hobby controller or a tablet running mission software, and are covered in [Drone Radio Links and Interference](drone-radio-links-and-interference.md). The payload, the camera or other sensor doing the actual work, completes the system. [6] The uses follow from the payload and appear throughout this wiki: photography and video, mapping and surveying, infrastructure inspection, agriculture, and public safety.

## From Weapons to Civilian Work

Like many technologies that later feel ordinary, drones began as military weapons platforms. The earliest were essentially small aircraft carrying munitions, valuable because they let one side strike from a distance without risking a pilot's life. That lineage has advanced rapidly in recent conflict, and Ukraine is now widely regarded as a center of expertise in drone warfare. The framing that matters for students is that the same core technology has crossed into civilian use, where the payload is a camera or another sensor rather than a weapon, and the purpose is measurement rather than destruction. [1]

## Related

- [Drone Payloads](drone-payloads.md) covers what professional drones carry and the passive and active sensor types.
- [Remote Sensing Platforms](remote-sensing-platforms.md) places drones among the other platforms that lift sensors aloft.

## Citations

[1] [Drone Course Content Brainstorm](../sources/drone-course-content-brainstorm.md), July 2026 course-content voice memo, sections on defining drones and UAVs and drones as payload platforms.
[2] Federal Aviation Administration, "What is an unmanned aircraft system (UAS)?" https://www.faa.gov/faq/what-unmanned-aircraft-system-uas
[3] 49 U.S. Code Section 44801, Definitions (unmanned aircraft and unmanned aircraft system). https://www.law.cornell.edu/uscode/text/49/44801
[4] DroneDJ, "From 'unmanned' to 'uncrewed': DroneDJ adopts gender-neutral language" (2021), documenting the FAA Drone Advisory Committee and NASA usage shift. https://dronedj.com/2021/07/13/from-unmanned-to-uncrewed-dronedj-adopts-gender-neutral-language/
[5] Canadian Science Publishing / EurekAlert, "Open access journal renamed to Drone Systems and Applications to remove gender-exclusive term from title" (2022). https://www.eurekalert.org/news-releases/940310
[6] Federal Aviation Administration, Remote Pilot Small Unmanned Aircraft Systems Study Guide (FAA-G-8082-22), aircraft types and system components; extracted text at [Remote Pilot Study Guide](../sources/remote-pilot-study-guide.md).
