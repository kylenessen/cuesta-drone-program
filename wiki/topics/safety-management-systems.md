# Safety Management Systems for Drone Operations

A Safety Management System makes safety learning persist beyond one flight and one pilot. A pilot notices a problem. The organization records it, assigns responsibility, changes its operation, checks the result, and shares what it learned. [Part 5](../regulations/part-5-safety-management-systems.md) supplies the structure. [AC 120-92D](../sources/ac-120-92d.md), Chapter 2 and Appendix G, explains how the structure can fit a small operation.

[Aeronautical decision-making](aeronautical-decision-making.md) supports the pilot's immediate judgment. SMS adds the organizational process that prevents the next crew from inheriting the same unresolved problem. A checklist, preflight briefing, or risk matrix can support SMS, but none alone supplies the whole system.

## The four components in practice

Safety policy answers who is responsible, what the organization expects, and what resources it will provide. A proposed class policy would authorize any participant to call a pause, identify who can approve resumption, explain how to report a concern, and make the handling of honest reports clear. It would also distinguish honest mistakes from unacceptable behavior. Those are local choices modeled on §§ 5.21 through 5.27, not policies already adopted by Cuesta.

Safety risk management starts with the actual operation. Describe the aircraft, software, people, site, mission, and interactions with others. Identify conditions that could cause harm, the possible consequences, and the expected severity and likelihood. Evaluate controls before implementing them. Reassess when introducing a new aircraft, changing firmware or procedures, or discovering that a control is ineffective. [Part 5, §§ 5.51 through 5.57](../sources/14-cfr-part-5.md)

Safety assurance checks what happened in practice. Compare flight records, instructor observations, equipment discrepancies, and reports against the intended operation. Decide whether a control was used and whether it worked. An absence of accidents is weak evidence when exposure is small. A recurring defect is significant even if a pilot has always caught it before takeoff. [Part 5, §§ 5.71 through 5.75](../sources/14-cfr-part-5.md)

Safety promotion makes the system usable. Train people for their actual roles. Explain procedural changes and the reasons behind them. Share a short, de-identified lesson before the next lab so a useful report produces a visible improvement. Preserve the relevant training and communication records. [Part 5, §§ 5.91 through 5.97](../sources/14-cfr-part-5.md)

## Hazard, consequence, and risk

A hazard is a condition or object that can contribute to an accident or incident. Risk combines the predicted severity and likelihood of its consequences. For example, an obstructed return path is the hazard. A collision during return-to-home is a possible consequence. The risk assessment asks how severe that outcome could be and how likely it is under the actual mission conditions. A control might change the launch site or the permitted flight area. Simply writing “pilot error” or “crash” does not describe the system well enough to choose a useful control. [Part 5, § 5.3](../sources/14-cfr-part-5.md)

The following examples are curriculum design proposals. They illustrate how to reason from an observed condition to evidence of improvement. Aircraft-specific procedures and limits must come from the applicable manufacturer or validated build documentation.

| Operation and hazard | Possible consequence | Proposed control | Evidence to review |
| --- | --- | --- | --- |
| Student build with an unverified motor or propeller configuration | Loss of control at first flight | Independent configuration check, gradual training progression, and instructor release | Completed inspection and controlled test record |
| Firmware update changes a failsafe setting | Unexpected behavior after link loss | Configuration comparison and simulator or safe bench verification before release | Approved configuration record and test results |
| Mapping route near a public access path | A person enters the operating area | Change the site layout or mission boundary and assign a crew response | Boundary observations and records of pauses or aborts |
| Repeated battery voltage warnings on the same pack | Forced landing or loss of thrust | Remove the pack from flight use pending documented evaluation | Pack history and recurrence after corrective action |
| Inspection crew becomes focused on the image feed | Loss of awareness of aircraft or people | Define pilot and payload tasks, establish callouts, and pause when crew capacity is exceeded | Instructor observations and debrief findings |
| Adjacent crews use conflicting launch areas | Aircraft or personnel conflict | Coordinate launch timing, boundaries, and an explicit stop signal | Crew briefing and observed compliance |

These controls cannot be assigned universal risk scores. Define the consequence, exposure, and available evidence first. A three-level classroom scale can support discussion if the instructor defines each level and its approval rule. It is a local teaching tool. Part 5 does not mandate a particular numeric matrix, and a low score cannot cancel an operating restriction. [AC 120-92D, § 3.4 and Table 3-1](../sources/ac-120-92d.md)

## Reporting and measurement

A useful report records the mission or equipment involved, what was observed, the possible harm, immediate action, and what needs follow-up. Assign a record number, action owner, due date, and reviewer. Separate implementing a correction from verifying that it worked. Close the record only after the reviewer has enough evidence, or reopen it if the hazard persists.

For a proposed student system, reports should reach an instructor privately. Shared teaching examples should omit unnecessary personal information. Do not place identifiable student reports in the public curriculum repository. Explain confidentiality limits and the college's actual reporting obligations. Internal learning reports do not replace [FAA accident reporting](../regulations/part-107.md) or other applicable notifications.

Useful proposed measures include the fraction of flights with complete briefings, repeat equipment discrepancies per flight or battery cycle, overdue corrective actions, and recurrence after a control was introduced. Always record the denominator and the observation period. More reports may reflect greater trust. Fewer reports may reflect silence. Do not reward students for producing a low report count or for flying when a no-go decision is justified.

Use the [hazard review and change management lab](../activities/sms-hazard-review-and-change-management.md) to practice this workflow. Connect it to [maintenance records](maintenance-and-inspection.md), [emergency procedures](emergency-procedures.md), and [field operations](field-operations-best-practices.md).
