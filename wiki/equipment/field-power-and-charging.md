# Field Power and Charging

**Field Power and Charging** is the program's answer to a practical constraint: a three-hour lab burns more battery than any affordable number of spare packs, so batteries must recharge in the field while others fly. The December 2025 memo specifies a compact kit for the AERO 100 training fleet, an EcoFlow DELTA 3 power station with a 220 W solar panel, parallel charging hubs for each aircraft type, and a high-wattage USB-C charger for pre-lab prep in the office, about $960 total [1]. The general theory and the enterprise-drone arithmetic live in [Field Power Management](../topics/field-power-management.md); this page covers the specific kit and checks the memo's math.

## The kit

The DELTA 3 is a 1,024 Wh LiFePO4 power station with 1,800 W of AC output and a 100 W USB-C port, bundled with a 220 W folding solar panel at $599 on sale as of the memo [1] [2]. Third-party parallel charging hubs, two for the Air 3 batteries and two for the Mini 3 batteries at roughly $56 to $60 each, are the quiet workhorses: the chargers included in DJI's Fly More combos charge their three batteries one at a time, while the parallel hubs charge all connected packs simultaneously, which is the difference between keeping up with a lab and falling behind it [1]. A 500 W USB-C desktop charger (about $70) tops off the fleet overnight in the office. Rounding out the field station: charge on a stable surface, in shade, with the [battery safety practices](../topics/battery-fundamentals-and-safety.md) the curriculum makes a full lecture.

## Checking the memo's arithmetic

The memo claims a 1,024 Wh station recharges about 13 Air 3 batteries or 21 Mini 3 batteries [1]. The Air 3 figure checks out: the Air 3 battery stores 62.6 Wh [3], and 1,024 Wh delivered at a realistic 80 percent end-to-end efficiency (inverter and charger losses) yields 819 Wh, almost exactly 13 packs. The Mini 3 figure is conservative to a fault: the Mini 3 battery stores just 18.1 Wh [4], so the same 819 Wh is about 45 recharges, or about 29 even assuming the heavier Intelligent Flight Battery Plus at 28.4 Wh. The memo's conclusion that the station supports a fleet of four to five drones through a session therefore holds with more margin than stated, at least for the Mini-heavy half of the fleet.

The solar claim is reasonable. A 220 W panel over a 2.5-hour session at a typical 70 percent of nameplate output, which matches real-world reports of 190 to 210 W in strong sun [2], contributes roughly 385 Wh, bringing effective session capacity to about 1,400 Wh, enough for six drones cycling batteries with margin [1]. Solar remains a supplement, not a foundation: output falls with haze, sun angle, and panel aim, so plan labs around the battery bank and treat solar gains as bonus.

## Enterprise aircraft are a different problem

The Matrice 4 series batteries store 99.5 Wh each and charge through a 100 W hub [5]. A DELTA 3 delivers roughly eight Matrice 4 recharges, and a mapping field day that flies six or more battery cycles while running a controller and laptop will drain it. The memo acknowledges this: the training-fleet power station is likely underpowered for the mapping course, and a larger station, a second unit, or a generator is a future purchase to size once the AERO 110 lab pattern is real [1]. The rotation math for enterprise packs, charger throughput versus consumption, is worked in [Field Power Management](../topics/field-power-management.md).

## Thermal management

Heat is the recurring field enemy the planning memo calls out [6]. Batteries come off aircraft warm and DJI limits charging to a 5 to 40 C pack temperature, direct Central Coast sun can push dark equipment past that fast, and hot electronics throttle or seize. The field station therefore lives in shade, batteries rest before charging, and the charging table stays ventilated rather than sealed in a car trunk. LiPo charge behavior is also nonuniform, fast through the middle of the charge curve and slow at the top, so a lab rotation that swaps packs at 80 or 90 percent moves more flight minutes per hour of charger time than one that insists on 100 percent, the same logic behind DJI's ready-to-fly hub modes [5]. These habits are curriculum, not just logistics, taught alongside [Battery Fundamentals and Safety](../topics/battery-fundamentals-and-safety.md) and the field craft in [Field Operations Best Practices](../topics/field-operations-best-practices.md).

## Related

- [Equipment Overview](equipment-overview.md) for where this kit sits in the budget.
- [Training Fleet](training-fleet.md) for the aircraft this kit keeps flying.
- [Field Power Management](../topics/field-power-management.md) for the general theory and enterprise math.
- [Battery Fundamentals and Safety](../topics/battery-fundamentals-and-safety.md) for the safety curriculum.

## Citations

[1] Cuesta drone program equipment memo to Ron Overacker, December 11, 2025 (equipment-purchasing/drone-program-equipment-memo.typ in this repository).
[2] EcoFlow, DELTA 3 Classic portable power station (1,024 Wh, 1,800 W AC) and 220 W solar panel bundle. https://us.ecoflow.com/products/delta-3-classic-portable-power-station
[3] DJI, Air 3 specifications (battery 4,241 mAh, 62.6 Wh). https://www.dji.com/air-3/specs
[4] DJI, Mini 3 specifications (battery 2,453 mAh, 18.1 Wh). https://www.dji.com/mini-3/specs
[5] DJI, Matrice 4 Series specifications and battery charging hub. https://enterprise.dji.com/matrice-4-series/specs
[6] Planning voice memo, drone program purchases and curriculum, December 11, 2025 (equipment-purchasing/Planning_Drone_Program_Purchases_and_Curriculum.md in this repository).
