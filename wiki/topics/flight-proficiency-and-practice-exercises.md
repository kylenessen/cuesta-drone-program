# Flight Proficiency and Practice Exercises

**Flight Proficiency and Practice Exercises** covers the standard way to measure small drone pilot skill and the drills that build it. The FAA Part 107 certificate tests aeronautical knowledge, not flying ability. The de facto standard for measuring the flying itself is the set of test methods developed at NIST, which reduce piloting to repeatable, scored tasks. AERO 100 uses these tests as its capstone, requiring completion of the NIST Level 2 open test lane within 25 minutes, so understanding what the tests measure and how to train for them matters for both instruction and assessment.

## The NIST Standard Test Methods for Small UAS

The test methods come from the Standard Test Methods for Response Robots program at NIST's Intelligent Systems Division, led by Adam Jacoff. The program builds measurable, reproducible tests so that robot capabilities and operator proficiency can be compared objectively, and it extended its ground robot work to small unmanned aircraft under 55 pounds. The resulting methods are being standardized through ASTM International's E54.09 subcommittee on response robots, with sponsorship led by the Department of Homeland Security Science and Technology Directorate [1] [2]. The original motivation was emergency response. Agencies needed a way to know whether a given aircraft and pilot could actually perform before trusting them on a search or a hazmat scene. The same properties that make the tests useful for public safety credentialing, cheap apparatus, embedded scoring, and repeatability, make them useful for coursework.

The methods are organized into levels of increasing difficulty. NIST describes Level 1 as basic proficiency, Level 2 as maneuvering trials, Level 3 as open test lanes and scorable scenarios, Level 4 as an obstructed test lane, and Level 5 as a confined test lane [2]. NIST's own pages label the levels somewhat inconsistently between documents, and the level definitions below follow the Open Test Lane page. For program purposes, though, the question is settled: the approved AERO 100 Course Outline of Record adopts the NIST Open Test Lane Level 2 course, flown within the NIST-prescribed time limit of 25 minutes, as the course's second student learning outcome, so that standard, not any particular NIST page's level taxonomy, is the anchor for course documents [7]. The same outline fixes the course's required text as David Ison's The Complete Remote Pilot (3rd edition, Aviation Supplies & Academies, 2025), which carries the knowledge half of the course while the lane carries the flying half [7].

## The Open Test Lane and its scoring

The flying half of AERO 100 is measured on the [NIST Open Test Lane](../exams/nist-open-test-lane.md), a line of omni bucket stands flown as five defined paths, Position, Traverse, Orbit, Spiral, and Recon, that between them exercise every combination of aircraft orientation and camera pointing a mapping or inspection pilot will use [3] [4]. The apparatus is built to a NIST fabrication guide from white 7.5 liter (2 gallon) buckets whose openings face different directions, so the pilot must fly to a precise position and heading to look straight into each bucket and resolve the target inside [3] [4]. Scoring is embedded in the targets. A trial holds 20 targets, each with five increasingly small features to identify, for up to 100 points, and the features the camera legibly captures convert directly into score [3].

The course adopts the lane at Level 2, which adds camera work to the pure positioning of Level 1. At each bucket the pilot must pan, tilt, zoom, focus, and control exposure on lanes with alternating white and black buckets, so Level 2 is a combined test of stick skill and camera operation under a clock, mapping directly onto real mapping and inspection work [3]. NIST typically times a trial around 20 minutes so it fits one battery, and the AERO 100 requirement of the Level 2 lane in 25 minutes sits close to that standard with a small allowance [3]. The full method, level taxonomy, apparatus, and aircraft requirements are documented in [NIST Open Test Lane](../exams/nist-open-test-lane.md), and the compact three-stand version used as a standalone credential is [Basic Proficiency Evaluation for Remote Pilots](../exams/basic-proficiency-evaluation-for-remote-pilots.md).

## Practice progressions

The lane rewards specific, trainable skills, and a sensible progression builds them in order. Hover holds come first. The pilot holds position and altitude at a fixed point, first with GPS stabilization and then, as skills mature, in attitude or manual modes where the aircraft drifts. Hovering is the substrate of every other skill, and drift correction teaches the small, continuous inputs that separate smooth pilots from reactive ones.

Box patterns come next. The pilot flies a square at constant altitude, holding heading constant on all four legs so two legs are flown sideways and one backward. This forces control of translation independent of where the nose points. Circles and orbits follow, keeping the camera on a center point while translating around it, which requires coordinated yaw and roll inputs and is exactly the skill the NIST Orbit test scores.

Figure eights combine left and right turning circles in one continuous pattern, exposing the pilot's weaker turning direction and training smooth control reversals through the crossover. Nose-in orientation work then attacks the classic failure mode, control reversal when the aircraft faces the pilot and left on the sticks becomes right in the pilot's view. Hovering and flying simple patterns nose-in until corrections become automatic is what makes a pilot orientation proof rather than dependent on flying nose-out.

