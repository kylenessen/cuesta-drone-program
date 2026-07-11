# Field Operations Best Practices

**Field Operations Best Practices** is the working knowledge that separates a smooth field day from a lost dataset, a damaged aircraft, or an injured pilot. Flight planning software makes it easy to believe that a mission flies itself. It does not. The pilot's judgment before launch, attention during flight, and discipline after landing determine whether the data is usable and the equipment comes home intact. This article collects the habits that professional crews rely on, with aircraft specifics drawn from the DJI Matrice 4 series used in this program, and the human side of field days drawn from how mature utility programs like PG&E's actually operate. Working pilots in that world describe the flying as the easiest part of the job. The driving, the hiking, the heat, and the people on the ground are where field days are won or lost. [8](../sources/verticalmag-pge-uas-operations.md)

## Checklist discipline

Preflight and postflight checklists exist because memory fails under time pressure. A preflight check covers the airframe and propellers for cracks or nicks, battery seating and charge state, SD card presence and free space, firmware and RTK status, control link and home point confirmation, and a review of airspace authorizations and NOTAMs. The postflight check is just as important and more often skipped. Confirm the imagery transferred or is safely on the card, log flight time and battery cycles, inspect the aircraft for new damage, and set batteries aside for storage or recharge. Run the list the same way every time, even on the fifth flight of the day. Complacency grows fastest when operations feel routine.

## Attention during automated flights

Automated mapping flights invite the most dangerous habit in this work, which is looking at the screen instead of the aircraft. The plan is a prediction, not a guarantee. Keep eyes on the aircraft and use the controller display for periodic status checks, not continuous viewing. On every mapping line, confirm that image capture is actually firing. Watch the shutter count increment or listen for capture confirmation in the app. A drone that flies a flawless grid with a camera that never triggered produces nothing, and the failure is invisible unless the pilot checks.

Plan the most attention for landing. Takeoff and cruise are the forgiving phases. Landing concentrates the risk, because the aircraft is low, slow, close to obstacles and people, and often returning with a depleted battery. Clear the landing zone before descent, watch for wind gusts near the ground, and be ready to take manual control. Treat every automated return-to-home as an approach you are flying, not one you are watching.

## Environmental go and no-go judgment

Compare forecast and observed wind against the aircraft's limits, not against optimism. DJI rates the Matrice 4E for a maximum wind speed resistance of 12 m/s, which is about 27 mph [1]. That is a survival limit, not a working limit. Mapping quality degrades well before that, since crabbing into wind distorts flight lines and burns battery. Precipitation is a simple no-go for these aircraft unless the model carries a verified ingress protection rating for the conditions. Temperature matters too. The Matrice 4 series operates from -10 to 40 C, or 14 to 104 F [1], and battery performance drops in the cold.

Coastal California adds its own patterns. The onshore sea breeze typically builds through the late morning and afternoon as the land heats, so morning launches often enjoy the calmest air of the day. The marine layer, a cool moist layer trapped under a temperature inversion, can hold fog and low stratus over the coast for days at a time [2]. Part 107 requires 3 statute miles of visibility and cloud clearance of at least 500 feet below and 2,000 feet horizontally [3], so a fog bank drifting over the site ends the mission. Plan mapping windows around the burn-off and get airborne before the wind arrives.

## Visual line of sight and site selection

Part 107 requires the remote pilot or visual observer to keep the aircraft in unaided visual line of sight throughout the flight [4]. This drives launch site selection. Choose a launch point with a commanding view of the entire mapping area, not just a convenient parking spot. Terrain, tree lines, structures, and sun glare all break line of sight. If one site cannot see the whole survey area, split the mission into multiple flights from multiple launch points rather than trusting the aircraft out of view. The launch and landing zone itself should be level, clear of loose debris, and separated from bystanders.

## Sharing low altitude airspace

Small drones do not own the airspace below 400 feet. Helicopters may legally operate below the fixed-wing minimum altitudes when it can be done safely [5], and agricultural aircraft conducting spray operations under Part 137 routinely work at crop height [6]. Medical helicopters, law enforcement, fire aircraft, and pipeline patrols all fly low with little warning. A Part 107 pilot must yield the right of way to all crewed aircraft [7]. In practice that means listening as much as watching. Engine and rotor noise usually arrives before the aircraft is visible. When crewed traffic approaches, descend or land immediately and wait it out.

