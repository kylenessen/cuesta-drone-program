# Infrastructure Inspection Operations

**Infrastructure Inspection Operations** are the largest steady employment sector adjacent to drone mapping. Where mapping produces measurable geospatial products, inspection produces evidence about asset condition, photographs and thermal data tied to specific equipment, reviewed for defects, and fed into maintenance programs. In California the sector is anchored by utility work, driven by regulatory inspection mandates and wildfire risk, and Pacific Gas and Electric (PG&E) runs one of the largest utility drone inspection programs in the country. For a mapping-trained pilot, inspection is a natural second skill set with a distinct technique and reporting discipline.

## Visual inspection with zoom

High-zoom visual inspection is the core technique. Instead of flying close to an asset, the pilot holds a safe standoff distance and uses optical zoom to fill the frame with the component of interest, a cotter pin, an insulator, a splice, a weld. The DJI Matrice 4T carries a high-zoom telephoto payload suited to exactly this work. Good technique means systematic coverage, consistent framing from asset to asset so review is efficient, shooting each defect from more than one angle, and controlling for lighting, since backlit or harshly shadowed images hide defects. The reviewer, often a different person than the pilot, needs to identify the structure, the component, and the defect from the image alone, so disciplined naming and per-structure organization matter as much as image quality.

## Thermal inspection

Thermal imaging extends inspection to defects invisible to the eye, and the underlying physics and traps are covered in [Thermal Imaging](/topics/thermal-imaging.md). On electrical equipment, resistive heating at degraded connectors, splices, and transformer bushings shows up as localized hot spots, best judged as a temperature rise over ambient or over an identical adjacent component rather than as an absolute number. On solar arrays, thermal flights find hot cells, failed bypass diodes, and whole strings offline, and array-scale surveys are commonly flown as thermal orthomosaics. On building envelopes, thermal reveals insulation voids, air leakage, and moisture, with timing chosen to maximize inside to outside temperature difference and avoid solar loading. Clients increasingly expect this work from certified thermographers, and the credential pathway, cost, and career value are covered in [Level 1 Thermography Certification](/exams/level-1-thermography-certification.md).

## The California utility context

Two CPUC general orders structure California utility inspection work. General Order 95 sets the rules for overhead electric line construction and maintenance, including the requirement that lines be inspected and kept in safe condition, with heightened requirements in designated fire-threat areas [1]. General Order 165 sets maximum inspection cycles for electric distribution facilities and defines the inspection types, patrol inspections (a simple visual check for obvious hazards), detailed inspections (careful examination of each piece of equipment with condition rating and recordkeeping), and intrusive wood pole inspections [2]. Patrols run at least annually in urban areas and at least every two years in rural areas, with annual patrols required in the highest fire-threat areas, and detailed overhead inspections run on a five year cycle at most [2]. Utilities must keep inspection records for at least ten years [2].

Those mandated cycles, multiplied across millions of poles and structures, are what create sustained demand for inspection imagery. PG&E has used drones since the mid 2010s and now flies them at scale for distribution, transmission, and substation inspection, concentrating on high fire-threat districts, and has publicly described aerial inspection of hundreds of thousands of poles per year along with FAA approval for beyond visual line of sight operations [3] [4]. Contractors and service companies perform much of this flying and image review, which is where entry-level inspection employment tends to sit.

## Reporting

The deliverable is a defect report, not a map. A competent report identifies each asset by its identifier and location, documents observed conditions with annotated images, classifies severity against the client's rating scheme (GO 165 explicitly requires condition rating and scheduled corrective action for utility work [2]), and separates observations from interpretation. Consistency across hundreds of structures is the skill. Clients care less about a beautiful single image than about knowing that every structure was covered the same way.

## Safety near energized equipment

Energized equipment adds hazards that mapping work never encounters. Operators maintain minimum approach distances from energized conductors, and utilities specify their own standoff requirements consistent with OSHA's minimum approach distance framework for work near energized parts [5]. High-voltage lines can induce interference in aircraft electronics and magnetometers at close range, which is another argument for zoom over proximity. A crash into a conductor is not just a lost aircraft, it is a potential outage or ignition source. Utility flight operations therefore run under job briefings, with the asset owner's knowledge, and treat the conductor the way a manned aviation crew treats terrain. [Flying Near Energized Infrastructure](/topics/flying-near-energized-infrastructure.md) covers these hazards, the approach distance framework, and the surrounding safety culture in depth.

## Related

- [Flying Near Energized Infrastructure](/topics/flying-near-energized-infrastructure.md) for the hazards and work rules around energized conductors.
- [Thermal Imaging](/topics/thermal-imaging.md) for the sensing behind thermal inspection.
- [Level 1 Thermography Certification](/exams/level-1-thermography-certification.md) for the credential utility and solar clients expect.
- [Public Safety Drone Operations](/topics/public-safety-drone-operations.md) for the neighboring employment sector.
- [Field Operations Best Practices](/topics/field-operations-best-practices.md) for the operational discipline inspection inherits.
- [Drone Radio Links and Interference](/topics/drone-radio-links-and-interference.md) for what strong transmitters do to the aircraft's control link.

## Citations

[1] CPUC General Order 95, Rules for Overhead Electric Line Construction, Rule 80.1 (fire-threat area patrol requirements). https://ia.cpuc.ca.gov/gos/go95/go_95_rule_80_1.htm
[2] CPUC General Order 165, Inspection Requirements for Electric Distribution and Transmission Facilities. https://docs.cpuc.ca.gov/PUBLISHED/GENERAL_ORDER/159182.htm
[3] PG&E, General Order 165 Annual Electric Distribution Inspection Report. https://www.pge.com/assets/pge/docs/regulation/PGE-2017-GO-165-Annual-Electric-Distribution-Inspection-Report.pdf
[4] DroneXL, PG&E Showcases Drone Technology for Electrical Inspections. https://dronexl.co/2025/04/24/pge-drone-inspections/
[5] OSHA 29 CFR 1910.269, Electric Power Generation, Transmission, and Distribution. https://www.osha.gov/laws-regs/regulations/standardnumber/1910/1910.269
