// Drone Mapping and Photogrammetry - Course Curriculum
// Cuesta College Drone Program

#set document(title: "Drone Mapping and Photogrammetry Curriculum")
#set text(font: "Linux Libertine", size: 11pt)
#set par(justify: true)
#set heading(numbering: "1.1")

= Drone Mapping and Photogrammetry

== Course Overview

This course prepares students to conduct professional drone mapping operations, from mission planning through deliverable production. Students learn RTK positioning, ground control point methodology, photogrammetry processing, and data management workflows. The course emphasizes practical skills applicable to construction, surveying, environmental monitoring, and civil engineering contexts.

=== Prerequisites

AERO 100: Basic UAV Operator (or equivalent Part 107 certification with demonstrated flight proficiency)

=== Course Philosophy

The goal is providing students a foundation they can build on immediately, not comprehensive mastery of every tool. Students leave with practical skills applicable to entry-level positions while understanding pathways for deeper specialization. Adaptability between equipment platforms and software tools is emphasized over brand-specific training.

=== Target Students

- Surveyors and engineers adding drone capabilities to existing practice
- Environmental consultants seeking mapping skills
- GIS professionals expanding into field data collection
- Early career students pursuing mapping/surveying employment
- Construction professionals seeking site documentation skills

=== Learning Outcomes

Upon successful completion, students will be able to:

+ Plan and execute RTK-enabled drone mapping missions with survey-grade accuracy
+ Establish and document ground control point networks appropriate to project requirements
+ Process drone imagery into orthomosaics and elevation models using industry-standard software
+ Evaluate output quality and identify sources of error in photogrammetric products
+ Organize project data following professional archival standards
+ Produce deliverables meeting client and industry specifications

== Unit 1: Positioning Fundamentals

=== Learning Objectives

- Explain the relationship between GPS, GNSS, and RTK positioning
- Compare accuracy levels achievable with different positioning methods
- Operate base station and rover equipment for ground control surveys
- Configure and verify RTK connections using NTRIP corrections

=== Topics

==== Why Positioning Matters

Consumer drone GPS provides 2-5 meter horizontal accuracy, insufficient for professional mapping. RTK corrections achieve centimeter-level accuracy, enabling survey-grade deliverables. Students must understand this distinction and its implications for different project types.

==== GNSS Fundamentals

Overview of satellite constellations (GPS, GLONASS, Galileo, BeiDou). How receivers calculate position from satellite signals. Sources of positioning error and how corrections address them.

==== RTK Correction Methods

Local base station operation: when to use, setup procedures, range limitations. NTRIP network corrections: connecting to correction services, cellular requirements, coverage considerations. Comparison of methods for different field scenarios.

==== Coordinate Systems and Datums

Understanding why coordinate systems matter for deliverable accuracy. Common systems encountered in professional work (State Plane, UTM). Transformations between systems and when they are necessary.

=== Lab Activities

*Lab 1.1: Base Station Setup*
Students establish a base station over a known point, configure broadcast settings, and verify operation. Includes tripod leveling, antenna height measurement, and coordinate entry.

*Lab 1.2: NTRIP Configuration*
Students connect to California Real Time Network (CRTN) or similar service, configure mount points, and verify correction stream quality.

*Lab 1.3: Rover Survey Exercise*
Using RTK rover, students collect points on campus features and compare to known coordinates. Introduces survey pole technique and point collection workflows.

=== Equipment

- Emlid Reach RS4 base station
- Emlid Reach RX2 rover
- Survey tripod and bipod
- Tablet with survey software

== Unit 2: Ground Control Points

=== Learning Objectives

- Design GCP networks appropriate to project size and accuracy requirements
- Select and deploy appropriate target types for different conditions
- Survey GCP positions with centimeter-level accuracy
- Document GCP data for processing software import

=== Topics

==== GCP Theory

How ground control points improve photogrammetric accuracy. Relationship between GCP distribution and output quality. When GCPs are necessary versus when PPK/RTK-only workflows suffice.

==== Network Design

Minimum GCP requirements for different project sizes. Distribution patterns: perimeter, interior, and elevation variation coverage. Adjustments for terrain complexity and obstructions.

==== Target Selection and Deployment

