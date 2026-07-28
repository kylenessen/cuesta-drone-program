# AERO 110: Advanced Drone Mapping and Remote Sensing

Draft course outline for advisory committee review
Kyle Nessen, July 2026

This course prepares drone pilots for commercial mapping work. Students enter with the FAA Remote Pilot Certificate and demonstrated flight proficiency from AERO 100, the program's intro course. AERO 110 teaches them to turn drone photographs into spatial data a client can measure and trust. The central product is the color orthomosaic, a single georeferenced aerial map assembled from hundreds of overlapping photos. It is the most requested deliverable in commercial drone mapping, and most other products come from the same workflow.

A good map depends on a chain of decisions that starts at the camera sensor and ends at the delivered file. This course teaches the whole chain. Our goal is a graduate who can plan, fly, process, validate, and deliver a mapping project without supervision. This outline is our best attempt to anticipate what the work requires, so please tell us where it can be improved.

We propose the course as three units over one semester, with in-person lecture and lab.

## Sensors and image quality

A map is only as good as the pixels underneath it. This unit covers the physics and camera craft that produce mapping-grade images before any software touches them.

- Remote sensing foundations: the electromagnetic spectrum, how a sensor turns light into numbers, and the payload landscape from RGB cameras to LiDAR
- Cameras for mapping: mechanical versus electronic shutter, sensor size, and why camera choice constrains map quality
- Exposure in flight: shutter speed, aperture, and ISO, and the motion blur limit a moving aircraft imposes
- Ground sample distance: the resolution formula that connects flight altitude to the detail a client needs
- Lighting and sun angle: shadows, overcast, hotspots, and glint, and how to schedule flights around them

## Positioning and accuracy

A drone map can look beautiful and still sit meters away from its true position. Survey-grade positioning is what separates professional mapping from casual mapping, and it carries the largest share of hands-on field work in the course.

- GNSS fundamentals, and why a standalone receiver produces a meter-level map
- RTK positioning with base and rover: network corrections, fix versus float, and survey technique with pole and bipod
- Coordinate systems, map projections, and vertical datums, including the datum mistakes that shift a map by 30 meters
- Ground control points and checkpoints: target placement, network design, and field survey procedure
- Accuracy validation: RMSE reporting against independent checkpoints under the ASPRS Positional Accuracy Standards

## Planning and flying the mission

Mapping flights are automated, but the plan behind them is not. Students learn to design a mission around the deliverable and to run a disciplined field day.

- Mission design: overlap, altitude, speed, and capture rate, balanced against site conditions and battery endurance
- Terrain following over the varied topography of San Luis Obispo County
- Mission planning software, and the pilot's job of supervising an automated flight and intervening safely
- Field operations: checklists, go/no-go judgment, and in-field image checks that catch problems before the crew leaves the site
- Field power management: batteries, charging, and power stations across a full mapping day

## Processing and deliverables

Students process their own imagery into the products clients pay for, and they learn to judge the output critically.

- Structure from motion concepts, taught so software settings become decisions instead of defaults
- Orthomosaic generation: orthorectification, the common artifacts, and how to recognize and repair them
- Elevation models: surface versus terrain models, contours, and stockpile volumetrics
- Photogrammetry software: desktop processing in Agisoft Metashape, cloud processing in DroneDeploy, and open-source alternatives
- Data management: project structure, archiving, flight logs, and delivering files in the formats clients use
- LiDAR concepts: where active laser mapping takes over when photogrammetry reaches its limits

## Multispectral imaging and agriculture

The same mapping workflow, flown with a multispectral sensor, serves the agricultural market on the Central Coast. This unit extends the course foundations into crop sensing.

- Multispectral imaging: NDVI, the red edge, and how greenness is actually measured
- Vegetation indices and the honest limits of their interpretation
- Field practice: calibration panels, band registration, and when multispectral beats a standard camera
- Agricultural applications: crop scouting, stand counts, irrigation and water stress, and nutrient management
- Prescription maps: turning an index map into management zones in a file a tractor can run

## The business of mapping

Students step into a commercial landscape with real economics and real legal boundaries. This unit prepares them to scope, price, and decline work intelligently.

- The products clients buy and the decisions they feed, across construction, agriculture, environmental monitoring, and local government
- Change detection and repeat mapping for monitoring programs
- The limits of photogrammetry, and when to recommend another tool instead
- Mission cost analysis: mobilization-dominated costs, estimating, insurance, and pricing
- The legal boundary with licensed surveying under California's Professional Land Surveyors' Act
- NDAA compliance and the federal restrictions that shape platform choice on government work

## Capstone and certification

The course ends with an independent mapping project that mirrors a real job. Each student assesses a site, estimates the cost, surveys ground control, flies the mission, processes the data, validates accuracy, and delivers a professional documentation package.

The course content aligns with the body of knowledge tested by the ASPRS Certified UAS Technologist credential. ASPRS is the professional society that publishes the mapping industry's accuracy standards. The full credential requires three years of work experience, so it is a post-graduation pursuit rather than a course requirement. The ASPRS intern pathway lets a current student sit the exam early and convert it once the experience accumulates.

## Equipment

- DJI Matrice 4E mapping aircraft, already secured for the program: mechanical shutter and onboard RTK, consistent with commercial practice
- Emlid Reach RS4 base station and RX2 rover for ground control and checkpoint surveys
- A multispectral sensor and calibration panels for the agricultural unit
- A computer lab with workstations capable of photogrammetry processing

## Where this leads

Graduates leave with a portfolio of accuracy-validated deliverables and the judgment behind them. The employment paths include construction and survey firms, agricultural service providers, environmental consultancies, and public agencies. We ask the committee to check this outline against the work you hire for. Which deliverables do your clients buy, which software should students touch first, and what makes an entry-level mapper productive in the first month? Your answers will shape the course before it reaches the curriculum office.
