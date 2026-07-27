# NIST Open Test Lane

The **NIST Open Test Lane** is a standardized, self-scoring flight test that measures how precisely a remote pilot can position, orient, and aim a small drone. It is one of the Standard Test Methods for Small Unmanned Aircraft Systems developed at the National Institute of Standards and Technology, and it works by having the pilot fly a line of bucket-shaped targets and capture a legible image inside each one, so the score falls directly out of what the camera could resolve rather than out of a judge's opinion [1] [2]. It matters to this program because AERO 100 adopts the Open Test Lane at Level 2, flown within a 25 minute limit, as the flight half of the course, the practical "driver's license" a student must pass [3]. The scored run uses the program's camera-equipped aircraft, and the student-built drone flies the same lane to prove the build.

This page documents the test method itself: its apparatus, the flight paths, the difficulty levels, and how it is scored. The recurring lab that runs it is [NIST Open Lane Practice Sessions](../activities/nist-open-lane-practice.md), the stick-skill drills that feed it are in [Precision Maneuvering Drills](../activities/precision-maneuvering-drills.md), and the wider training context is [Flight Proficiency and Practice Exercises](../topics/flight-proficiency-and-practice-exercises.md).

## Origin and standardization

The Open Test Lane comes from the Standard Test Methods for Response Robots program at NIST's Intelligent Systems Division, which builds measurable, reproducible tests so that a machine's capability and an operator's proficiency can be compared objectively [4]. The program began with ground robots for emergency response and extended the same philosophy to unmanned aircraft under 55 pounds [2]. The methods are being standardized through ASTM International's E54.09 subcommittee on homeland security applications and response robots, with sponsorship led by the Department of Homeland Security Science and Technology Directorate [2] [4]. The original problem was trust. An agency needed to know, before an incident, whether a given pilot and aircraft could actually perform, and the test lane answers that question with a number. The properties that made it useful for public safety, cheap apparatus, embedded scoring, and repeatability, are the same properties that make it work as coursework.

## The apparatus

The lane is a straight line of omni bucket stands set in an open area. Each stand is an A-frame carrying several white 7.5 liter (2 gallon) buckets whose open ends face different directions, with a printed sticker target fixed inside each bucket [2] [5]. Because the openings point different ways, the pilot cannot resolve a target by hovering in one spot. The aircraft must be flown to the specific position and heading from which the camera looks straight into that bucket, which is what turns the lane into a test of precise control rather than of steady hovering [2]. A full lane is four stands and twenty buckets, and it scales by stand spacing, commonly 3 meters or 6 meters, so the same course fits inside a basketball court for a small aircraft or an open field for a larger one [2] [5]. Versions that alternate white and black buckets add an exposure-control demand, since a camera metered for a white target will underexpose a black one [2].

The apparatus is deliberately cheap and buildable. A documented build of the four-stand lane came in just under $250 in hardware-store materials, with the buckets the largest line item, assembled in a few hours with a miter saw and basic carpentry [6]. The construction details are specified in NIST's fabrication guide, and the runnable build for this program is written up in [NIST Open Lane Practice Sessions](../activities/nist-open-lane-practice.md) [5].

## The five flight paths

A lane is flown as five defined paths, each isolating a different combination of aircraft motion and camera pointing [2] [5]. The Position test holds and maneuvers the aircraft along the lane centerline at defined altitudes. The Traverse test flies sideways ovals around the stands. The Orbit test circles a stand while keeping the camera fixed on it. The Spiral, or Inspect, test descends around a stand to view its target from progressively closer and steeper angles. The Recon test flies straight and level down the centerline with capture checks during acceleration and deceleration. Together the five paths exercise essentially every orientation and camera angle a working inspection or mapping pilot uses, which is why time on the lane transfers directly to real operational skill.

## Levels of difficulty

The test methods are organized into levels of increasing difficulty. NIST describes Level 1 as basic proficiency, Level 2 as maneuvering, Level 3 as the open test lanes and scorable scenarios, Level 4 as an obstructed lane, and Level 5 as a confined lane [2] [7]. The level labels are applied inconsistently across NIST's own documents, so the safest anchor for course purposes is the specific requirement the program adopted rather than any single page's taxonomy [3].

For the lane itself, the practical distinction is between Level 1 and Level 2. Level 1 uses all-white buckets and no camera zoom. The pilot flies the paths and captures an alignment image straight into each bucket, which measures pure positioning and orientation control [2]. Level 2 adds payload functionality. At each bucket the pilot must pan, tilt, zoom, focus, and control exposure to capture a maximum-zoom image of the target, on lanes with alternating white and black buckets [2]. Level 2 is therefore a combined test of stick skill and camera operation under a clock, which maps closely onto mapping and inspection work. The higher obstructed and confined lanes add physical obstacles and enclosure and are relevant to advanced or public safety operations rather than to the AERO 100 capstone.

## Scoring