## Check the imagery before you leave

The most expensive mistake in mapping is discovering a bad dataset back at the office. Before packing up, review a sample of images at full zoom for motion blur and focus, scan thumbnails for exposure swings, and verify the image count roughly matches what the plan predicted. Check the flight app's coverage view for gaps or skipped lines. Ten minutes of review in the field costs almost nothing. A return trip to the site costs a day.

## Thermal care for equipment

Batteries, controllers, and tablets suffer in direct sun. Keep spare batteries shaded in an insulated container, never on a dashboard or dark truck bed, and let a hot battery cool before charging, since DJI limits charging to 5 to 40 C [1].

## The field day beyond the flying

Professional field work is mostly not flying. PG&E, which fields around 80 UAS pilots on a typical day, describes the reality bluntly through its in-house inspection supervisor: "The flying is the easiest part. There's just so much more: there's the driving; the slips, trips and falls; the hiking, dehydration, exhaustion." [8](../sources/verticalmag-pge-uas-operations.md) Utility structures sit at the end of dirt roads and up unmaintained slopes, so a pilot spends far more hours behind the wheel and on foot than on the sticks, and the injuries that end field days are ground injuries, not aviation ones.

That reality shapes how equipment is carried and staged. The vehicle is the base of operations. Stage batteries, chargers, tools, and spare equipment there, organized so nothing is forgotten at a site, and carry to the structure only what the job at that structure needs, since every unnecessary pound in the pack multiplies across a season of hiking. Institutional [Infrastructure Inspection Operations](infrastructure-inspection-operations.md) crews formalize the personal equipment side too. The NOAA National Severe Storms Laboratory's published UAS procedures require safety vests for all flight crew, add work boots, hard hats, and eye protection where the mission demands them, and put two-way radios, a first aid kit, and a fire extinguisher on the crew equipment list. [9](../sources/nssl-uas-sop.md)

## Health across a field season

A single hot day is managed with shade and water. A field season is managed with habits. California's outdoor heat illness prevention standard is a useful template even where it does not strictly apply: employers must supply a quart of drinking water per worker per hour, provide shade whenever the temperature passes 80 F, and closely observe workers who are new to the heat, because acclimatization takes days to build and is lost again quickly [10]. The standard's high-heat procedures add scheduled communication and active observation of workers for early signs of heat illness, which is exactly the discipline a self-employed pilot has to impose alone. Dehydration and exhaustion degrade judgment before they produce symptoms the pilot notices, and the physiology behind that is covered in [Remote Pilot Physiology](remote-pilot-physiology.md). Across a season the same logic applies to sleep debt, sun exposure, and the cumulative wear of load carriage. Degraded pilot attention is a bigger risk than any single hardware failure, so shade, water, food, and rest belong in the operational plan, not in the pilot's discretion after everything else is done.

## Working alone and check-in protocols

Formal SOPs often prohibit solo work outright. The NSSL procedures require a remote pilot and visual observer on every mission and state that under no circumstances will an operator deploy alone. [9](../sources/nssl-uas-sop.md) Utility inspection work frequently cannot honor that, since crews of one spread across a service territory are what makes the economics work, so mature programs substitute protocol for the missing second person. The essential pieces are a known itinerary, a scheduled check-in cadence with a named person or desk, and an escalation path when a check-in is missed. Coverage is the weak link, because the structures worth inspecting by drone are often exactly the ones without cell service. PG&E issues its remote pilots Garmin inReach satellite communicators to guarantee a timely response in an emergency [8](../sources/verticalmag-pge-uas-operations.md), and satellite messengers of that class provide two-way messaging, location tracking, and an SOS function independent of cellular coverage [11]. A solo pilot without an institutional dispatch desk can replicate the pattern with a spouse, a colleague, or the client's site contact. What matters is that someone knows where the pilot is, when to expect contact, and what to do when it does not come.

## Public interaction

