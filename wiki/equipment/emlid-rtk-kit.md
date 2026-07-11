# Emlid RTK Kit

The **Emlid RTK Kit** is the recommended GNSS package for the mapping course: a Reach RS4 base station at $3,900, a Reach RX2 rover at $2,400, and Emlid's base and rover accessories kit at $1,294 with tripod, tribrach, survey pole, and bipod, about $7,594 before tax [1] [2]. The base feeds RTK corrections to the [Matrice 4E](dji-matrice-4e.md) for accurately geotagged imagery, and the rover measures ground control points and checkpoints on a pole, the two distinct jobs separated in [RTK and PPK Positioning](../topics/rtk-and-ppk-positioning.md). The kit is what turns the enterprise drones' built-in RTK capability from a spec sheet line into a teachable survey workflow.

## Reach RS4 base station

The RS4 is Emlid's flagship receiver, a 672-channel all-band unit tracking L1, L2, L5, and L6 signals across GPS, GLONASS, Galileo, BeiDou, QZSS, and NavIC, with RTK precision of 7 mm + 1 ppm horizontal and an IMU for tilt-compensated pole work when it plays rover [3]. As the program's base it broadcasts RTCM3 corrections three ways: over its dual-band LoRa and UHF radio (915 MHz license-free or 450 MHz licensed) to radio-equipped rovers, over the internet through the free Emlid Caster NTRIP service, or over its own Wi-Fi hotspot using Local NTRIP, which needs no internet at all [3] [4]. It can log raw observations for the PPK workflows that rescue marginal days, and it doubles as a second rover or a classroom receiver when not serving as base.

## Reach RX2 rover

The RX2 is a deliberately simple pole rover: 280 g, IP68 sealed, 16 hours on a charge, the same 672-channel all-band engine and 7 mm + 1 ppm RTK precision, plus tilt compensation so students do not need a perfectly plumb pole for every shot [5]. It connects by Bluetooth to a phone or tablet running Emlid Flow or third-party collectors like ArcGIS Field Maps and Survey123, which is how professional GIS field work actually happens now [1]. The critical design fact: the RX2 is a network-only rover. It has no LoRa or UHF radio, so it cannot take corrections over the RS4's radio link; it needs an NTRIP stream, either the RS4's corrections relayed through Emlid Caster (both ends need internet), the RS4's Local NTRIP hotspot at close range, or a network service like CRTN, the regional caster described in [RTK and PPK Positioning](../topics/rtk-and-ppk-positioning.md) [4] [5]. On remote sites without cell coverage this is a real operational constraint worth teaching explicitly.

## Feeding corrections to the Matrice 4E

The December memo flagged verification of Emlid-to-DJI compatibility as an action item [1]. That verification now stands: Emlid publishes official documentation for using the RS4 as a base for DJI RTK drones [6]. The workflow is the Custom Network RTK option in DJI Pilot 2. With internet available, the RS4 pushes corrections to Emlid Caster and the RC Plus 2 controller subscribes over its own connection. Without internet, the RS4's Local NTRIP mode turns the receiver into a Wi-Fi hotspot broadcasting its own caster, and the controller simply joins that network [4] [6]. Both paths deliver RTCM3, the open standard, which is the deeper lesson: the same base can serve the drone, the RX2, and any other brand's RTCM3 rover at once.

## Why Emlid over Trimble

The planning memo works through the decision honestly [7]. Trimble is the incumbent standard in many survey organizations, and students may encounter it at employers. But Trimble equipment costs several times more for capability the program does not need, and the pedagogical bet is that a good drone pilot in this era is adaptable across tools: base and rover concepts, fix versus float discipline, and NTRIP configuration transfer directly, while the button layouts do not matter. For a student starting from zero, Emlid is the better value, and for a program equipping itself from a fixed budget, the difference funds an entire training fleet. The same reasoning appears in the equipment memo's recommendation to Ron [1].

## What the kit enables in AERO 110

The course outline's RTK objectives map onto this kit directly: students set up the base over a known or averaged point, connect rover and drone to corrections, verify fix before recording, place and survey ground control targets, and use independent checkpoints to prove map accuracy [8]. Those practices are developed in [Ground Control Points](../topics/ground-control-points.md) and [Mapping Accuracy](../topics/mapping-accuracy.md), with the coordinate system bookkeeping from [Map Projections and Coordinate Systems](../topics/map-projections-and-coordinate-systems.md) and [Vertical Datums and Geoid Models](../topics/vertical-datums-and-geoid-models.md).

## Related

- [Equipment Overview](equipment-overview.md) for budget context.
- [DJI Matrice 4E](dji-matrice-4e.md) for the aircraft these corrections feed.
- [RTK and PPK Positioning](../topics/rtk-and-ppk-positioning.md) for the concepts under the hardware.
- [GNSS Fundamentals](../topics/gnss-fundamentals.md) for the positioning basics.
- [Ground Control Points](../topics/ground-control-points.md) for what the rover measures.

## Citations

[1] Cuesta drone program equipment memo to Ron Overacker, December 11, 2025 (equipment-purchasing/drone-program-equipment-memo.typ in this repository).
[2] Emlid Store, Reach RS4, Reach RX2, and Base and Rover Accessories Kit (prices as of December 2025 memo). https://store.emlid.com/products/reach-rs4
[3] Emlid, Reach RS4 product page and specifications. https://emlid.com/reachrs4/
[4] Emlid, free NTRIP Caster and Local NTRIP overview. https://emlid.com/ntrip-caster/
[5] Emlid, Reach RX2 product page and datasheet. https://emlid.com/reachrx2/
[6] Emlid Docs, DJI RTK drone and Reach RS4 / RS4 Pro base integration. https://docs.emlid.com/reachrs4/integration/dji-rtk/
[7] Planning voice memo, drone program purchases and curriculum, December 11, 2025 (equipment-purchasing/Planning_Drone_Program_Purchases_and_Curriculum.md in this repository).
[8] AERO 110 course outline draft, objectives and equipment justification (curriculum-content/aero-110-cor-draft.md in this repository).