Target types: painted markers, fabric targets, AeroPoints. Visibility considerations for flight altitude and lighting conditions. Permanent versus temporary installation methods. Marking and labeling conventions.

==== Survey Procedures

Point occupation techniques for maximum accuracy. Recording antenna height and point metadata. Quality checks and redundant measurements. Data export formats for processing software.

=== Lab Activities

*Lab 2.1: GCP Network Design*
Given a project area (campus site), students design GCP network considering access, visibility, terrain, and accuracy requirements. Peer review of designs.

*Lab 2.2: Target Deployment and Survey*
Students deploy targets according to their designs, survey positions with RTK rover, and document data for processing. Includes field conditions assessment.

*Lab 2.3: GCP Import and Verification*
Students import GCP data into processing software and verify proper georeferencing. Troubleshoot common import errors.

== Unit 3: Flight Planning and Execution

=== Learning Objectives

- Calculate appropriate flight parameters for project requirements
- Configure terrain-following missions for variable topography
- Assess weather and lighting conditions for optimal data collection
- Execute mapping missions with consistent image quality

=== Topics

==== Mission Parameters

Ground sample distance (GSD) and its relationship to altitude. Overlap percentages: front lap and side lap requirements for photogrammetry. Speed and altitude tradeoffs for image quality and coverage efficiency.

==== Terrain Following

Why constant-altitude flights fail in variable terrain. How terrain-following algorithms work. DEM sources for flight planning. When to use terrain following versus manual altitude adjustment.

==== Flight Planning Software

Mission planning workflows in DJI Pilot 2 and third-party applications. Area definition, parameter configuration, and preflight verification. Waypoint missions versus automated area mapping.

==== Weather and Lighting

Optimal lighting conditions for photogrammetry (diffuse light, consistent shadows). Wind limitations for stable image capture. Cloud shadow effects on radiometric consistency.

==== Field Execution

Pre-flight checklists and site safety assessment. Launch and recovery procedures for mapping missions. Monitoring mission progress and intervention procedures. Post-flight verification of image coverage.

=== Lab Activities

*Lab 3.1: Parameter Calculation Exercise*
Given project specifications (required GSD, accuracy, deliverables), students calculate appropriate flight parameters and justify their choices.

*Lab 3.2: Terrain-Following Mission*
Students plan and execute terrain-following mission over variable topography site, comparing results to constant-altitude capture of same area.

*Lab 3.3: Full Mapping Mission*
Complete mapping exercise including GCP deployment, RTK survey, flight execution, and preliminary quality check of captured imagery.

== Unit 4: Photogrammetry Processing

=== Learning Objectives

- Execute standard photogrammetry processing workflows
- Configure processing parameters for different output requirements
- Evaluate output quality and identify processing errors
- Generate professional deliverables (orthomosaic, DEM, contours)

=== Topics

==== Photogrammetry Fundamentals

Conceptual overview: how software reconstructs 3D geometry from 2D images. Structure from motion principles. Dense point cloud generation. Mesh and texture creation.

==== Processing Workflow

Image import and quality assessment. GCP import and marking. Alignment and optimization. Dense cloud generation. Mesh and orthomosaic export.

==== Software Platforms

*Cloud-based (DroneDeploy):* Advantages for quick turnaround and minimal hardware requirements. Subscription considerations for professional use.

*Desktop (Agisoft Metashape):* Greater control over processing parameters. Local processing capability. Industry standard for professional photogrammetry.

*Open source (OpenDroneMap/WebODM):* Cost-effective alternative. Community-supported development. Considerations for professional use.

==== Quality Assessment

Reprojection error interpretation. GCP residuals and what they indicate. Visual inspection for artifacts and errors. Comparison to known reference data.

=== Lab Activities

*Lab 4.1: Cloud Processing Introduction*
Students upload mission imagery to DroneDeploy, add GCPs, and generate orthomosaic. Evaluate results and export deliverables.

*Lab 4.2: Desktop Processing Workflow*
Full Metashape workflow from image import through orthomosaic export. Students document processing parameters and time requirements.

*Lab 4.3: Quality Comparison*
Students process same dataset with different software and parameter settings, comparing output quality, processing time, and file sizes.

== Unit 5: Elevation Products and Analysis

