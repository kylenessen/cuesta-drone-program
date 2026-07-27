# AERO 100: Basic UAV Operator

Course Outline for Advisory Committee Review
Kyle Nessen, July 2026

AERO 100 is the entry point to the UAS certificate program. It is built for students who want to work with drones professionally, and everything in the course points at three outcomes. Students earn the FAA Remote Pilot Certificate by passing the Part 107 knowledge test, which we schedule with them during the semester. Students learn how drones actually work by building and flying their own small aircraft, because assembling the flight controller, motors, and radio system teaches the fundamentals faster and more durably than lecture alone. And students build genuine flight competency, demonstrated on a standardized obstacle course flight test at the end of the term, ideally flown on the aircraft they built.

This is not a hobbyist course. First-person-view racing and freestyle flying are deliberately out of scope, since that skill set rarely appears in commercial work. The target graduate holds a Remote Pilot Certificate, has passed an objective flight assessment, and understands the aircraft down to the component level. They will not build drones on the job, but having built one, they can troubleshoot and reason about any platform an employer puts in their hands. That combination prepares them for the advanced mapping and inspection courses and for entry-level commercial work.

## The Part 107 Remote Pilot Certificate

The lecture sequence covers the FAA knowledge areas so students can pass the Part 107 knowledge test. Students schedule the test during the term rather than leaving it as a loose end, and passing it may be built into the grade.

- The Part 107 rule itself: operating limits, remote pilot responsibilities, accident reporting, and the certificate application process
- Drone registration, Remote Identification, operations over people, and certificates of waiver
- Airspace classification and reading sectional charts
- Airspace authorization in practice: LAANC, DroneZone, NOTAMs, and the preflight checking habit
- Airport operations and the radio communications remote pilots monitor near airports
- Aviation weather: METAR and TAF decoding, weather sources, and how wind, density altitude, and fronts affect a small aircraft
- Aircraft loading and performance: weight and balance, center of gravity, and load factor
- Human factors: aeronautical decision-making, hazardous attitudes, risk management, and pilot physiology
- Emergency procedures: lost link, flyaways, GPS loss, and battery fires
- A brief look ahead at Part 108, the pending rule for flight beyond visual line of sight, so students see where the industry is heading

## Drone Fundamentals Through Building

Students spend the semester building a small GPS-capable quadcopter from commodity components and flying it. The design target mimics a commercial platform: it holds position on GPS, returns home on command, and flies basic waypoint missions, while staying small and cheap to crash. The build is how the course teaches what a drone is made of and how it fails. Concepts that would otherwise be slideware, like compass calibration, failsafe behavior, and battery discipline, become things students have done with their hands. The exact build format, including the parts list and whether students work individually or in pairs, is still being developed, and we welcome the committee's input here.

- Anatomy of a multirotor: airframe, flight controller, electronic speed controllers, motors, propeller sizing, GPS and compass, and the radio receiver
- Autopilot firmware and flight modes: position hold, altitude hold, return to home, waypoint missions, geofencing, and the failsafes that catch a bad day
- The command and video radio links, what degrades them, and the lost-link behavior students must configure and trust
- Battery fundamentals and safety: volts, amps, and watts, LiPo hazards, and the charging, storage, and transport discipline that prevents fires
- Assembly and bench skills: soldering, wiring, firmware setup, calibration, and reading telemetry and flight logs
- Troubleshooting as core curriculum: diagnosing why an aircraft will not arm, chasing a vibration problem, and repairing crash damage
- Maintenance practice: preflight and postflight inspection, recordkeeping, and component replacement
- Regulatory compliance as lived procedure: students register their aircraft and meet the Remote ID requirement on a drone they own the problem for

## Flight Competency

Flight time runs through the whole semester rather than waiting for the build to finish. Students start on simulators and a pre-built trainer aircraft in the first weeks, so stick time accumulates from day one, and their own aircraft joins the rotation mid-term. The capstone is the NIST Open Test Lane, a standardized flight test developed at the National Institute of Standards and Technology and used across public safety and industry. The pilot flies a course of bucket targets and must position and aim the camera precisely enough to capture legible images inside each one, so the score comes from what the camera resolved rather than an instructor's opinion.

