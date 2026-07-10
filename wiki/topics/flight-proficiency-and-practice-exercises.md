---
type: Topic
title: Flight Proficiency and Practice Exercises
description: The NIST Standard Test Methods for Small UAS, including the Open Test Lane and its scoring, plus practice progressions that build the stick skills the tests measure.
tags: [field-operations]
acs_area: general
status: needs-review
timestamp: 2026-07-09T18:00:00Z
---

# Flight Proficiency and Practice Exercises

**Flight Proficiency and Practice Exercises** covers the standard way to measure small drone pilot skill and the drills that build it. The FAA Part 107 certificate tests aeronautical knowledge, not flying ability. The de facto standard for measuring the flying itself is the set of test methods developed at NIST, which reduce piloting to repeatable, scored tasks. AERO 100 uses these tests as its capstone, requiring completion of the NIST Level 2 open test lane within 25 minutes, so understanding what the tests measure and how to train for them matters for both instruction and assessment.

## The NIST Standard Test Methods for Small UAS

The test methods come from the Standard Test Methods for Response Robots program at NIST's Intelligent Systems Division, led by Adam Jacoff. The program builds measurable, reproducible tests so that robot capabilities and operator proficiency can be compared objectively, and it extended its ground robot work to small unmanned aircraft under 55 pounds. The resulting methods are being standardized through ASTM International's E54.09 subcommittee on response robots, with sponsorship led by the Department of Homeland Security Science and Technology Directorate [1] [2]. The original motivation was emergency response. Agencies needed a way to know whether a given aircraft and pilot could actually perform before trusting them on a search or a hazmat scene. The same properties that make the tests useful for public safety credentialing, cheap apparatus, embedded scoring, and repeatability, make them useful for coursework.

The methods are organized into levels of increasing difficulty. NIST describes Level 1 as basic proficiency, Level 2 as maneuvering trials, Level 3 as open test lanes and scorable scenarios, Level 4 as an obstructed test lane, and Level 5 as a confined test lane [2]. NIST's own pages label the levels somewhat inconsistently between documents, so the level definitions below follow the Open Test Lane page and should be verified against the current NIST materials before being quoted in course documents.

## The Open Test Lane

The open test lane is a line of simple stands in an open area, sized so the same course scales from a basketball court to an outdoor field depending on aircraft size, with stand spacings of 3 m or 6 m in common configurations [3]. Each stand holds an omni bucket target, built from white 7.5 liter (2 gallon) buckets with printed sticker targets inside. Because the bucket openings face different directions, the pilot must position and orient the aircraft precisely to look straight into each bucket and resolve the target [3]. Versions with alternating white and black buckets add exposure control demands, since a camera metering for a white bucket will underexpose a black one [3].

The lane is flown as five defined flight paths. The Position test requires hovering and maneuvering along the lane centerline at defined altitudes. The Traverse test flies sideways ovals around stands. The Orbit test circles a stand while keeping the camera on it. The Spiral or Inspect test descends around stands for close inspection from varied angles. The Recon test flies straight and level along the centerline with checks during acceleration and deceleration [4]. Together they exercise every combination of aircraft orientation and camera pointing a mapping or inspection pilot will use.

## Level 1 versus Level 2 and scoring

Level 1 maneuvering uses all white buckets and no camera zoom. The pilot flies the paths and captures alignment images straight into each bucket, which measures pure positioning and orientation control [3]. Level 2 adds payload functionality. At each bucket the pilot must pan, tilt, zoom, focus, and control exposure to capture a maximum zoom image of the target, on lanes with alternating white and black buckets [3]. Level 2 is therefore a combined test of stick skills and camera operation under time pressure, which maps directly onto real mapping and inspection work.

Scoring is embedded in the targets. A trial contains 20 targets, and each target has five increasingly small features to identify, giving up to 100 points for a complete trial [3]. Scoring counts the features the pilot legibly captured, so precision of alignment and image quality convert directly into points. NIST typically sets trial time limits around 20 minutes so a trial fits one battery and pilots can be compared on both completeness and efficiency [3]. The AERO 100 requirement of the Level 2 lane in 25 minutes sits close to that standard timing with a small allowance.

## Practice progressions

The lane rewards specific, trainable skills, and a sensible progression builds them in order. Hover holds come first. The pilot holds position and altitude at a fixed point, first with GPS stabilization and then, as skills mature, in attitude or manual modes where the aircraft drifts. Hovering is the substrate of every other skill, and drift correction teaches the small, continuous inputs that separate smooth pilots from reactive ones.

Box patterns come next. The pilot flies a square at constant altitude, holding heading constant on all four legs so two legs are flown sideways and one backward. This forces control of translation independent of where the nose points. Circles and orbits follow, keeping the camera on a center point while translating around it, which requires coordinated yaw and roll inputs and is exactly the skill the NIST Orbit test scores.

Figure eights combine left and right turning circles in one continuous pattern, exposing the pilot's weaker turning direction and training smooth control reversals through the crossover. Nose-in orientation work then attacks the classic failure mode, control reversal when the aircraft faces the pilot and left on the sticks becomes right in the pilot's view. Hovering and flying simple patterns nose-in until corrections become automatic is what makes a pilot orientation proof rather than dependent on flying nose-out.

Target centering drills close the progression by adding the camera task. The pilot positions the aircraft to center a small target in the frame, then adds zoom, focus, and exposure adjustments, then adds a clock. This is a direct rehearsal of the Level 2 bucket task, and it teaches the discipline of stabilizing the aircraft first and operating the payload second. Running full timed lane trials, tracked by score and time across the course, then gives objective evidence of progress, which is the point of using a standard test method in the first place [1].

## Related

- [Part 107 Knowledge Test](/exams/part-107-knowledge-test.md) for the knowledge half of AERO 100's outcomes.
- [Field Operations Best Practices](/topics/field-operations-best-practices.md) for the operational habits built on these stick skills.
- [Camera Exposure](/topics/camera-exposure.md) for the exposure control the Level 2 lane tests.

## Citations

[1] NIST, Standard Test Methods for Response Robots. https://www.nist.gov/el/intelligent-systems-division-73500/standard-test-methods-response-robots
[2] NIST, Aerial Drone Tests (Standard Test Methods for Response Robots). https://www.nist.gov/el/intelligent-systems-division-73500/standard-test-methods-response-robots/aerial-drone-tests
[3] NIST, Level 1-3 Open Test Lane and Scenarios. https://www.nist.gov/el/intelligent-systems-division-73500/level-1-3-open-test-lane-and-scenarios
[4] NIST, sUAS Open Test Lane Fabrication Guide (v2020B). https://www.nist.gov/system/files/documents/2023/09/19/NIST%20sUAS%20Open%20Test%20Lane%20-%20Fabrication%20Guide%20(v2020B).pdf
