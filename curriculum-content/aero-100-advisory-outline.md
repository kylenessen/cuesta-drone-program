# AERO 100: Basic UAV Operator

Course Outline for Advisory Committee Review
Kyle Nessen, July 2026

AERO 100 is the entry point to the UAS certificate program. It serves students who want to work with drones professionally, and everything in the course points at three outcomes. Students earn the FAA Remote Pilot Certificate when they pass the Part 107 knowledge test, which we schedule with them during the semester. Students learn how a drone works from the inside, because they build and fly their own small aircraft. Students also develop real flight competency. They show it on a standardized flight test at the end of the term, ideally on the aircraft they built.

## The Part 107 Remote Pilot Certificate

The lecture sequence covers the FAA knowledge areas so students can pass the Part 107 knowledge test. Students schedule the test during the term, so the certificate does not remain a loose end after the course. A passed test may also count toward the grade.

- The Part 107 rule: operating limits, remote pilot responsibilities, accident reporting, and the certificate application process
- Drone registration, Remote Identification, operations over people, and certificates of waiver
- Airspace classes and how to read a sectional chart
- Airspace authorization in practice: LAANC, DroneZone, NOTAMs, and the preflight checking habit
- Airport operations and the radio calls remote pilots monitor near airports
- Aviation weather: METAR and TAF decoding, weather sources, and the effects of wind, density altitude, and fronts on a small aircraft
- Aircraft loading and performance: weight and balance, center of gravity, and load factor
- Human factors: aeronautical decision-making, hazardous attitudes, risk management, and pilot physiology
- Emergency procedures: lost link, flyaways, GPS loss, and battery fires
- A short preview of Part 108, the pending rule for flight beyond visual line of sight

## Drone Fundamentals Through Building

Across the semester, students build and fly a small GPS-capable quadcopter made from commodity parts. The design target mimics a commercial platform. The aircraft holds position on GPS, returns home on command, and flies basic waypoint missions, while it stays small and cheap to crash. This is not a hobbyist course, and first-person-view racing and freestyle flying stay out of scope, because those skills rarely appear in commercial work.

The build is how the course teaches what a drone contains and how it fails. Concepts that would otherwise stay in lecture, like compass calibration, failsafe behavior, and battery discipline, become work students have done with their hands. The exact build format is still under development, including the parts list and whether students work alone or in pairs. We welcome the committee's input here.

- Anatomy of a multirotor: airframe, flight controller, electronic speed controllers, motors, propeller sizing, GPS and compass, and the radio receiver
- Autopilot firmware and flight modes: position hold, altitude hold, return to home, waypoint missions, geofencing, and failsafes
- The command and video radio links: what degrades them, and the lost-link behavior students must configure and trust
- Battery fundamentals and safety: volts, amps, and watts, LiPo hazards, and the charge, storage, and transport discipline that prevents fires
- Assembly and bench skills: soldering, wiring, firmware setup, calibration, and how to read telemetry and flight logs
- Troubleshooting as core content: find why an aircraft will not arm, trace a vibration problem, and repair crash damage
- Maintenance practice: preflight and postflight inspection, recordkeeping, and component replacement
- Regulatory compliance as lived procedure: students register their own aircraft and meet the Remote ID requirement themselves

## Flight Competency

Flight time runs through the whole semester and does not wait for the build to finish. Students start on simulators and a pre-built trainer aircraft in the first weeks, so stick time accumulates from day one. Their own aircraft joins the rotation mid-term. The capstone is the NIST Open Test Lane, a standardized flight test from the National Institute of Standards and Technology. Public safety agencies and industry use it widely. The pilot flies a lane of bucket targets and must position and aim the camera well enough to capture a legible image inside each one. The score comes from what the camera resolved, not from an instructor's opinion.

The test demands real camera control, so students fly it on the program's camera-equipped aircraft. The student-built aircraft flies the same course to prove the build. Whether the build carries a camera of its own is an open design decision.

- Early simulator work and first flights on trainer aircraft in GPS-assisted modes
- A step-by-step progression of flight modes, from full GPS position hold down to attitude mode, where the aircraft self-levels but does not hold position. This is the most manual mode a Mavic or an Inspired Flight aircraft offers. It is also the mode a commercial drone drops into when GPS fails near steel or energized infrastructure
- Precision maneuvering drills: geometric patterns, positioning over targets, orbits, and camera pointing on a time limit
- Field discipline: checklists, go/no-go judgment, attention management, and operations in shared airspace
- Night operations: the current night rules, anti-collision lighting, and twilight definitions
- The capstone flight assessment on the NIST Open Test Lane within a set time limit

## Where This Leads

The course closes with a sample of drone work in the field: mapping, utility inspection, agriculture, and public safety. Students see the products clients buy and the thermal inspection work that anchors regional drone employment. When time allows, we also fly the larger platforms from the later courses, so students have something concrete to look forward to. AERO 100 is the prerequisite for AERO 110 (Advanced Drone Mapping and Remote Sensing) and AERO 120 (Drone Infrastructure Inspection). A student who finishes AERO 100 arrives with the certificate, the flight record, and the mechanical understanding those courses assume.

<!-- markco-comments
{
  "version": 2,
  "comments": [
    {
      "id": "1c1cc78b-d71c-484d-8612-802cff54cc74",
      "anchor": {
        "text": "Night operations: the current night rules, anti-collision lighting, and twilight definitions",
        "startLine": 47,
        "startChar": 2,
        "endLine": 47,
        "endChar": 94
      },
      "content": "This point reads to me that we will be doing night operations as part of our flight competency. And I don't know if we can actually do that appropriately. I think this belongs more appropriately in the part 107 section.",
      "author": "Kyle Nessen",
      "createdAt": "2026-07-27T22:46:37.075Z"
    },
    {
      "id": "16825e59-5cd6-4835-970c-cea93cd71d3b",
      "anchor": {
        "text": "Students see the products clients buy and the thermal inspection work that anchors regional drone employment.",
        "startLine": 52,
        "startChar": 121,
        "endLine": 52,
        "endChar": 230
      },
      "content": "Generalize this sentence so that it says students see how drums are used in commercial applications.",
      "author": "Kyle Nessen",
      "createdAt": "2026-07-27T22:47:06.310Z"
    }
  ]
}
-->