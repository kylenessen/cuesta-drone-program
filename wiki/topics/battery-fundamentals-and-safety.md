---
type: Topic
title: Battery Fundamentals and Safety
description: Lithium battery chemistry, electrical concepts, safe charging and storage practice, behavior under load, and air transport rules for drone operations.
tags: [batteries, field-operations]
acs_area: operations
timestamp: 2026-07-09T18:00:00Z
---

# Battery Fundamentals and Safety

**Battery Fundamentals and Safety** covers the single most hazardous component a drone pilot handles. Lithium polymer and lithium-ion batteries pack a large amount of energy into a small flammable package. When abused by overcharging, puncture, crash damage, or heat, a cell can enter thermal runaway, a self-sustaining chemical fire that is difficult to extinguish and can reignite after appearing to be out. Respecting that hazard, and understanding the electrical basics behind it, is foundational for both the intro and advanced courses.

## Chemistry and why it burns

Lithium cells store energy by shuttling lithium ions between electrodes through a flammable organic electrolyte. There is no water in the system and the materials themselves supply fuel once a cell is breached or driven outside its voltage and temperature limits. Hobby-style LiPo packs use soft pouch cells with no rigid case, which makes them light but easy to damage. Enterprise drone batteries such as the DJI Matrice 4 series pack use lithium-ion cells inside a managed, hard-cased assembly [1], which reduces but does not eliminate the risk. Any swollen, punctured, dented, or crash-damaged pack should be retired, discharged, and taken to a battery recycling point, never charged again.

## Volts, amps, watts, and capacity

Voltage is electrical pressure, current in amps is flow, and power in watts is the product of the two. Capacity is stated two ways. Milliamp-hours (mAh) describe how much current a pack can deliver for how long. Watt-hours (Wh) multiply that by voltage and describe total energy, which is the number regulators care about. A lithium cell runs at a nominal 3.7 volts and reaches about 4.2 volts fully charged [2]. Packs are built from cells in series, described by an S number. A 4S pack is four cells in series at roughly 14.8 volts nominal. The Matrice 4 series battery is a 4S lithium-ion pack rated at 6,741 mAh, 14.76 volts, and 99.5 Wh [1]. That 99.5 Wh figure sits deliberately just under the 100 Wh airline threshold discussed below.

A C rating expresses charge or discharge rate as a multiple of capacity. A 1C rate on a 6,741 mAh pack is 6.7 amps. DJI rates the Matrice 4 battery for 4C discharge and up to 1.8C charging [1]. Hobby packs connect through standardized connectors named for their continuous current ratings, most commonly the XT30 at 30 amps, XT60 at 60 amps, and XT90 at 90 amps [3]. EC-series and Deans connectors also appear in older equipment. Matching connector rating to expected current keeps contacts from overheating.

## Charging safely

Charge on a non-flammable surface such as concrete, tile, or a metal tray, away from anything that can burn. Never leave charging batteries unattended, and inspect every pack for swelling, dents, or damaged wiring before plugging it in. A LiPo-rated fire containment bag or an ammo can adds a layer of protection for hobby packs. Know what your extinguisher can and cannot do. FAA testing found that a lithium-ion battery fire can be knocked down with a standard extinguisher and then must be cooled with large amounts of water to stop the cells from reigniting, while a Class D extinguisher is appropriate only for lithium-metal fires [4]. For a small pack, the practical plan is to move it somewhere it can burn out safely, then cool it with water, rather than trying to smother it.

## The nonlinear charge curve

Lithium batteries charge in two stages. The charger first pushes constant current while voltage climbs, then holds constant voltage while current tapers off, and the charge terminates when current falls to a few percent of capacity [2]. The practical consequence is that charging from about 30 to 80 percent is fast, and the final 10 percent is the slowest part of the whole charge. In the field this matters. If batteries are scarce and the charger is the bottleneck, flying packs that are at 90 percent is often smarter than waiting for the slow top-off. DJI builds this logic into its charging hubs, which offer a Ready-to-Fly mode that holds batteries at 90 percent for quicker turnaround [5].

## Storage and long-term care

Storing lithium batteries full shortens their life and increases risk. The industry reference point is storage at roughly 40 to 50 percent charge, which corresponds to about 3.8 volts per cell, in a cool dry place [6]. DJI intelligent flight batteries handle this automatically. When a pack sits idle above a set charge level for a number of days, firmware discharges it toward a storage level on its own [7]. This self-discharge behavior surprises new pilots, who find batteries they charged last week sitting at 60 percent. It is a feature, and it is also the reason batteries must be topped off shortly before a mission rather than days ahead.

## Behavior under load

Voltage sags under load because every cell has internal resistance. A pack resting at 15.5 volts may read a volt or more lower at full throttle, and the sag deepens as the pack empties and as it gets colder. Cold is the dominant field problem. Low temperatures raise internal resistance and cut usable capacity, so a winter morning flight ends sooner and sags harder than the same flight in summer [8]. Never charge a lithium battery below freezing, since charging below 0 C plates metallic lithium inside the cell and permanently damages it [8]. DJI enforces this with a 5 to 40 C charging temperature limit [1]. Note that the Matrice 4 series battery does not self-heat [5], so in cold weather warm packs in an insulated case or a vehicle, and hover after takeoff until the battery warms before starting work.

## Flying commercially with batteries

FAA and DOT rules for airline passengers are strict and specific. Spare lithium-ion batteries are forbidden in checked baggage and must ride in the cabin with terminals protected against short circuit. Batteries up to 100 Wh are allowed in reasonable quantities for personal use. Batteries from 101 to 160 Wh require airline approval and are limited to two spares per passenger [9]. This is why the Matrice 4 battery is specified at 99.5 Wh. Larger drone batteries above 160 Wh cannot travel on passenger aircraft at all and must ship as fully regulated dangerous goods.

## Related

- [Field Power Management](/topics/field-power-management.md) for charging logistics on a mapping day.
- [Field Operations Best Practices](/topics/field-operations-best-practices.md) for keeping packs cool and cycling in the field.
- [Emergency Procedures](/topics/emergency-procedures.md) for battery fire response in flight operations.
- [Maintenance and Inspection](/topics/maintenance-and-inspection.md) for battery care within the broader maintenance program.

## Citations

[1] DJI Matrice 4 Series Specifications. https://enterprise.dji.com/matrice-4-series/specs
[2] Battery University, BU-409: Charging Lithium-ion. https://www.batteryuniversity.com/article/bu-409-charging-lithium-ion/
[3] Connector Supplier, Meet the Connector: XT Connectors. https://connectorsupplier.com/meet-the-connector-xt-connectors/
[4] FAA Fire Safety Branch, Extinguishment of Lithium-Ion and Lithium-Metal Battery Fires (DOT/FAA/TC-13/53). https://www.fire.tc.faa.gov/pdf/TC-13-53.pdf
[5] DJI Matrice 4 Series FAQ. https://enterprise.dji.com/matrice-4-series/faq
[6] Battery University, BU-702: How to Store Batteries. https://www.batteryuniversity.com/article/bu-702-how-to-store-batteries/
[7] DJI Support, Introduction to DJI Intelligent Flight Battery Auto-Discharging Rules. https://support.dji.com/help/content?customId=en-us03400006548&spaceId=34&re=GB&lang=en
[8] Battery University, BU-410: Charging at High and Low Temperatures. https://www.batteryuniversity.com/article/bu-410-charging-at-high-and-low-temperatures/
[9] FAA PackSafe, Lithium Batteries. https://www.faa.gov/hazmat/packsafe/lithium-batteries
