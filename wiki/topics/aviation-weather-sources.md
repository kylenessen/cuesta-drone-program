# Aviation Weather Sources

**Aviation Weather Sources** are the official reports and forecasts a remote pilot consults to decide whether conditions permit a flight, chiefly the METAR surface observation and the TAF terminal forecast. The [Part 107 Knowledge Test](/exams/part-107-knowledge-test.md) reliably includes raw METAR or TAF text to decode, so fluency in the coded format is a hard requirement, not background. The FAA's hub for all of it is the NWS Aviation Weather Center at aviationweather.gov, and the source of most observations is the automated station network (ASOS and AWOS) at airports. In professional work these same products feed a documented go/no-go briefing every morning, either assembled by the pilot or delivered by a centralized operations desk. [1](/sources/remote-pilot-study-guide.md) [2](/sources/faa-s-acs-10b.md)

## METAR

A METAR is an aviation routine weather report, an hourly automated or augmented surface observation. The study guide's example is worth teaching verbatim: `METAR KGGG 161753Z AUTO 14021G26KT 3/4SM +TSRA BR BKN008 OVC012CB 18/17 A2970 RMK PRESFR`. Decoded, this is Gregg County Airport on the 16th at 1753 Zulu, automated report, wind from 140 degrees at 21 knots gusting 26, visibility three quarters of a statute mile, thunderstorm with heavy rain and mist, ceiling broken at 800 feet and overcast at 1,200 feet with cumulonimbus, temperature 18 Celsius and dew point 17, altimeter 29.70 inches, pressure falling rapidly. Every element of that string is a potential exam question, and the wind, visibility, ceiling, and temperature-dew point spread all bear directly on the Part 107 minimums of 3 statute miles visibility and 500-foot cloud clearance in the [Part 107 Operating Rules](/regulations/part-107-operating-rules.md). [1](/sources/remote-pilot-study-guide.md)

## TAF and Other Products

A TAF, terminal aerodrome forecast, uses METAR-style code to forecast conditions within 5 statute miles of an airport, typically covering a 24 or 30 hour period and amended as conditions change. Students should learn the change groups (FM, TEMPO, BECMG, PROB) well enough to answer what conditions are forecast at a given time. Beyond METARs and TAFs, the test's Sources of Weather task expects awareness of internet weather briefing resources for flight planning, graphical weather charts, and the difference between ASOS and AWOS automated stations, whose broadcasts a pilot can also monitor by radio at the field. [1](/sources/remote-pilot-study-guide.md) [2](/sources/faa-s-acs-10b.md)

For classroom use, live data from aviationweather.gov for the San Luis Obispo airport gives students authentic decoding practice on their own local field, which connects the coded products to weather they walked through that morning.

## The Operational Briefing Workflow

Decoding is the exam skill. The professional skill is converting these sources into a documented go/no-go decision every morning. The regulatory hook is 107.49, which requires the remote pilot in command to assess the operating environment before flight, starting with local weather conditions. [3](https://www.ecfr.gov/current/title-14/chapter-I/subchapter-F/part-107/subpart-B/section-107.49) The FAA's guidance points remote pilots at two briefing channels: a free Flight Service web briefing account at 1800wxbrief.com, and the Aviation Weather Center at aviationweather.gov, with a check of active TFRs at tfr.faa.gov as part of the same pass. [4](/sources/ac-107-2a.md) AC 107-2A adds a practical rule for choosing the observation: use the closest reporting station that is most representative of the terrain around the operating area, and if no reliable local report exists and visibility and cloud clearance cannot be determined by other means, the flight does not launch. [4](/sources/ac-107-2a.md)

A briefing that lives only in the pilot's head is not auditable, so professional procedure writes it down. A workable morning sequence reads the TAF for the operating window, the current METAR for what is actually happening, and the wind and gust numbers against the aircraft's limits rather than the pilot's optimism, then records the values and the decision on the preflight checklist. The NOAA National Severe Storms Laboratory's published UAS procedures are a model: weather conditions are recorded on the preflight checklist, reevaluated before each takeoff, and the operation terminates if conditions deteriorate past VFR minimums or the manufacturer's tolerances. [5](/sources/nssl-uas-sop.md) The recorded briefing is also where personal minimums and the IMSAFE self-check from [Remote Pilot Physiology](/topics/remote-pilot-physiology.md) enter the day, since the pilot's condition is part of the operating environment.

Mature programs centralize this work. PG&E runs an in-house communications center called Flight Core that delivers weather briefings and flight clearances to every UAS, helicopter, and airplane pilot flying for the company, employee and contractor alike. [6](/sources/verticalmag-pge-uas-operations.md) A drone pilot inspecting distribution poles gets the same class of briefing a helicopter crew gets, which removes the single-pilot temptation to shade a marginal forecast toward flying. The [Infrastructure Inspection Operations](/topics/infrastructure-inspection-operations.md) sector is where students are most likely to encounter a desk like this, and [Field Operations Best Practices](/topics/field-operations-best-practices.md) covers the field-side judgment the briefing feeds.

## Related

- [Weather Effects on Performance](/topics/weather-effects-on-performance.md) covers what the decoded weather means for the aircraft.
- [Radio Communications](/topics/radio-communications.md) includes the ATIS broadcast that repackages this data at towered airports.
- [Field Operations Best Practices](/topics/field-operations-best-practices.md) puts the morning briefing inside the whole field day.
- [Remote Pilot Physiology](/topics/remote-pilot-physiology.md) covers the pilot condition assessed alongside the weather.

## Citations

[1] [Remote Pilot Study Guide](/sources/remote-pilot-study-guide.md), Chapter 3a, Aviation Weather Sources.
[2] [FAA-S-ACS-10B](/sources/faa-s-acs-10b.md), Area of Operation III, Task A.
[3] [14 CFR 107.49, Preflight familiarization, inspection, and actions for aircraft operation](https://www.ecfr.gov/current/title-14/chapter-I/subchapter-F/part-107/subpart-B/section-107.49), eCFR.
[4] [AC 107-2A](/sources/ac-107-2a.md), paragraphs 5.11 to 5.12.3 and Appendix B.3, weather sources and preflight assessment.
[5] [NSSL UAS Standard Operating Procedure](/sources/nssl-uas-sop.md), section 5.1, Weather.
[6] [How Pacific Gas and Electric Company Uses Unmanned Aircraft](/sources/verticalmag-pge-uas-operations.md), Vertical Mag, November 12, 2025.
