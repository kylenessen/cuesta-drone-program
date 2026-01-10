// Thermal Imaging and Applied Inspection - Course Curriculum
// Cuesta College Drone Program

#set document(title: "Thermal Imaging and Applied Inspection Curriculum")
#set text(font: "Linux Libertine", size: 11pt)
#set par(justify: true)
#set heading(numbering: "1.1")

= Thermal Imaging and Applied Inspection

== Course Overview

This course prepares students to conduct professional drone-based thermal imaging and inspection operations. Students learn infrared theory, thermal camera operation, data interpretation, and inspection workflows for both infrastructure and public safety applications. The course emphasizes practical skills transferable across utility inspection, building assessment, solar panel evaluation, and emergency response contexts.

=== Prerequisites

AERO 100: Basic UAV Operator (or equivalent Part 107 certification with demonstrated flight proficiency)

=== Course Philosophy

Thermal imaging unifies two major employment sectors: infrastructure inspection and public safety operations. While the application contexts differ, the core technical skills transfer directly between them. Students gain flexibility to pursue either career pathway, or to work across both sectors as opportunities arise. The curriculum prepares students for Level 1 thermography certification while emphasizing drone-specific operational considerations.

=== Target Students

- Utility and energy sector workers adding drone inspection skills
- Firefighters, police officers, and SAR personnel seeking thermal drone proficiency
- Home inspectors expanding into drone-based assessment
- Building envelope and roofing professionals
- Early career students pursuing inspection or public safety employment

=== Learning Outcomes

Upon successful completion, students will be able to:

+ Explain infrared theory and heat transfer principles relevant to thermal imaging
+ Configure thermal cameras for optimal image quality across varied conditions
+ Interpret thermal imagery to identify anomalies and document findings
+ Plan and execute thermal inspection missions for infrastructure assets
+ Apply thermal imaging techniques to search and rescue and fire assessment scenarios
+ Produce professional inspection reports with appropriate thermal documentation
+ Implement safety protocols for operations near energized equipment and emergency scenes

== Unit 1: Infrared Theory and Thermal Physics

=== Learning Objectives

- Explain the electromagnetic spectrum and infrared radiation
- Describe the three mechanisms of heat transfer
- Define emissivity, reflectance, and transmittance
- Identify factors affecting thermal image quality and accuracy

=== Topics

==== Electromagnetic Spectrum

Visible light versus infrared radiation. Infrared wavebands: short-wave, mid-wave, and long-wave. What thermal cameras actually detect. Atmospheric transmission windows.

==== Heat Transfer Mechanisms

*Conduction:* Heat transfer through direct contact. Thermal conductivity of common materials. Implications for building and equipment inspection.

*Convection:* Heat transfer through fluid (air) movement. Natural versus forced convection. Wind effects on thermal signatures.

*Radiation:* Heat transfer through electromagnetic waves. All objects above absolute zero emit infrared radiation. Stefan-Boltzmann law and practical implications.

==== Surface Properties

*Emissivity:* Ratio of actual radiation to theoretical blackbody radiation. High-emissivity versus low-emissivity materials. Why emissivity matters for temperature measurement.

*Reflectance:* Surfaces reflecting thermal radiation from other sources. Apparent temperatures versus actual temperatures. Identifying reflected thermal sources.

*Transmittance:* Materials that pass infrared radiation. Atmospheric effects. Lens materials and their properties.

==== Environmental Factors

Ambient temperature effects on thermal contrast. Solar loading and thermal lag. Wind cooling effects. Humidity and atmospheric absorption.

=== Lab Activities

*Lab 1.1: Emissivity Demonstration*
Students measure apparent temperature of various materials at known actual temperatures, demonstrating emissivity effects. Includes metals, painted surfaces, and organic materials.

*Lab 1.2: Reflection Identification*
Using thermal camera indoors, students identify and document thermal reflections from various surfaces. Practice distinguishing real thermal anomalies from reflections.

== Unit 2: Thermal Camera Operation

=== Learning Objectives