Target centering drills close the progression by adding the camera task. The pilot positions the aircraft to center a small target in the frame, then adds zoom, focus, and exposure adjustments, then adds a clock. This is a direct rehearsal of the Level 2 bucket task, and it teaches the discipline of stabilizing the aircraft first and operating the payload second. Running full timed lane trials, tracked by score and time across the course, then gives objective evidence of progress, which is the point of using a standard test method in the first place [1].

## Dynamic reaction training

Everything above is choreographed. The pilot knows the sequence before takeoff and rehearses it until it is smooth, which is exactly right for building mechanics but leaves out a skill real work demands constantly: replanning in flight when the target changes. Search work, incident response, and even routine inspection all involve a call over the radio that moves the objective mid-battery. A reaction course trains this by making the next target unknown. Programmable light pods are scattered across the flight area on stands, buckets, or landing pads, and when a pod lights, the pilot must fly to it, stabilize, and put it in the center of the frame before the next one fires, so route planning happens on the sticks rather than on the ground. Commercial app-controlled reaction training pods built for sports run about $350 to $440 for a six-pod kit with a randomizing app [8], which fits comfortably inside the program's roughly $500 materials budget for training targets, and the full activity design, including scoring and progressions, is worked out in [Dynamic Reaction Course](../activities/dynamic-reaction-course.md).

## A check-ride around the lane

The lane is also the apparatus behind the industry's main third party flight check. The [AUVSI Trusted Operator Program](../exams/auvsi-trusted-operator-program.md) requires an in-person Practical Flight Assessment at its upper levels, and Embry-Riddle delivers that assessment on apparatus built to NIST standards, with flight standards drawn from ASTM F3266, the standard guide for remote pilot training [5] [6]. AERO 100's NIST Level 2 capstone therefore already contains the flying half of a professional flight assessment, which is useful validation for the capstone choice.

What the Trusted Operator assessment adds around the lane is the check-ride framing, and that framing is worth borrowing as the capstone matures. In a TOP style assessment the scored flight is one element inside a larger evaluation. Candidates complete a preflight risk assessment of the site and aircraft on a written form, present a logbook and documentation for review, demonstrate ground control station operations, and execute an autonomous mission in addition to flying manual maneuvers [5]. Dressed this way, the capstone becomes a rehearsal for professional flight evaluation rather than a timed game: the student briefs the site, documents the aircraft, flies the lane for score, then hands the examiner a defensible paper trail. Each added element is cheap to run and directly mirrors what employers' flight programs and third party assessors actually check.

## Related

- [NIST Open Test Lane](../exams/nist-open-test-lane.md) for the full test method, levels, apparatus, and scoring behind this training.
- [Basic Proficiency Evaluation for Remote Pilots](../exams/basic-proficiency-evaluation-for-remote-pilots.md) for the compact credential test these drills also prepare students for.
- [Part 107 Knowledge Test](../exams/part-107-knowledge-test.md) for the knowledge half of AERO 100's outcomes.
- [AUVSI Trusted Operator Program](../exams/auvsi-trusted-operator-program.md) for the certification standard whose flight assessment shares this apparatus.
- [Field Operations Best Practices](field-operations-best-practices.md) for the operational habits built on these stick skills.
- [Camera Exposure](camera-exposure.md) for the exposure control the Level 2 lane tests.
- [NIST Open Lane Practice Sessions](../activities/nist-open-lane-practice.md) for the recurring lab session built around the lane.
- [Precision Maneuvering Drills](../activities/precision-maneuvering-drills.md) for the drill progression as a runnable lab activity.
- [Dynamic Reaction Course](../activities/dynamic-reaction-course.md) for the randomized-target course design.
- [UAV Flight Operations](uav-flight-operations.md) walks the flight phase by phase that these drills polish.

## Citations

[1] NIST, Standard Test Methods for Response Robots. https://www.nist.gov/el/intelligent-systems-division-73500/standard-test-methods-response-robots
[2] NIST, Aerial Drone Tests (Standard Test Methods for Response Robots). https://www.nist.gov/el/intelligent-systems-division-73500/standard-test-methods-response-robots/aerial-drone-tests
[3] NIST, Level 1-3 Open Test Lane and Scenarios. https://www.nist.gov/el/intelligent-systems-division-73500/level-1-3-open-test-lane-and-scenarios
[4] NIST, sUAS Open Test Lane Fabrication Guide (v2020B). https://www.nist.gov/system/files/documents/2023/09/19/NIST%20sUAS%20Open%20Test%20Lane%20-%20Fabrication%20Guide%20(v2020B).pdf
[5] Embry-Riddle Professional Education, TOP Level 2 in association with AUVSI (sUAS 4000L2). https://www.enrole.com/erau/jsp/course.jsp?categoryId=5523A9B8&courseId=SUAS-4000L2
[6] Embry-Riddle Professional Education, TOP Level 3 in association with AUVSI (sUAS 4000L3). https://www.enrole.com/erau/jsp/course.jsp?courseId=SUAS-4000L3
[7] [AERO 100 Course Outline](../sources/aero-100-course-outline.md), student learning outcome 2 and required text.
[8] BlazePod Trainer Kit (six pods, charging base, and app). https://www.blazepod.com/products/trainer-kit