=== Learning Objectives

- Generate digital elevation models and digital surface models
- Understand the difference between DSM, DTM, and DEM products
- Create contour maps from elevation data
- Perform basic volumetric analysis

=== Topics

==== Elevation Model Types

Digital Surface Model (DSM): includes vegetation, structures, all surface features. Digital Terrain Model (DTM): ground surface only, vegetation removed. Use cases for each product type.

==== Contour Generation

Creating contour lines from elevation data. Interval selection based on terrain and application. Smoothing and labeling conventions.

==== Volumetric Analysis

Cut and fill calculations from elevation comparison. Stockpile volume measurement. Accuracy considerations for volumetric work.

==== Deliverable Formats

Common file formats (GeoTIFF, LAS, contour shapefiles). Coordinate system and projection considerations. Client delivery specifications.

=== Lab Activities

*Lab 5.1: Elevation Product Generation*
Students generate DSM and contour products from processed mapping data. Export in multiple formats.

*Lab 5.2: Volumetric Calculation*
Using stockpile or earthwork site, students calculate volumes and compare to reference measurements.

== Unit 6: Data Management and Professional Practice

=== Learning Objectives

- Organize project data following professional standards
- Document workflows for project reproducibility
- Prepare deliverables meeting client specifications
- Maintain equipment and software for reliable operations

=== Topics

==== Project Organization

Folder structure conventions for mapping projects. Naming conventions for flights, imagery, and outputs. Version control for processed products.

==== Documentation Standards

Flight logs and mission documentation. Processing parameter records. Quality assurance checklists. Client delivery documentation.

==== Archival Practices

What to keep: raw imagery, project files, final deliverables. Storage requirements and backup procedures. Long-term accessibility considerations.

==== Equipment Maintenance

Drone maintenance schedules and inspection procedures. RTK equipment care and calibration. Software updates and license management.

=== Lab Activities

*Lab 6.1: Project Documentation*
Students document a complete project from planning through delivery, creating professional-quality records suitable for employer or client files.

== Unit 7: Capstone Project

=== Objectives

Demonstrate mastery of course competencies through independent execution of complete mapping project.

=== Project Requirements

Students complete an independent mapping project including:

- Site assessment and project planning
- GCP network design and survey
- Mission planning and execution
- Processing and quality assessment
- Deliverable production (orthomosaic, DEM, contours)
- Professional documentation package

=== NEP Collaboration Option

Students may complete their capstone as part of the Morro Bay National Estuary Program collaboration, contributing to real restoration monitoring while gaining professional experience.

=== Evaluation Criteria

- Technical accuracy of deliverables
- Completeness of documentation
- Professional quality of final products
- Demonstrated understanding of workflow decisions

== Assessment Strategy

=== Formative Assessment

- Lab activity completion and quality
- Quiz assessments after each unit
- Practical skill demonstrations

=== Summative Assessment

- Written examination on concepts and procedures (30%)
- Lab practical examination (30%)
- Capstone project (40%)

== Equipment List

=== Program Equipment (Provided)

- DJI Matrice 4E mapping drone
- Emlid Reach RS4 base station
- Emlid Reach RX2 rover
- Survey tripod, bipod, and accessories
- GCP targets
- Processing workstations with Metashape licenses

=== Student Requirements

- Laptop capable of running processing software (recommended)
- Field notebook
- Appropriate outdoor clothing and footwear

== Software

=== Required

- DroneDeploy (cloud processing)
- Agisoft Metashape (desktop processing)
- Emlid Flow (RTK survey)

=== Recommended

- QGIS (GIS viewing and basic analysis)
- Google Earth Pro (visualization)

== Recommended Sequence

This course is designed for completion in one semester (16 weeks) with weekly 3-hour combined lecture/lab sessions:

- Weeks 1-2: Unit 1 (Positioning Fundamentals)
- Weeks 3-4: Unit 2 (Ground Control Points)
- Weeks 5-7: Unit 3 (Flight Planning and Execution)
- Weeks 8-10: Unit 4 (Photogrammetry Processing)
- Weeks 11-12: Unit 5 (Elevation Products and Analysis)
- Week 13: Unit 6 (Data Management)
- Weeks 14-16: Unit 7 (Capstone Project)