- Configure thermal camera settings for different inspection scenarios
- Optimize image quality through proper level and span adjustment
- Select appropriate color palettes for specific applications
- Operate drone-mounted thermal imaging systems

=== Topics

==== Thermal Camera Fundamentals

Detector types: cooled versus uncooled. Resolution and field of view tradeoffs. Frame rate considerations for different applications. Spectral response and filtering.

==== Range and Level Settings

Understanding temperature range (span) and level (center point). Effects of improper settings on image quality. Auto versus manual adjustment. When to use each mode.

==== Color Palettes

Standard palettes: White Hot, Black Hot, Iron, Rainbow. Application-specific palette selection. High contrast versus full dynamic range. Public safety versus inspection conventions.

==== DJI Matrice 4T Operations

Thermal payload specifications and capabilities. Split-screen and PIP display modes. Zoom functions for thermal and visible cameras. Recording options and file formats. FPV versus inspection flying techniques.

==== Image and Video Capture

Still image versus video recording decisions. Radiometric data preservation. File format considerations for post-processing. Storage and data management.

=== Lab Activities

*Lab 2.1: Camera Configuration Exercise*
Students configure thermal camera for various scenarios (building inspection, solar panel, nighttime SAR) and document appropriate settings for each.

*Lab 2.2: Range and Level Optimization*
Using targets with known temperatures, students practice manual level/span adjustment to optimize contrast and detail visibility.

*Lab 2.3: Drone Thermal Operations*
Introduction to Matrice 4T thermal operations. Students practice payload control, zoom functions, and capture procedures during hover flights.

== Unit 3: Thermal Image Interpretation

=== Learning Objectives

- Identify common thermal patterns indicating system problems
- Distinguish actual anomalies from environmental artifacts
- Quantify thermal findings using measurement tools
- Document findings using professional conventions

=== Topics

==== Pattern Recognition

Normal thermal patterns for common systems and structures. Anomaly categories: overheating, thermal bridging, moisture, air infiltration. Pattern variations by system type and conditions.

==== Anomaly Classification

Qualitative versus quantitative assessment. Delta-T measurements and significance thresholds. Priority classification systems. When temperature measurement is appropriate versus when qualitative assessment suffices.

==== Common Artifacts and Errors

Reflection artifacts and identification strategies. Environmental effects mistaken for anomalies. Calibration errors and their signatures. Operator-induced errors.

==== Measurement Techniques

Spot measurement placement and averaging. Area measurements and statistics. Reference temperature selection. Documenting measurement conditions and limitations.

=== Lab Activities

*Lab 3.1: Pattern Recognition Exercise*
Students review thermal imagery database and identify anomaly types, classifying findings and justifying conclusions.

*Lab 3.2: Artifact Identification*
Presented with thermal images containing reflections, environmental effects, and actual anomalies, students distinguish between them.

*Lab 3.3: Field Interpretation*
During controlled inspection scenario, students capture thermal imagery and provide real-time interpretation of findings.

== Unit 4: Infrastructure Inspection Applications

=== Learning Objectives

- Plan inspection missions for utility and infrastructure assets
- Execute inspection flights maintaining safe distances from hazards
- Identify common failure modes in electrical and mechanical systems
- Document findings for utility and engineering clients

=== Topics

==== Electrical Infrastructure Inspection

*Power Line and Pole Inspection:*
Common failure modes: hot connections, overloaded conductors, damaged insulators. Safe approach distances and flight patterns. Correlation between thermal patterns and failure severity.

*Substation Components:*
Transformer inspection considerations. Switch and breaker assessment. Capacitor bank inspection. Documentation requirements for utility clients.

*Solar Panel Assessment:*
Hot spot identification and classification. Cell, string, and module-level failures. Bypass diode failures. Panel soiling effects versus actual defects. Flight patterns for systematic coverage.

==== Building and Roofing Inspection

*Building Envelope:*
Thermal bridging identification. Insulation deficiency detection. Air infiltration patterns. Moisture intrusion indicators. Optimal conditions for building thermography.