- Early simulator work and first flights on trainer aircraft in GPS-assisted modes
- A progression of flight modes that removes assistance step by step, from full GPS position hold down to manual flight, because assisted flight is exactly what fails near steel and energized infrastructure
- Precision maneuvering drills: geometric patterns, positioning over targets, orbits, and camera pointing under a clock
- Field discipline: checklists, go/no-go judgment, attention management, and operating in shared airspace
- Night operations: the current night rules, anti-collision lighting, and twilight definitions
- The capstone flight assessment on the NIST Open Test Lane within a set time limit, flown on the student's own aircraft wherever feasible

## Where This Leads

The course closes with a short survey of the commercial applications the advanced courses explore in depth: drone mapping and the products clients buy, thermal imaging and the utility inspection industry that anchors regional drone employment, agricultural applications on the Central Coast, and public safety operations. AERO 100 is the prerequisite for AERO 110 (Advanced Drone Mapping and Remote Sensing) and AERO 120 (Drone Infrastructure Inspection), and a student who finishes it holds the certificate, the flight record, and the mechanical understanding those courses assume.

<!-- markco-comments
{
  "version": 2,
  "comments": [
    {
      "id": "690171a7-fea5-4fa9-b458-faab4543ef6e",
      "anchor": {
        "text": "This is not a hobbyist course. First-person-view racing and freestyle flying are deliberately out of scope, since that skill set rarely appears in commercial work. The target graduate holds a Remote Pilot Certificate, has passed an objective flight assessment, and understands the aircraft down to the component level. They will not build drones on the job, but having built one, they can troubleshoot and reason about any platform an employer puts in their hands. That combination prepares them for the advanced mapping and inspection courses and for entry-level commercial work.",
        "startLine": 7,
        "startChar": 0,
        "endLine": 7,
        "endChar": 580
      },
      "content": "I'm leaning towards deleting this whole paragraph. I don't think it needs to be in the intro, but I'm just flagging it now because there may be a place later where identifying it as not being a hobbyist course could be useful, but I don't think it needs to be at the top.",
      "author": "Kyle Nessen",
      "createdAt": "2026-07-27T22:22:11.220Z"
    },
    {
      "id": "b7934b71-9f2c-41b0-822c-16a3b2b8f9d4",
      "anchor": {
        "text": "slideware",
        "startLine": 26,
        "startChar": 394,
        "endLine": 26,
        "endChar": 403
      },
      "content": "Slideware is a needlessly complex word.",
      "author": "Kyle Nessen",
      "createdAt": "2026-07-27T22:23:53.093Z"
    },
    {
      "id": "a61993fe-de37-4500-9837-c57f6deb4f43",
      "anchor": {
        "text": "must position and aim the camera precisely enough to capture legible images",
        "startLine": 39,
        "startChar": 486,
        "endLine": 39,
        "endChar": 561
      },
      "content": "I can anticipate a user comment where we talk about building drones, but we don't actually mention the addition of a camera and a gimbal. I wonder how complicated it'd be to add that to the drone build and if it's unnecessarily complicated perhaps we use one of our perhaps we have a a drone platform used for testing so So, I think that's Anyway, I just don't want to like leave it hanging that we talk about this. A key component of the test is like manipulating a camera, but we may not add that to the drone that we're building. We can have other cameras. We already have two DJI cameras available. We could probably get a few more. And maybe we have a testing evaluation platform.",
      "author": "Kyle Nessen",
      "createdAt": "2026-07-27T22:26:26.677Z"
    },
    {
      "id": "bd221763-821f-46c9-b8ce-92f8a6a3002e",
      "anchor": {
        "text": "manual flight",
        "startLine": 42,
        "startChar": 106,
        "endLine": 42,
        "endChar": 119
      },
      "content": "Define manual flight here. Again, we don't want this to be an FPV class, but you know what is the most I think the model here is what is the most manual form of a drone that you could find in something like a Mavic or an Inspired Flight quadcopter?",
      "author": "Kyle Nessen",
      "createdAt": "2026-07-27T22:27:15.908Z"
    },
    {
      "id": "07609efc-eeff-4a0d-8485-2e657e9bfd52",
      "anchor": {
        "text": "closes with a short survey of the commercial applications the advanced courses",
        "startLine": 50,
        "startChar": 11,
        "endLine": 50,
        "endChar": 89
      },
      "content": "Instead of the course closing with the survey, and maybe that is like better, but I I would like a sampling of how drones are used in the field and showing off like some of the other drones they may encounter later on, you know, give them something to be excited about and look forward to. That is if time allows though. Uh but the core structure that we have here is um I think very competent.",
      "author": "Kyle Nessen",
      "createdAt": "2026-07-27T22:28:55.563Z"
    }
  ]
}
-->