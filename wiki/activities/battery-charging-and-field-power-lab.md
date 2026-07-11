# Battery Charging and Field Power Lab

**Battery Charging and Field Power Lab** makes the program's battery unit physical. Students spend the battery lecture learning that lithium packs are dangerous, that charging is nonlinear, and that field days are won by power arithmetic; this lab has them inspect real packs, run a charging station, watch the charge curve flatten in real time, and do the arithmetic that decides whether a fleet survives a three hour session. It doubles as the working power station for every subsequent flight lab, so the skills are practiced again each field day rather than once. The knowledge behind it lives in [Battery Fundamentals and Safety](../topics/battery-fundamentals-and-safety.md) and [Field Power Management](../topics/field-power-management.md).

## What it teaches

The approved outline requires battery maintenance under Maintenance and Preflight Inspection Procedures and endurance under Aircraft Performance [1], and the lab covers both: pre-charge inspection and battery logging are the maintenance half, and estimating flight time per pack and packs per session is the endurance half. Underneath sits the two-stage lithium charging behavior, constant current then constant voltage, whose practical consequence is that the middle of the charge is fast and the final ten percent is the slowest part of the whole cycle [2]. A student who has watched a pack race to 80 percent and then crawl understands why crews fly at 90 percent instead of waiting, and that judgment call is the lab's real product.

## Equipment

The lab uses the program's standard field charging kit: a 1,024 Wh portable power station with 1,800 W of AC output [3], one third party parallel charging hub per aircraft type, which charges all inserted batteries simultaneously, alongside the stock DJI hubs that charge their three batteries one at a time, the training fleet's batteries, and a folding table with shade. Battery specifics anchor the math: a Mini 3 battery stores 18.1 Wh and fills in roughly an hour on its rated charger, and an Air 3 battery stores 62.6 Wh [4] [5]. A cheap infrared thermometer earns its place by making battery temperature a measured number instead of a guess, and a LiPo-rated fire bag plus the site's extinguisher plan belong on the table any time packs are charging, per the safety practice in [Battery Fundamentals and Safety](../topics/battery-fundamentals-and-safety.md).

## Setup

Stage the charging table in shade, on a non-flammable surface, away from anything that burns, with the power station feeding the parallel hubs and a labeled spot for each battery state: charged, charging, resting, and flagged. Bring at least a few packs deliberately discharged to 20 or 30 percent from a prior session so the charge-curve observation has range to work with. Print a one-page battery log sheet per station: pack ID, physical inspection result, starting percentage, percentage every ten minutes, temperature at insertion, and time to full.

## Running the lab

Open with inspection. Every student handles several packs and checks each the way [Maintenance and Inspection](../topics/maintenance-and-inspection.md) prescribes for preflight: swelling, dents, cracked cases, damaged connectors, and charge state, logging each pack pass or flag. Include one retired swollen pack in the rotation if the program has one; students who have felt a puffed battery do not need convincing later. Check each pack's temperature before it goes on the charger and hold anything warm from flight or sun until it cools, since lithium packs charge safely only within a narrow temperature window, 5 to 40 C for DJI batteries [4], and charging hot accelerates degradation [6].

Then run the station. Students insert packs across the parallel and stock hubs, log percentages every ten minutes, and plot percentage against time at the end. The plot shows the lecture claim directly: near-linear progress through the middle, then a long flattening tail above 80 percent [2]. While packs charge, run the arithmetic workshop: given the power station's 1,024 Wh, a 15 percent conversion loss, and the fleet's per-pack watt-hours, how many refills does the station hold, how many packs per hour does the station return, and does that keep four aircraft flying 25 minute cycles for three hours [3] [4] [5]? Close with the decision drill: it is 2:40 pm, the demo flight is at 3:00, and the pack on the charger reads 88 percent. Fly it or wait? The charge curve says waiting buys little; the endurance estimate says 88 percent covers the mission with reserve. Students defend the call from their own logged data.

## Variations and progressions

In cool weather, add the cold half of the story: log the sag and shortened flight time of a cold-soaked pack against a warm one, tying to the internal resistance behavior in [Battery Fundamentals and Safety](../topics/battery-fundamentals-and-safety.md). With the solar panel attached, log the station's input watts across the session and compare against panel nameplate, which teaches honest derating of solar claims. For an advanced session, have students plan the complete power budget for a hypothetical off-grid mapping day using [Field Power Management](../topics/field-power-management.md) as the reference, then check their plan against a real lab day's consumption log. Storage discipline makes a good semester-end coda: packs going into a break get set to storage charge, and the class checks in on the auto-discharge behavior of packs left full.

## Assessment

Grade the log sheet and the plot as lab deliverables, and the arithmetic workshop as a worked problem set; the approved outline's assignment to calculate expected in-flight endurance as part of a technical preflight inspection is essentially this lab's math attached to an inspection [1]. A short practical check works well at midterm: hand the student a pack and ask for the inspection, the charge decision, and the endurance estimate, spoken aloud. The strongest indirect assessment is operational: by late term, the charging station at flight labs should run itself, with students rotating packs, logging cycles, and flagging suspect batteries without being told.

## Related

- [Battery Fundamentals and Safety](../topics/battery-fundamentals-and-safety.md) for the chemistry, hazards, and charge behavior underneath the lab.
- [Field Power Management](../topics/field-power-management.md) for the same logistics at enterprise mapping scale.
- [Maintenance and Inspection](../topics/maintenance-and-inspection.md) for the inspection and logging practice the lab drills.
- [Preflight Inspection and Go/No-Go Briefing](preflight-and-go-no-go-briefing.md) for the ground exercise the battery inspection plugs into.

## Citations

[1] [AERO 100 Course Outline](../sources/aero-100-course-outline.md), Maintenance and Preflight Inspection Procedures, Aircraft Performance, and the endurance-calculation assignment.
[2] Battery University, BU-409: Charging Lithium-ion. https://www.batteryuniversity.com/article/bu-409-charging-lithium-ion/
[3] EcoFlow DELTA 3 Portable Power Station. https://us.ecoflow.com/products/delta-3-portable-power-station
[4] DJI Support, Intelligent Flight Battery Technical Specifications (Mini series). https://repair.dji.com/help/content?customId=en-us03400006564&spaceId=34&re=US&lang=en
[5] DJI Air 3 Specifications. https://www.dji.com/air-3/specs
[6] Battery University, BU-410: Charging at High and Low Temperatures. https://www.batteryuniversity.com/article/bu-410-charging-at-high-and-low-temperatures/