Drones attract attention, and much professional flying happens near homes and on private property. PG&E treats this as a core operational skill rather than an annoyance. Its standard procedure is to knock and introduce yourself to nearby residents before flying, and its pilots report that most contacts are positive and some are the best part of the job. [8](../sources/verticalmag-pge-uas-operations.md) The introduction works because it answers the questions a resident would otherwise ask the police or the pilot mid-flight: who you are, what you are photographing, and why. A visible safety vest, company identification, and a one-sentence explanation of the job defuse most encounters before they start.

Some encounters do not defuse. Homeowners are occasionally combative, and drones flying utility inspections for PG&E have been shot out of the sky. [8](../sources/verticalmag-pge-uas-operations.md) The professional response to hostility is de-escalation and disengagement, not debate. Stay calm, do not argue jurisdiction or airspace law on a doorstep, bring the aircraft home when it is safe to do so, leave, and report the encounter so the next crew is not surprised. The seriousness of mature programs on this point is instructive. Every hostile incident at PG&E is tracked by Flight Core, the company's in-house communications center, and when a dispatcher sees a pilot headed for a location with a known hostile customer, the pilot is advised to avoid contact and corporate security gets involved as needed. [8](../sources/verticalmag-pge-uas-operations.md) California now requires most employers to maintain a written workplace violence prevention plan covering exactly this kind of hazard identification, response procedure, and incident logging [12], so treating a hostile encounter as a reportable safety event is not overreaction, it is the standard of care.

## Related

- [Battery Fundamentals and Safety](battery-fundamentals-and-safety.md) for the battery handling that field days depend on.
- [Field Power Management](field-power-management.md) for keeping batteries cycling away from wall outlets.
- [Weather Effects on Performance](weather-effects-on-performance.md) and [Aviation Weather Sources](aviation-weather-sources.md) for the weather knowledge behind go/no-go calls and how programs turn it into a documented morning briefing.
- [Emergency Procedures](emergency-procedures.md) for what to do when the day goes wrong anyway.
- [Infrastructure Inspection Operations](infrastructure-inspection-operations.md) for the utility inspection sector whose field realities this page draws on.
- [Remote Pilot Physiology](remote-pilot-physiology.md) for the human factors behind hydration, fatigue, and heat.
- [Airspace Authorization](airspace-authorization.md) for the clearance workflow that precedes the field day.

## Citations

[1] DJI Matrice 4 Series Specifications. https://enterprise.dji.com/matrice-4-series/specs
[2] NOAA JetStream, The Marine Layer. https://www.noaa.gov/jetstream/ocean/marine-layer
[3] 14 CFR 107.51, Operating limitations for small unmanned aircraft. https://www.ecfr.gov/current/title-14/chapter-I/subchapter-F/part-107/subpart-B/section-107.51
[4] 14 CFR 107.31, Visual line of sight aircraft operation. https://www.ecfr.gov/current/title-14/chapter-I/subchapter-F/part-107/subpart-B/section-107.31
[5] 14 CFR 91.119, Minimum safe altitudes. https://www.ecfr.gov/current/title-14/chapter-I/subchapter-F/part-91/subpart-B/subject-group-ECFRe4c59b5f5506932/section-91.119
[6] 14 CFR Part 137, Agricultural aircraft operations. https://www.ecfr.gov/current/title-14/chapter-I/subchapter-G/part-137
[7] 14 CFR 107.37, Operation near aircraft; right-of-way rules. https://www.ecfr.gov/current/title-14/chapter-I/subchapter-F/part-107/subpart-B/section-107.37
[8] [How Pacific Gas and Electric Company Uses Unmanned Aircraft](../sources/verticalmag-pge-uas-operations.md), Vertical Mag, November 12, 2025.
[9] [NSSL UAS Standard Operating Procedure](../sources/nssl-uas-sop.md), NOAA National Severe Storms Laboratory, revised July 2023.
[10] California Code of Regulations, Title 8, Section 3395, Heat Illness Prevention in Outdoor Places of Employment. https://www.dir.ca.gov/title8/3395.html
[11] Garmin inReach satellite communicators. https://www.garmin.com/en-US/c/outdoor-recreation/satellite-communicators/
[12] Cal/OSHA, Workplace Violence Prevention Guidance and Resources (Labor Code section 6401.9, effective July 1, 2024). https://www.dir.ca.gov/dosh/workplace-violence.html
