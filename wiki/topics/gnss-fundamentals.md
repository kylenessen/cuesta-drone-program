# GNSS Fundamentals

**GNSS Fundamentals** covers how satellite-based positioning actually works and, more importantly for mapping, where its errors come from. Every drone map inherits its absolute position from GNSS one way or another, either through the drone's own receiver or through ground control measured with survey equipment. Understanding the difference between a consumer-grade position and a survey-grade one explains most of the accuracy conversation in professional drone mapping.

## How satellite positioning works

GNSS is the umbrella term for Global Navigation Satellite Systems. A receiver measures the travel time of radio signals from satellites whose positions are known, converts each travel time to a distance, and solves for its own position where those distances intersect. Because the receiver's cheap internal clock is not synchronized with the atomic clocks on the satellites, the measured distances are called pseudoranges, and the receiver must solve for its clock error as a fourth unknown. That is why a position fix requires at least four satellites.

Four constellations provide global coverage. The United States operates GPS with roughly 31 active satellites [1]. Russia operates GLONASS with a nominal constellation of 24. The European Union operates Galileo, designed around 24 operational satellites plus spares. China operates BeiDou, whose third-generation system uses a mix of medium Earth orbit, geostationary, and inclined geosynchronous satellites [2]. Japan's QZSS and India's NavIC add regional coverage. Modern receivers, including those in the program's DJI Matrice 4 aircraft and Emlid Reach units, track all of these at once, which improves satellite geometry and robustness in obstructed sites.

## Error sources

The signal in space is remarkably good. The US government commits to a global average user range error of 2.0 meters or less at 95 percent probability, and actual performance is typically well under one meter [3]. The errors that matter accumulate between the satellite and the antenna.

The ionosphere is the largest error source for single-frequency receivers. Free electrons delay the signal by an amount that varies with solar activity and time of day. Because the delay depends on frequency, receivers that track two or more frequencies can measure and remove most of it. The troposphere adds a smaller delay from water vapor and dry air that does not depend on frequency and must be modeled. Multipath occurs when the signal reflects off buildings, vehicles, or terrain before reaching the antenna, corrupting the range measurement. Ephemeris error is the difference between where the satellite actually is and where its broadcast orbit says it is. Satellite clock error is the residual drift of the onboard atomic clocks after corrections. Receiver noise and antenna quality add a final layer. Satellite geometry then scales all of these. When visible satellites cluster in one part of the sky, small range errors project into large position errors, an effect quantified as dilution of precision [3].

## Consumer versus survey-grade accuracy

A GPS-enabled smartphone is typically accurate to within about a 4.9 meter radius under open sky, and worse near buildings and trees [4]. A drone's standalone onboard receiver performs in the same general class, a few meters horizontally, often worse vertically. Survey-grade equipment reaches a different regime entirely by using the carrier wave itself rather than the code, together with corrections from a nearby base station. The Emlid Reach RS4 specifies RTK accuracy of 7 millimeters plus 1 part per million horizontally and 14 millimeters plus 1 part per million vertically [5]. That is roughly a three order of magnitude difference between navigation and survey positioning. The techniques that make it possible are covered in [RTK and PPK Positioning](/topics/rtk-and-ppk-positioning.md).

## Why standalone drone GNSS gives meter-level maps

A photogrammetric map built only from a drone's standalone GNSS geotags can look excellent and still be several meters off. The reconstruction process, structure from motion with bundle adjustment, ties thousands of image features together and enforces a highly consistent relative geometry. Distances and shapes within the model are crisp because they come from the images, not from GNSS. But the absolute position of the whole model comes from averaging the geotags, and each geotag carries the meter-level error described above. The result is a model that is internally sharp yet floats in space. It can be translated several meters horizontally, offset vertically by an even larger amount, and slightly tilted or misscaled. Pix4D notes that without ground control or high-accuracy geotags, absolute accuracy is limited by the accuracy of the image geolocation [6]. This is the core argument for RTK-geotagged imagery, ground control points, or both, whenever a map must line up with the real world rather than merely with itself.

## Related

- [RTK and PPK Positioning](/topics/rtk-and-ppk-positioning.md) for the correction techniques that reach centimeters.
- [Ground Control Points](/topics/ground-control-points.md) for tying maps to the ground independently of the aircraft.
- [Mapping Accuracy](/topics/mapping-accuracy.md) for how positioning quality is measured and reported.
- [Vertical Datums and Geoid Models](/topics/vertical-datums-and-geoid-models.md) for what GNSS heights actually mean.

## Citations

[1] NASA Scientific Visualization Studio, GNSS Fleet. https://svs.gsfc.nasa.gov/5627/
[2] International GNSS Service, MGEX Constellations. https://igs.org/mgex/constellations/
[3] GPS.gov, GPS Accuracy. https://www.gps.gov/gps-accuracy
[4] GPS.gov, GPS Accuracy (archived detail page). https://archive.gps.gov/systems/gps/performance/accuracy/
[5] Emlid, Reach RS4 specifications. https://emlid.com/reachrs4/
[6] Pix4D Support, Getting GCPs on the field or through other sources. https://support.pix4d.com/hc/en-us/articles/202557489
