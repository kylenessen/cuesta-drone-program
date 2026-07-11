# Map Projections and Coordinate Systems

**Map Projections and Coordinate Systems** determine what the numbers in a drone mapping deliverable actually mean. GNSS natively produces geographic coordinates, latitude and longitude on an ellipsoid, but orthomosaics, DEMs, and CAD linework need planar coordinates in linear units. Choosing the wrong system, or mixing two systems that look similar, produces offsets from centimeters to hundreds of meters that no amount of careful flying can repair. In practice a mapping professional needs fluency in a small vocabulary, UTM, State Plane, and EPSG codes, plus awareness of a few classic traps.

## Geographic versus projected coordinates

Geographic coordinates locate a point in angular units, degrees of latitude and longitude, on a reference ellipsoid such as GRS80 or WGS84. Angles are fine for navigation but awkward for measurement, because a degree of longitude spans a different ground distance depending on latitude. A projected coordinate system solves this by mathematically flattening the curved surface onto a plane, yielding eastings and northings in meters or feet. Every projection distorts something, so each system is designed to keep distortion tolerable within a defined zone. Photogrammetry software expects projected outputs for the same reason engineers do. Areas, distances, and volumes computed on a grid in meters are directly meaningful, and downstream tools like CAD and GIS overlay data cleanly only when everything shares one projected system. A subtlety worth knowing is that distances on the projection grid still differ slightly from true ground distances, a scale effect that surveyors handle with combined scale factors on high-precision work [1].

## UTM

The Universal Transverse Mercator system slices the world into 60 north-south zones, each 6 degrees of longitude wide, projected with a transverse Mercator projection. It is a global default, simple and metric. The boundary between zones 10 and 11 runs along 120 degrees west longitude, which passes through California, so the state is split between the two zones. San Luis Obispo County falls in zone 10. Common EPSG codes are 32610 for WGS84 UTM zone 10N and 26910 for NAD83 UTM zone 10N [2]. UTM works well for standalone mapping projects, but its zone boundaries are arbitrary with respect to jurisdictions, and its distortion within a zone is larger than State Plane allows.

## California State Plane

The State Plane Coordinate System assigns each state a set of zones with projections tuned to keep distortion small, on the order of 1 part in 10,000 within each zone. California uses six zones based on the Lambert conformal conic projection, appropriate for zones that are wider east-west than north-south [1]. San Luis Obispo County lies in Zone 5, together with Santa Barbara, Ventura, Kern, Los Angeles, and San Bernardino counties [3]. State Plane is the system local agencies, engineers, and surveyors most often require, so drone deliverables intended for civil work in this county usually land in California Zone 5.

## EPSG codes as the working vocabulary

Every well-defined coordinate reference system has a numeric identifier in the EPSG registry, and these codes are how modern software communicates unambiguously. NAD83 California zone 5 in meters is EPSG 26945. The same zone in US survey feet is EPSG 2229 [3] [4]. WGS84 geographic coordinates are EPSG 4326. When configuring a base station, a rover project, or photogrammetry output, specifying the EPSG code removes guesswork about datum, projection, and units in one step. The habit to build is simple. Decide the deliverable EPSG code before fieldwork, and use it consistently for the base coordinates, the GCP survey, and the processing output.

## Classic pitfalls

The most notorious trap is the foot. The US survey foot and the international foot differ by only 2 parts per million, but State Plane coordinates run into the millions of feet, where the difference amounts to several feet of pure coordinate shift. NIST and NOAA deprecated the US survey foot at the end of 2022, and since January 1, 2023 the international foot, exactly 0.3048 meters, is the standard for new work [5] [6]. Legacy California data, however, is overwhelmingly in US survey feet, and California law historically defined State Plane in that unit [3]. Always confirm which foot a client's control coordinates use before importing them.

Other recurring failures are close cousins. Mixing UTM zone 10 and zone 11 data near the 120 degree meridian produces coordinates that are hundreds of kilometers apart. Confusing WGS84 and NAD83 introduces an offset that is currently around 1 to 2 meters in the continental US and grows over time with plate motion, invisible on a small map but fatal for survey-grade work [7]. And delivering geographic coordinates when the client expected projected ones breaks measurement tools downstream. Each of these is prevented by the same discipline, one declared EPSG code per project, checked at every import and export.

## Related

- [Sectional Chart](sectional-chart.md) for latitude and longitude as the aeronautical chart and knowledge test use them.
- [Vertical Datums and Geoid Models](vertical-datums-and-geoid-models.md) for the height half of the coordinate question.
- [GNSS Fundamentals](gnss-fundamentals.md) for where the native coordinates come from.
- [Ground Control Points](ground-control-points.md) for the survey workflow these systems anchor.
- [ASPRS Certified UAS Technologist](../exams/asprs-certified-uas-technologist.md) for the mapping credential that tests coordinate system fluency.

## Citations

[1] California Geological Survey, California State Plane Coordinate System. https://www.conservation.ca.gov/cgs/rgm/state-plane-coordinate-system
[2] EPSG registry entry, NAD83 / UTM zone 10N. https://epsg.io/26910
[3] EPSG registry entry, NAD83 / California zone 5 (ftUS). https://epsg.io/2229
[4] EPSG registry entry, NAD83 / California zone 5. https://epsg.io/26945
[5] NIST, U.S. Survey Foot. https://www.nist.gov/pml/us-surveyfoot
[6] Federal Register, Deprecation of the United States (U.S.) Survey Foot. https://www.federalregister.gov/documents/2020/10/05/2020-21902/deprecation-of-the-united-states-us-survey-foot
[7] NOAA National Geodetic Survey, Frequently Asked Questions on datums. https://geodesy.noaa.gov/datums/index.shtml
