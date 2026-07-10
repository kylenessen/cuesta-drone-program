# Airspace Authorization

**Airspace Authorization** is the prior permission section 107.41 requires before a small UAS operates in Class B, C, or D airspace or in Class E airspace designated for an airport. In practice nearly all authorizations flow through LAANC, the Low Altitude Authorization and Notification Capability, an automated data exchange between the FAA and approved private service providers that grants access in near real time. LAANC checks a request against UAS Facility Maps, special use airspace, TFRs, and NOTAMs, and is available at 726 airports as of the FAA's current count. Students should leave the course knowing not just the rule but the workflow, because requesting LAANC authorization is a routine preflight task in commercial work. [1](https://www.faa.gov/uas/getting_started/laanc) [2](/sources/ac-107-2a.md)

## How LAANC Works

The FAA publishes UAS Facility Maps that divide the controlled airspace around participating airports into grid squares, each with a pre-coordinated maximum altitude at which automated authorization is available, in steps of 0, 50, 100, 200, 300, or 400 feet AGL. [3](https://www.faa.gov/uas/commercial_operators/uas_facility_maps) These numbers represent what the facility has agreed the FAA can authorize automatically without further safety analysis. Grid values step down toward runways and approach corridors, so a mapping site two miles from the field might sit under a 400 foot cell while the parcel next door sits under 100. A zero grid does not mean flight is prohibited. It means nothing can be auto-approved there, and the request must go through further coordination or DroneZone.

Requests go through FAA-approved UAS Service Suppliers, not through the FAA directly. The current public providers are AirMatrix, Airspace Link, Aloft, AstraUTM, AutoPylot, Avision, eTT Aviation, Flightloop, FlightReady, Flyfreely, UASidekick, and Wing, with Aloft the most widely used and also the engine behind the FAA's B4UFLY experience. The list changes, so check the FAA's LAANC for Industry page when standardizing on an app. [4](https://www.faa.gov/uas/programs_partnerships/data_exchange) The workflow is the same everywhere. Draw or select the operating area, set a maximum altitude and time window, attest to Part 107 status, and submit. If the request sits at or below the grid ceiling for every cell the polygon touches, approval typically arrives in seconds. Keep the authorization accessible in the field, and comply if ATC requested notification as a condition, though by default no tower call is needed. [1](https://www.faa.gov/uas/getting_started/laanc) A practical habit is to request only the altitude and footprint the job needs. An authorization spanning many grid cells at the lowest common ceiling can be more useful than one rejected because a corner of the polygon clipped a zero grid.

## Further Coordination and Night Authorizations

When a job needs altitude above the grid ceiling but still at or below 400 feet, Part 107 pilots can file a further coordination request through the same LAANC app. These are reviewed manually by the facility, can be submitted up to 90 days in advance, and are not instant, so they belong in the project schedule rather than the morning of the flight. Facilities can attach guidance to a denial, which lets the pilot adjust and resubmit. Recreational flyers do not get this option. [1](https://www.faa.gov/uas/getting_started/laanc)

Since the 2021 operations over people rule took effect, Part 107 pilots may fly at night without a waiver, provided they have current recurrent training and anti-collision lighting visible for three statute miles, and LAANC supports night authorizations in controlled airspace, so a night mapping or inspection flight near an airport is a routine request rather than a waiver process. [5](https://www.ecfr.gov/current/title-14/chapter-I/subchapter-F/part-107/subpart-B/section-107.29) [6](https://www.faa.gov/uas/commercial_operators/part_107_airspace_authorizations)

## When LAANC Cannot Help

LAANC handles authorizations below 400 feet in participating controlled airspace. Everything else goes through the FAA DroneZone portal, including airports without LAANC service, operations needing both a waiver and an airspace authorization, and anything above 400 feet. DroneZone processing takes weeks to months, which is why experienced operators check authorization requirements before bidding a job, not after. [1](https://www.faa.gov/uas/getting_started/laanc) Authorization is distinct from a [Certificate of Waiver](/regulations/certificate-of-waiver.md): an authorization permits an otherwise-standard operation in controlled airspace, while a waiver permits deviating from an operating rule. The paperwork students will encounter blurs these because DroneZone handles both. [2](/sources/ac-107-2a.md)

An authorization does not relieve any other rule: the operation must still comply with the [Part 107 Operating Rules](/regulations/part-107-operating-rules.md), and ATC facilities do not separate drones from other traffic inside authorized areas. The remote pilot remains responsible for yielding right of way. [2](/sources/ac-107-2a.md)

## Local Picture

San Luis Obispo County Regional Airport (SBP) sits about three miles south of downtown San Luis Obispo and operates a part-time control tower, attended roughly 0600 to 1700 local. [7](https://www.airnav.com/airport/ksbp) When the tower is open, the field is surrounded by Class D airspace charted up to 2,700 feet MSL. [8](https://www.faa.gov/documentLibrary/media/Order/JO_7400.11C.pdf) Any Part 107 flight inside that surface area needs an authorization. Much of the city's southern edge, the Edna Valley, and agricultural land along Highway 227 fall under SBP grids, while sites in Morro Bay, Los Osos, and most of North County sit in uncontrolled Class G and need no authorization at all. Before a mapping job anywhere near the airport, check the current grid values in a LAANC app or the FAA's UAS Facility Map viewer rather than trusting memory, since facility maps get updated. When the tower is closed the airspace reverts to a less restrictive class per the chart supplement, but the conservative and simplest practice is to hold a LAANC authorization for any flight inside the charted surface area regardless of hour. A definitive airspace review of each proposed student flight site should still be recorded here once done.

## Related

- [Airspace Classification](/topics/airspace-classification.md) defines the airspace classes that trigger the authorization requirement.
- [Sectional Chart](/topics/sectional-chart.md) is how pilots identify controlled airspace boundaries.
- [Night Operations](/topics/night-operations.md) covers the training and lighting rules behind night authorizations.
- [Mapping Mission Planning](/topics/mapping-mission-planning.md) is where authorization checks enter the professional workflow.

## Citations

[1] [UAS Data Exchange (LAANC)](https://www.faa.gov/uas/getting_started/laanc), FAA, accessed 2026-07-09.
[2] [AC 107-2A](/sources/ac-107-2a.md), Chapter 5, airspace and ATC authorization guidance.
[3] [UAS Facility Maps](https://www.faa.gov/uas/commercial_operators/uas_facility_maps), FAA.
[4] [LAANC for Industry, approved UAS Service Suppliers](https://www.faa.gov/uas/programs_partnerships/data_exchange), FAA, accessed 2026-07-09.
[5] [14 CFR 107.29, Operation at night](https://www.ecfr.gov/current/title-14/chapter-I/subchapter-F/part-107/subpart-B/section-107.29), eCFR.
[6] [Part 107 Airspace Authorizations](https://www.faa.gov/uas/commercial_operators/part_107_airspace_authorizations), FAA.
[7] [KSBP San Luis Obispo County Regional Airport](https://www.airnav.com/airport/ksbp), AirNav.
[8] [FAA Order JO 7400.11, Airspace Designations and Reporting Points](https://www.faa.gov/documentLibrary/media/Order/JO_7400.11C.pdf), FAA.