*Flat Roof Assessment:*
Moisture detection principles and limitations. Survey techniques for roof systems. Documentation for roofing clients and insurers.

==== California Utility Regulations

*GO 95:* California overhead electric line construction rules. Relevance to inspection findings and reporting.

*GO 165:* Inspection requirements for electric distribution and transmission facilities. How drone inspections fit regulatory framework.

==== Safety Protocols

Minimum approach distances for energized equipment. Electromagnetic interference considerations. Coordination with utility operations. Personal protective equipment requirements.

=== Lab Activities

*Lab 4.1: Solar Panel Inspection*
Students conduct systematic thermal inspection of solar installation, documenting panel-level findings and producing inspection report.

*Lab 4.2: Building Envelope Assessment*
Pre-dawn or evening inspection of campus building, identifying thermal anomalies and documenting in professional format.

*Lab 4.3: Simulated Utility Inspection*
Using training targets simulating electrical connections at various temperatures, students practice identification and documentation of fault conditions.

== Unit 5: Public Safety Applications

=== Learning Objectives

- Apply thermal imaging techniques to search and rescue operations
- Assess fire scenes using thermal reconnaissance
- Support law enforcement operations with thermal surveillance
- Integrate drone operations with incident command structures

=== Topics

==== Search and Rescue Operations

*Human Detection:*
Thermal signature characteristics of human subjects. Environmental factors affecting detectability. Search pattern design for thermal detection. Day versus night detection considerations.

*Search Techniques:*
Systematic area coverage strategies. Altitude and speed tradeoffs for detection probability. Terrain and vegetation effects on visibility. Coordination with ground teams.

*Environmental SAR:*
Water rescue thermal considerations. Wilderness search adaptations. Vehicle accident scene assessment.

==== Fire Scene Assessment

*Active Fire Support:*
Hotspot identification and mapping. Fire perimeter documentation. Ventilation assessment for structure fires. Wildfire reconnaissance applications.

*Post-Fire Assessment:*
Hidden fire detection in structures and vegetation. Rekindle monitoring. Damage documentation for investigation.

*Firefighter Safety:*
Heat exposure monitoring. Escape route assessment. Structural integrity indicators.

==== Law Enforcement Support

*Tactical Applications:*
Perimeter surveillance capabilities. Vehicle and structure monitoring. Evidence search support.

*Operational Considerations:*
Legal and policy constraints on surveillance. Privacy considerations. Evidence documentation standards.

==== Night Operations

Low-light flight procedures. Crew resource management for night missions. Visual observer requirements and limitations. Navigation and obstacle avoidance.

==== Incident Command Integration

ICS structure and drone unit positioning. Communication protocols. Situational awareness contributions. Mission documentation for incident records.

=== Lab Activities

*Lab 5.1: Simulated Search Exercise*
Night exercise with hidden thermal targets. Students plan and execute systematic search, demonstrating detection and reporting procedures.

*Lab 5.2: Fire Scene Simulation*
Using heat sources simulating fire conditions, students practice hotspot identification, perimeter mapping, and safety assessment.

*Lab 5.3: Incident Integration Scenario*
Multi-role exercise practicing communication, documentation, and coordination with simulated ground teams and incident command.

== Unit 6: Professional Reporting and Documentation

=== Learning Objectives

- Structure inspection reports for different client types
- Present thermal findings clearly and accurately
- Maintain records supporting professional and legal requirements
- Manage thermal data for long-term accessibility

=== Topics

==== Report Structure

Executive summary and key findings. Methodology documentation. Detailed findings with supporting imagery. Recommendations and priority classifications.

==== Image Presentation

Thermal and visible image pairing. Annotation conventions. Scale and orientation consistency. Color palette selection for reports.

==== Client-Specific Requirements

Utility inspection report formats. Insurance documentation standards. Public safety incident reports. Engineering and construction deliverables.

==== Data Management

File organization for inspection projects. Radiometric data preservation. Long-term storage considerations. Backup and redundancy.

