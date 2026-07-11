# RTK and PPK Positioning

**RTK and PPK Positioning** are the two workflows that turn meter-level GNSS into centimeter-level GNSS. Both rest on the same idea. A stationary receiver at a known point, the base, observes the same satellites as a moving receiver, the rover, and the shared errors cancel between them. In drone mapping the rover is either the aircraft itself, producing accurately geotagged images, or a survey pole, producing accurately measured ground control points. The program's Emlid Reach RS4 base, RX2 rover, and RTK-capable Matrice 4 aircraft cover both roles.

## Code versus carrier phase

Standard navigation receivers measure the pseudorandom code modulated onto the GNSS signal. Code measurements are unambiguous but coarse, and they support the few-meter accuracy described in [GNSS Fundamentals](gnss-fundamentals.md). Survey receivers additionally measure the phase of the carrier wave itself. The GPS L1 carrier has a wavelength of about 19 centimeters, and phase can be tracked to a small fraction of that, so the measurement is precise at the millimeter level. The catch is ambiguity. The receiver knows the fractional phase but not the whole number of carrier cycles between it and the satellite. Solving for those integer ambiguities is the central problem of carrier-phase positioning [1].

## Fix versus float

While the ambiguities are still being estimated as real numbers, the solution is called float, and its accuracy is typically at the decimeter to sub-meter level and not fully trustworthy. Once the receiver resolves the ambiguities to their correct integers, the solution is called fix, and accuracy drops to centimeters. Emlid documents its solution statuses in exactly these terms, single, float, and fix [2]. For mapping work the operating rule is simple. Record ground control and fly RTK missions only with a fixed solution, and treat float positions as unusable for control. Accuracy also degrades with distance from the base, which is why receiver specs include a parts-per-million term, for example 7 millimeters plus 1 ppm horizontal for the Reach RS4, meaning an extra millimeter of error per kilometer of baseline [3].

## Correction sources, local base or NTRIP network

Corrections can come from your own base station set over a known or averaged point, broadcasting to the rover by LoRa or UHF radio, or from a network of permanent reference stations delivered over the internet using NTRIP, the Networked Transport of RTCM via Internet Protocol. In this region the public option is the California Real Time Network, operated by the Scripps Orbit and Permanent Array Center at UC San Diego. CRTN streams RTCM corrections at 1 Hz from several hundred continuously operating GNSS stations, with access by NTRIP username and password. Registration carries a processing fee that is waived for universities and schools [4] [5]. A local base gives you full control and works with no cell coverage, but its position must be established carefully, since any error in the base coordinates shifts every rover measurement by the same amount. A network mount point ties you directly to published reference coordinates but depends on cellular data at the rover or the drone controller.

## RTK versus PPK

RTK, real-time kinematic, applies the corrections during the survey. The rover needs a continuous correction link, radio or internet, and outages or dropouts can force the solution back to float mid-flight. PPK, post-processed kinematic, records raw observations at both base and rover and resolves the trajectory in software afterward. Nothing depends on a live link, the processing can run both forward and backward through the data to recover from signal interruptions, and a marginal dataset can be reprocessed with different settings. The cost is an extra desktop step and no in-field confirmation that positions are good. In practice PPK is the more robust choice for aircraft trajectories in terrain or vegetation that threatens the correction link, while RTK is the convenient choice when the link is solid. Many workflows use both, RTK for immediate results and logged raw data as a PPK safety net.

## RTK on the drone versus RTK on the rover

These are two different jobs. RTK on the aircraft, as on the Matrice 4E with its 1 centimeter plus 1 ppm horizontal RTK positioning spec, writes accurate camera positions into each image's metadata [6]. That constrains the photogrammetric bundle adjustment from above and can deliver strong absolute accuracy with few or no ground control points. RTK on a survey rover, the Reach RX2 on a pole, measures coordinates of points on the ground. Those points become ground control to constrain the adjustment, or independent checkpoints to test it. Even with a reliable RTK drone, checkpoints measured with a rover remain the only defensible way to prove the accuracy of a deliverable, a topic developed in [Ground Control Points](ground-control-points.md) and [Mapping Accuracy](mapping-accuracy.md).

## Related

- [GNSS Fundamentals](gnss-fundamentals.md) for the positioning basics these techniques build on.
- [Ground Control Points](ground-control-points.md) for what the survey rover measures.
- [Mapping Accuracy](mapping-accuracy.md) for proving the result.
- [Map Projections and Coordinate Systems](map-projections-and-coordinate-systems.md) for the coordinate framework corrections operate in.
- [ASPRS Certified UAS Technologist](../exams/asprs-certified-uas-technologist.md) for the mapping credential that tests this material.

## Citations

[1] NovAtel, An Introduction to GNSS, GNSS constellations and positioning concepts. https://novatel.com/an-introduction-to-gnss
[2] Emlid Docs, Reach RS4 introduction and RTK concepts. https://docs.emlid.com/reachrs4/
[3] Emlid, Reach RS4 specifications. https://emlid.com/reachrs4/
[4] Scripps Orbit and Permanent Array Center, California Real Time Network. http://sopac-csrc.ucsd.edu/index.php/crtn/
[5] Scripps Orbit and Permanent Array Center, Connecting to CRTN. http://sopac-csrc.ucsd.edu/index.php/crtn-connecting/
[6] DJI, Matrice 4 Series specifications. https://enterprise.dji.com/matrice-4-series/specs
