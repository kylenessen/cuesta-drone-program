# AERO 100: Basic UAV Operator

Course Outline for Advisory Committee Review
Kyle Nessen, July 2026

AERO 100 is the entry point to the UAS certificate program. The course is three units, has no prerequisites, and meets in person for lecture and lab. It serves students who want to work with drones professionally, and everything in the course points at three outcomes.

Students earn the FAA Remote Pilot Certificate when they pass the Part 107 knowledge test, which we schedule with them during the semester. Students learn the fundemantels of drones by building their own. Students also develop real flight competency. They show it on a standardized flight test at the end of the term, ideally on the aircraft they built. The goal across all three is a safe, confident pilot who follows the best practices of commercial drone work and can be productive immediately upon being hired.

## The Part 107 Remote Pilot Certificate

The lecture sequence covers the FAA knowledge areas so students can pass the Part 107 knowledge test. Students schedule the test during the term, so the certificate does not remain a loose end after the course. A passed test may also count toward the grade.

- The Part 107 rule: operating limits, remote pilot responsibilities, accident reporting, and the certificate application process
- Drone registration, Remote Identification, operations over people, and certificates of waiver
- Airspace classes and how to read a sectional chart
- Airspace authorization in practice: LAANC, DroneZone, NOTAMs, and the preflight checking habit
- Airport operations and the radio calls remote pilots monitor near airports
- Night operations: the current night rules, anti-collision lighting, and twilight definitions
- Aviation weather: METAR and TAF decoding, weather sources, and the effects of wind, density altitude, and fronts on a small aircraft
- Aircraft loading and performance: weight and balance, center of gravity, and load factor
- Human factors: aeronautical decision-making, crew resource management, hazardous attitudes, risk management, and pilot physiology
- Emergency procedures: lost link, flyaways, GPS loss, and battery fires
- A short preview of Part 108, the pending rule for flight beyond visual line of sight

## Drone Fundamentals Through Building

Across the semester, students build and fly a small GPS-capable quadcopter made from commodity parts. The design target mimics a commercial platform. The aircraft holds position on GPS, returns home on command, and flies basic waypoint missions, while it stays small and cheap to crash. This is not a hobbyist course, and first-person-view racing and freestyle flying stay out of scope, because those skills rarely appear in commercial work.

The build is how the course teaches what a drone contains and how it fails. Concepts that would otherwise stay in lecture, like compass calibration, failsafe behavior, and battery discipline, become work students have done firsthand. The exact build format is still under development, including the parts list and whether students work alone or in pairs. We welcome the committee's input here.

- Anatomy of a multirotor: airframe, flight controller, electronic speed controllers, motors, propeller sizing, GPS and compass, and the radio receiver
- Autopilot firmware and flight modes: position hold, altitude hold, return to home, waypoint missions, geofencing, and failsafes
- The command and video radio links: what degrades them, and the lost-link behavior students must configure and trust
- Battery fundamentals and safety: volts, amps, and watts, LiPo hazards, and the charge, storage, and transport discipline that prevents fires
- Assembly and bench skills: soldering, wiring, firmware setup, calibration, and how to read telemetry and flight logs
- Troubleshooting as core content: find why an aircraft will not arm, trace a vibration problem, and repair crash damage
- Maintenance practice: preflight and postflight inspection, recordkeeping, and component replacement
- Regulatory compliance as lived procedure: students register their own aircraft and meet the Remote ID requirement themselves

## Flight Competency

Flight time runs through the whole semester and does not wait for the build to finish. Students start on simulators and a pre-built trainer aircraft in the first weeks, so stick time accumulates from the beginning. Their own aircraft joins the rotation mid-term. The capstone is the NIST Open Test Lane, a standardized flight test from the National Institute of Standards and Technology. Public safety agencies and industry use it widely. The pilot flies a lane of bucket targets and must position and aim the camera well enough to capture a legible image inside each one.

The test demands real camera control, so students fly it on the program's camera-equipped aircraft. The student-built aircraft flies the same course to prove the build. Whether the build carries a camera of its own is an open design decision.

- Early simulator work and first flights on trainer aircraft in GPS-assisted modes
- A step-by-step progression of flight modes, from full GPS position hold down to attitude mode, where the aircraft self-levels but does not hold position. This is the most manual mode a Mavic or an Inspired Flight aircraft offers. It is also the mode a commercial drone drops into when GPS fails near steel or energized infrastructure
- Precision maneuvering drills: geometric patterns, positioning over targets, orbits, and camera pointing on a time limit
- Field discipline: checklists, go/no-go judgment, attention management, and operations in shared airspace
- The capstone flight assessment on the NIST Open Test Lane within a set time limit

## Where This Leads

The course closes with a sample of drone work in the field: mapping, utility inspection, agriculture, and public safety. Students see how drones are used in commercial applications. When time allows, we also fly the larger platforms from the later courses, so students have something concrete to look forward to. AERO 100 is the prerequisite for AERO 110 (Advanced Drone Mapping and Remote Sensing) and AERO 120 (Drone Infrastructure Inspection). A student who finishes AERO 100 arrives with the certificate, the flight record, and the mechanical understanding those courses assume.

<!-- markco-comments
{
  "version": 2,
  "comments": [
    {
      "id": "528990f0-6cdb-4b0f-9c09-8566efbe5f0a",
      "anchor": {
        "text": "Students learn the fundemantels of drones by building their own",
        "startLine": 7,
        "startChar": 140,
        "endLine": 7,
        "endChar": 203
      },
      "content": "Clunky but closer into spirit to what I want to say.",
      "author": "Kyle Nessen",
      "createdAt": "2026-07-27T22:58:02.629Z"
    }
  ]
}
-->