# Remote Sensing Platforms

A **remote sensing platform** is anything that lifts a sensor into the sky to make measurements, and a drone is only one option among many. Helicopters, airplanes, satellites, weather balloons, and kites all serve the same basic purpose, and each carries its own tradeoffs. Placing drones in this continuum helps students choose the right tool for a given job rather than assuming a drone is always the answer. [1]

## The Continuum

The platforms differ mainly in how high and how far they carry a sensor, which sets the balance between resolution and coverage. A drone flies low and close, giving very high resolution over a small area. That strength is also its limit. Mapping a whole state or continent with a drone is impractical, because the flight would take so long that the seasons would change before it finished. [1]

## Trading Resolution for Coverage

A satellite carries a camera that is, in spirit, the same instrument as a drone's, differing in details like sensor size, pixel count, and lens. By placing that camera far away in space, a satellite trades resolution for coverage. The brainstorm's mental figure of roughly ten-foot, or three-meter, imagery is a fair description of the mid-tier commercial market, and free public imagery like Sentinel-2 sits coarser still at ten meters [2]. The very finest commercial optical satellites now resolve closer to thirty centimeters, so "cannot read a license plate" remains true while the exact number keeps improving [5]. What does not change is the logic: each pixel records the average light reflected from a small plot of ground, and a single such measurement may sound unremarkable, yet the same observation repeated across an enormous area, and then repeated again over time, is what makes satellite remote sensing powerful. The recurring theme across platforms is that repeated observation is where the value lies. [1]

## Choosing a platform for agriculture

The continuum stops being abstract the moment a grower asks whether to hire a drone, subscribe to satellite imagery, or bring in a crewed aircraft, so the agricultural case is worth working through concretely. Three options compete, and each wins in a different situation.

Satellite imagery is the cheap, wide, hands-off baseline. Sentinel-2, the European public constellation, delivers multispectral imagery at ten-meter resolution on a roughly five-day revisit, free for any use including commercial, which makes it the default first look for regional and whole-farm monitoring [2]. Commercial constellations such as Planet's push resolution to around three meters with near-daily revisit for a subscription fee [3]. Satellite's strength is coverage and cadence with no field visit and no pilot, and its limit is resolution. Ten-meter pixels average whole vine rows or several plants together and cannot resolve an individual plant, a clogged emitter, or a narrow disease focus, and cloud cover can blank out the exact date a grower needed.

A drone sits at the opposite corner. It delivers centimeter-scale resolution and, just as important, imagery on the grower's own schedule rather than an orbit's, which is what makes stand counts, leak detection, and tight within-block vigor mapping possible. The cost of that resolution is coverage. A drone maps a field or a block per outing, not a county, and mobilization dominates its economics, so cost per acre falls as the flown area grows but never approaches satellite's cost per acre over large ground. Crewed aircraft occupy the middle. A piloted plane with a mapping or multispectral sensor covers far more ground per day than a drone at resolution between drone and satellite, and for very large acreages it becomes cheaper per acre than a drone once mobilization is spread over enough ground, which is the crossover discussed in [Mission Cost Analysis](mission-cost-analysis.md).

The teaching conclusion is that the platforms are complements, not rivals. A common professional pattern uses free or cheap satellite imagery to watch a whole operation and flag which fields are changing, then sends a drone to the flagged fields for the high-resolution look that drives action. University extension guidance frames the same tradeoff, noting that drones offer the highest resolution and the most flexible timing among imagery sources for crop scouting, at the cost of covering less area per day than aircraft or satellites [4]. Naming the right tool for a grower's specific question, and being willing to say the free satellite subscription already answers it, is part of the professional's value.

## Related

- [Uncrewed Aircraft](uncrewed-aircraft.md) defines the drone that sits at the low, close end of this continuum.
- [Drone Payloads](drone-payloads.md) covers the sensors these platforms carry.
- [Multispectral Imaging](multispectral-imaging.md) shows the kind of repeated, analytic measurement satellites excel at.
- [Agricultural Drone Applications](agricultural-drone-applications.md) for the grower decisions this platform choice serves.
- [Mission Cost Analysis](mission-cost-analysis.md) for the cost-per-acre crossover between drones, aircraft, and satellites.

## Citations

[1] [Drone Course Content Brainstorm](../sources/drone-course-content-brainstorm.md), July 2026 course-content voice memo, section on aerial platforms in context.
[2] European Space Agency Copernicus, Sentinel-2 mission (ten-meter bands, five-day revisit, open data). https://sentinels.copernicus.eu/copernicus/sentinel-2
[3] Planet Labs, PlanetScope technical documentation. https://docs.planet.com/data/planetary-variables/crop-biomass/techspec/
[4] Iowa State University Extension, Crop Scouting with Aerial Imagery: Choosing the Right Source. https://crops.extension.iastate.edu/post/crop-scouting-aerial-imagery-choosing-right-source
[5] Maxar/Vantor WorldView, high-resolution optical satellite imagery product information (30 cm native resolution). https://vantor.com/product/worldview
