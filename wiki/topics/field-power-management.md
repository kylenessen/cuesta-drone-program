# Field Power Management

**Field Power Management** is the logistics problem behind every large mapping project. A single enterprise drone battery buys roughly half an hour of productive flight, and survey sites rarely come with wall outlets. Whether a crew finishes a big site in one day or three often comes down to arithmetic done the night before, deciding how many charged batteries to bring and how to keep them cycling through a charger while the aircraft flies. This article works the numbers using the DJI Matrice 4 series as the example platform.

## Estimating battery needs

Start from the mission plan. Flight planning software estimates total flight time for the mapped area at the chosen altitude, speed, and overlap. Convert that to batteries with a realistic per-pack figure, not the brochure number. DJI rates the Matrice 4E for up to 49 minutes of flight in ideal windless conditions [1]. In mapping practice, with payload use, wind, climbs, transits to and from the survey block, and a landing reserve of 20 to 30 percent, a working figure of 25 to 35 minutes of useful mapping per battery is more honest. A plan that estimates three hours of flying therefore needs roughly six to seven battery cycles. Add a margin battery or two for reflights and surprises. If the day needs more cycles than the batteries on hand, field charging closes the gap.

## The charging hub rotation

The core technique is to keep the charger working the whole time the aircraft is flying. The DJI Matrice 4 Series Battery Charging Hub holds four batteries and charges them sequentially, prioritizing the pack closest to full, at a rated power of 100 W [2]. Since the battery itself stores 99.5 Wh [1], and the constant-voltage tail of the charge is slow, filling a depleted pack takes well over an hour even at full charger power. The hub's Ready-to-Fly mode helps by charging packs to 90 percent and holding them there, skipping the slowest part of the curve [3].

A practical rotation with four batteries looks like this. Battery one flies while two, three, and four sit in the hub. When battery one lands, it goes into the hub and the fullest pack comes out and flies. Repeat all day. The math that governs the day is simple. If the aircraft consumes a battery every 30 minutes but the charger needs 75 to 90 minutes to return one, the fleet slowly drains, and the deficit determines either how many extra charged packs to bring or how many chargers to run in parallel. Two hubs on two power sources doubles throughput and is common on production crews.

The same rotation logic scales down to a training fleet of consumer aircraft, where it becomes a teachable lab in its own right. The charging hubs that ship with DJI Fly More kits charge their three batteries sequentially, one after another, while inexpensive third party parallel chargers fill every slot at once, which multiplies throughput the same way a second hub does on a production crew. Since a consumer pack stores far less energy than an enterprise pack, 18.1 Wh for a Mini 3 battery and 62.6 Wh for an Air 3 battery [6] [7], a single 1,024 Wh portable power station [8] returns a dozen or more Air 3 batteries, or several dozen Mini 3 batteries, after inverter losses, enough to keep a five or six aircraft training fleet flying through a three hour lab. The [Battery Charging and Field Power Lab](../activities/battery-charging-and-field-power-lab.md) activity runs students through exactly this arithmetic and rotation.

## Power sources and the wattage math

Every option gets measured against the charger's draw. One 100 W hub plus a controller and tablet topping off is a continuous load in the neighborhood of 150 W. Two hubs push toward 250 to 300 W. Conversion losses in inverters and power supplies typically eat another 10 to 15 percent, so size sources generously.

A small inverter generator is the traditional answer. Even compact models rated around 1,800 W continuous, such as the popular 2,200 W class machines [4], run several charging hubs with enormous headroom, and fuel is cheap and refillable mid-day. The costs are noise, weight, exhaust, and maintenance.

Portable power stations have largely taken over for mapping crews. Capacity is listed in watt-hours, so the estimate is direct. A 1,000 Wh station, derated 15 percent for inverter loss, delivers roughly 850 Wh, which is about eight Matrice 4 battery refills. A 500 Wh station returns about four. Power stations are silent, safe indoors and in vehicles, and many recharge from a car while driving between sites.

Vehicle power works with caveats. A standard 12 V accessory socket is usually fused for 10 to 15 amps, which caps it near 120 to 180 W, enough for one hub at reduced speed or a controller, but wired conservatively. Larger inverters connected directly to the vehicle battery can run a full hub, but only with the engine running, or the crew ends the day with a dead truck. Folding solar panels can trickle useful energy into a power station on a long sunny day, but panel output varies with sun angle and rarely matches nameplate rating, so treat solar as a supplement rather than a primary source.

## Generator safety and etiquette

Generator exhaust kills. The Consumer Product Safety Commission attributes roughly 100 deaths per year to carbon monoxide from portable generators and directs users to run them outdoors only, at least 20 feet from occupied buildings, with exhaust pointed away [5]. Never run one in a vehicle, trailer, garage, or enclosed canopy. Place it downwind of the crew and the charging table, on level ground, and refuel only when it is off and cool. Etiquette matters on shared sites. A droning generator annoys clients, landowners, and wildlife, so position it away from people, and shut it down during conversations, interviews, or wildlife-sensitive work.

## Cables, connectors, and heat

Field charging fails at the small stuff. Carry the correct high-wattage USB-C power adapter for the hub, since the Matrice 4 hub requires a 100 W USB-C source and underpowered adapters charge slowly or not at all [2]. Use short, high-quality cables rated for the wattage, and label everything, because a job site accumulates identical black cables fast. Heat is the quiet enemy. DJI limits charging to 5 to 40 C battery temperature [1], and packs come off the aircraft warm, so give them a few minutes in the shade before slotting them into the hub. Keep the entire charging station shaded and ventilated, never in a closed car trunk in the sun. A folding table, a reflective tarp, and an insulated cooler for hot and cold battery management cost little and protect thousands of dollars of packs.

## Related

- [Battery Fundamentals and Safety](battery-fundamentals-and-safety.md) for the chemistry and charge behavior behind these logistics.
- [Field Operations Best Practices](field-operations-best-practices.md) for the rest of the field craft.
- [Battery Charging and Field Power Lab](../activities/battery-charging-and-field-power-lab.md) for the lab activity built on this material at training-fleet scale.

## Citations

[1] DJI Matrice 4 Series Specifications. https://enterprise.dji.com/matrice-4-series/specs
[2] DJI Matrice 4 Series Battery Charging Hub (100W), product specifications. https://advexure.com/products/dji-matrice-4-series-battery-charging-hub-100w
[3] DJI Matrice 4 Series FAQ. https://enterprise.dji.com/matrice-4-series/faq
[4] Honda EU2200i Inverter Generator. https://powerequipment.honda.com/generators/models/eu2200i
[5] U.S. Consumer Product Safety Commission, What to Know About Generators and Carbon Monoxide. https://www.cpsc.gov/s3fs-public/468-WhattoKnowGenerators_2022.pdf
[6] DJI Support, Intelligent Flight Battery Technical Specifications (Mini series). https://repair.dji.com/help/content?customId=en-us03400006564&spaceId=34&re=US&lang=en
[7] DJI Air 3 Specifications. https://www.dji.com/air-3/specs
[8] EcoFlow DELTA 3 Portable Power Station. https://us.ecoflow.com/products/delta-3-portable-power-station