Scoring is embedded in the targets, so grading is counting rather than judgment. A trial contains 20 targets, and each target carries five increasingly small features to identify, giving up to 100 points for a complete trial [2]. The pilot earns points for the features the camera legibly captured, so alignment precision and image quality convert directly into score. NIST typically sets a trial time limit around 20 minutes so a trial fits inside one battery and pilots can be compared on both completeness and efficiency [2]. NIST recommends no pass mark of its own and leaves the passing benchmark to whoever administers the test, so a program can grade on precision with a generous time ceiling rather than on speed; that choice is developed in [Flight Proficiency Assessment Models](../analysis/flight-proficiency-assessment-models.md). The compact three-stand entry version of this scoring, used as a standalone credential test, is documented separately in [Basic Proficiency Evaluation for Remote Pilots](basic-proficiency-evaluation-for-remote-pilots.md).

## Aircraft requirements

The lane is largely aircraft-agnostic, which is part of its value for a build course. Levels 1 and 2 work with most small camera drones, and only the higher levels impose real equipment floors. Colorado State University's Drone Center, which administers Levels 1 through 3, requires a camera with strong zoom, at least twenty-eight times, and simultaneous flight-and-camera control for its Level 3 test [8]. Nothing in the method sets a weight class, so the capstone does not force a particular airframe size.

That weight freedom carries a teaching consequence worth recording. A build kept under 250 grams is exempt from FAA aircraft registration and from the [Remote Identification](../regulations/remote-identification.md) broadcast requirement, while a build at 250 grams or more triggers both [7]. Because the lane scores the same at any weight, the program can choose the build's weight class for its curriculum value rather than to satisfy the test. A heavier build brings [Drone Registration](../regulations/drone-registration.md) and Remote ID into scope as hands-on content students must actually comply with, turning two regulatory topics from lecture material into lived procedure. That tradeoff is a build-design decision, flagged here because the test method is what makes it a free choice.

## Use in AERO 100

AERO 100 uses the Level 2 lane flown within 25 minutes as its second student learning outcome, the flight-skills counterpart to the [Part 107 Knowledge Test](part-107-knowledge-test.md) that carries the knowledge outcome [3]. The 25 minute allowance sits close to NIST's typical 20 minute trial timing with a small margin [2] [3]. The same apparatus underlies the flight assessment in the [AUVSI Trusted Operator Program](auvsi-trusted-operator-program.md), so lane time also counts toward an industry check-ride, and the credential ecosystem built on these tests is surveyed in [NIST Flight Proficiency Programs](../analysis/nist-flight-proficiency-programs.md) [7].

## Related

- [Basic Proficiency Evaluation for Remote Pilots](basic-proficiency-evaluation-for-remote-pilots.md) for the compact three-stand version used as a standalone credential.
- [NIST Open Lane Practice Sessions](../activities/nist-open-lane-practice.md) for the runnable lab that builds and flies the lane.
- [Flight Proficiency and Practice Exercises](../topics/flight-proficiency-and-practice-exercises.md) for the training progression and drills behind the test.
- [NIST Flight Proficiency Programs](../analysis/nist-flight-proficiency-programs.md) for the programs that run this test as a credential.
- [AUVSI Trusted Operator Program](auvsi-trusted-operator-program.md) for the industry flight assessment flown on the same apparatus.
- [Part 107 Knowledge Test](part-107-knowledge-test.md) for the knowledge half of AERO 100's outcomes.
- [Remote Identification](../regulations/remote-identification.md) and [Drone Registration](../regulations/drone-registration.md) for the rules a build at or above 250 grams brings into the course.

## Citations

[1] NIST, Standard Test Methods for Small Unmanned Aircraft Systems (Forms Book, 2020B13). https://www.nist.gov/system/files/documents/2022/04/12/NIST%20sUAS%20Open%20Tests%20-%20Forms%20Book%20(2020B13).pdf
[2] NIST, Level 1-3 Open Test Lane and Scenarios. https://www.nist.gov/el/intelligent-systems-division-73500/level-1-3-open-test-lane-and-scenarios
[3] [AERO 100 Course Outline](../sources/aero-100-course-outline.md), student learning outcome 2 and the UAV Flight Operations topic.
[4] NIST, Standard Test Methods for Response Robots. https://www.nist.gov/el/intelligent-systems-division-73500/standard-test-methods-response-robots
[5] NIST, sUAS Open Test Lane Fabrication Guide (v2020B). https://www.nist.gov/system/files/documents/2023/09/19/NIST%20sUAS%20Open%20Test%20Lane%20-%20Fabrication%20Guide%20(v2020B).pdf
[6] Jim Moore, "Thumbs Up," AOPA Pilot, July 2021 (documented build of the NIST open test lane). https://www.aopa.org/news-and-media/all-news/2021/july/pilot/thumbs-up
[7] FAA, Register Your Drone. https://www.faa.gov/uas/getting_started/register_drone
[8] CSU Drone Center, NIST UAV Operator Certification. https://dronecenter.colostate.edu/nist-uav-certification/