=== Lab Activities

*Lab 6.1: Inspection Report Production*
Students produce complete professional inspection report from lab exercise data, formatted for specified client type.

*Lab 6.2: Peer Review Exercise*
Students review and critique peer reports, providing constructive feedback on clarity, completeness, and professionalism.

== Unit 7: Capstone Project

=== Objectives

Demonstrate mastery of course competencies through execution of complete thermal inspection project in either infrastructure or public safety context.

=== Project Options

*Option A: Infrastructure Inspection*
Complete thermal inspection of building, solar installation, or simulated utility infrastructure. Includes planning, execution, interpretation, and professional report delivery.

*Option B: Public Safety Exercise*
Participation in simulated SAR or fire assessment scenario. Includes mission planning, thermal operations, incident integration, and documentation.

=== Partnership Opportunities

Students may complete capstone projects in collaboration with program partners:

- SLO County Fire for fire assessment exercises
- Local solar installations for panel inspections
- Campus facilities for building envelope assessment

=== Evaluation Criteria

- Technical accuracy of thermal interpretation
- Appropriate application of safety protocols
- Quality of documentation and reporting
- Professional conduct and communication

== Certification Pathway

=== Level 1 Thermography Preparation

This course covers content aligned with Level 1 thermography certification requirements from organizations including Infraspection Institute and the Infrared Training Center. Students completing this course are prepared to pursue external certification, which significantly enhances employment prospects and earning potential.

=== Certification Value

Thermography certification is recognized across infrastructure inspection, building assessment, and energy sectors. Certified thermographers command higher rates and access more advanced positions. The combination of Part 107 and thermography certification positions graduates for competitive employment in utility inspection.

== Assessment Strategy

=== Formative Assessment

- Lab activity completion and quality
- Quiz assessments after each unit
- Practical skill demonstrations

=== Summative Assessment

- Written examination on theory and interpretation (30%)
- Practical examination on camera operation and image capture (30%)
- Capstone project (40%)

== Equipment List

=== Program Equipment (Provided)

- DJI Matrice 4T with thermal payload
- Thermal calibration targets
- Heat sources for training scenarios
- Laptop with thermal analysis software

=== Student Requirements

- Safety glasses and appropriate field clothing
- Field notebook
- Laptop for report preparation (recommended)

== Software

=== Required

- DJI Pilot 2 (drone operations)
- DJI Thermal Analysis Tool (image analysis)

=== Recommended

- FLIR Thermal Studio (advanced analysis)
- Report writing software (Word, Google Docs)

== Recommended Sequence

This course is designed for completion in one semester (16 weeks) with weekly 3-hour combined lecture/lab sessions:

- Weeks 1-2: Unit 1 (Infrared Theory and Thermal Physics)
- Weeks 3-4: Unit 2 (Thermal Camera Operation)
- Weeks 5-6: Unit 3 (Thermal Image Interpretation)
- Weeks 7-10: Unit 4 (Infrastructure Inspection Applications)
- Weeks 11-13: Unit 5 (Public Safety Applications)
- Week 14: Unit 6 (Professional Reporting)
- Weeks 15-16: Unit 7 (Capstone Project)

== Partnership Development

=== Recommended Partners

*PG&E:* Curriculum review, equipment standards alignment, potential hiring pipeline. Largest local employer for thermal inspection work.

*CAL FIRE / SLO County Fire:* Public safety module input, exercise scenarios, continuing education market for existing personnel.

*Local Solar Installers:* Training site access for panel inspection exercises. Potential employment connections for graduates.

*Insurance Industry Contacts:* Understanding of documentation requirements for claims work. Potential seasonal employment opportunities.

=== Continuing Education Market

This course is particularly well-suited for delivery to existing professionals as continuing education:

- Firefighters and law enforcement seeking thermal drone skills
- Home inspectors adding drone inspection capabilities
- Utility workers preparing for internal drone programs
- Insurance adjusters expanding assessment tools

Evening and weekend scheduling options should be considered to accommodate working professionals.
