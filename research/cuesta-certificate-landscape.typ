#set document(title: "Cuesta College Certificate Landscape Analysis")
#set page(margin: 1in)
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.1")

#align(center)[
  #text(size: 18pt, weight: "bold")[Cuesta College Certificate Landscape Analysis]
  #v(0.5em)
  #text(size: 12pt)[Research for Proposed Drone Program Certification Design]
  #v(0.3em)
  #text(size: 10pt, fill: gray)[February 2026 -- Data scraped from cuesta.edu and curriqunet]
]

#v(1em)

= Purpose

This report surveys all existing certificate programs at Cuesta College to understand the institutional norms and patterns that should inform the design of new certificates for the proposed drone program. The data was collected programmatically from the college's official degrees and certificates listing page and the curriqunet course requirement system, covering all 122 active certificate programs.

= The Three Certificate Types

Cuesta offers three distinct types of certificates, each with a different scope and purpose. Understanding these distinctions is essential for deciding what kind of credential to propose for the drone program.

#table(
  columns: (auto, auto, auto, auto),
  align: (left, center, center, left),
  table.header(
    [*Type*], [*Count*], [*Median Units*], [*Typical Use*],
  ),
  [Certificate of Specialization], [23], [6.0], [Narrow skill focus, 1--4 courses, quick to complete],
  [Certificate of Achievement], [63], [19.5], [Workforce-ready credential, 5--9 courses, CTE-aligned],
  [Certificate of Completion], [36], [27.0], [Noncredit programs, measured in contact hours],
)

*Certificate of Specialization* programs are the smallest credentials. They typically consist of two to four courses totaling 3 to 12 units and target a single employable skill. Examples include Welding Technology Pipe (3 units, 1 course), Android Developer (6 units, 2 courses), and Computer Networking Support (9 units, 3 courses). These are ideal for students who need a focused, fast credential.

*Certificate of Achievement* programs are the workhorses of Cuesta's CTE offerings. They average about 24 units and 8 courses, though the range is wide (12 to 55 units). These programs prepare students for employment or advancement in a specific field and are the most common certificate type at the college. They are credit-bearing and appear on transcripts.

*Certificate of Completion* programs are noncredit and measured in contact hours rather than credit units. They serve workforce preparation, ESL, and community education functions. These would not be relevant to the drone program.

= Unit and Course Distribution

Across the 83 credit-bearing certificates (Specialization and Achievement), the unit distribution looks like this:

#table(
  columns: (auto, auto),
  align: (left, center),
  table.header([*Unit Range*], [*Number of Certificates*]),
  [0--6 units], [12],
  [7--12 units], [10],
  [13--18 units], [23],
  [19--24 units], [9],
  [25--30 units], [13],
  [31+ units], [16],
)

The most common band is 13 to 18 units, which represents the sweet spot for many CTE certificates. The median across all credit certificates is 18.0 units, and the mean is 20.7.

Course counts follow a similar pattern. The median certificate requires 5 courses, and the mean is 6.4. Certificates range from single-course credentials (EMT Refresher) to programs with 13 or more courses (Medical Assisting, Library/Information Technology).

= Structural Patterns

The overwhelming majority of certificates (104 out of 120 with data) use a single block of required courses with no elective choices. This is the simplest structure and the institutional default. Only 16 certificates include any kind of elective or choice block, and those tend to be larger programs (18+ units) that allow students to specialize within a broader field.

When electives do appear, they are typically phrased as "Plus N credits from the following" and offer a short list of 3 to 6 options. There are no general education requirements in any certificate program -- GE applies only to associate degrees.

The block structure is straightforward:
- Most certificates: one block titled "Required Courses" listing every course
- Some larger certificates: a required core block plus one elective block
- Rare exceptions: multiple blocks organized by topic area (Technical Theater has 7 blocks, Paraprofessional Educator/Pre-Teaching has 7)

= The Aviation Mechanic Model

The existing aviation mechanic certificates are the closest analog to what a drone program might look like, and they demonstrate an important design pattern: *nested, stackable certificates*.

#table(
  columns: (auto, auto, auto),
  align: (left, center, center),
  table.header([*Certificate*], [*Units*], [*Courses*]),
  [Aviation Mechanic -- General], [12], [2],
  [Aviation Mechanic -- Airframe], [30], [5],
  [Aviation Mechanic -- Powerplant], [30], [5],
  [Aviation Mechanic -- Airframe & Powerplant], [48], [8],
)

The General certificate (AVMT 110 and 120) forms the foundation. Both the Airframe and Powerplant certificates build on it by adding three more courses each. The full Airframe & Powerplant certificate combines everything. Every course in the smaller certificates counts toward the larger ones, so a student who earns the General certificate has already completed a third of the full A&P program.

All four certificates are Certificates of Achievement. All courses are 6-unit blocks, reflecting the intensive, lab-heavy nature of aviation maintenance training. There are no electives and no prerequisites beyond sequencing within the AVMT series itself.

This stacking pattern is widely used at Cuesta. Child Development has a similar ladder (Associate Teacher at 12 units, Teacher at 26, Master Teacher at 31, Site Supervisor at 34), and the business programs share a common core across multiple specialization certificates.

= Course Stacking Across Programs

Course sharing is pervasive. Of all courses appearing in certificates, 160 distinct courses appear in more than one certificate program. The most shared courses are foundational introductory courses in their discipline: CDFS 201 appears in 10 different certificates, ACCT 201A in 8, and AVMT 110 and 120 each appear in all 4 aviation certificates.

This has a clear implication for drone program design: if you build the curriculum around courses that could also serve other programs (e.g., an intro electronics course shared with the EET certificates, or a GIS course shared with agriculture), you create cross-enrollment pathways that strengthen the program's enrollment base.

= Program Outcomes

Every certificate at Cuesta includes program-level outcomes, averaging 3.9 outcomes per certificate (range: 1 to 10). These are written as measurable student competencies. A typical workforce certificate has 3 to 5 outcomes focused on the specific skills a graduate should demonstrate on the job.

= CTE Certificates in the 12--24 Unit Range

This is likely the target range for a drone program certificate. Here is what the landscape looks like in that band, filtered to Certificates of Achievement:

#text(size: 9pt)[
#table(
  columns: (auto, auto, auto),
  align: (left, center, center),
  table.header([*Program*], [*Units*], [*Courses*]),
  [Aviation Mechanic -- General], [12.0], [2],
  [Child Development Associate Teacher], [12.0], [4],
  [Cloud Computing], [16.0], [7],
  [Computer Support Specialist (Specialization)], [13.0], [4],
  [Addiction Studies Foundation], [15.0], [5],
  [Viticulture], [15.0], [5],
  [Audio Technology I], [16.0], [5],
  [Power and Instrumentation], [16.0], [4],
  [Photography], [17.0], [8],
  [Auto Body Technician], [18.0], [7],
  [Farm Management], [18.0], [7],
  [Welding Technology], [18.5], [7],
  [Engine Performance Specialist], [19.5], [6],
  [Mechanized Agriculture], [20.0], [7],
  [Maintenance and Light Repair], [21.0], [6],
  [Accounting Clerk], [22.0], [7],
  [Graphics], [24.0], [9],
  [PK--3 Pathway for Educators], [24.0], [8],
)
]

The typical CTE certificate in this range has 5 to 7 courses and a single required-courses block with no electives. Programs at the lower end (12--15 units) tend to be either stackable foundations or narrow specializations. Programs at the upper end (20--24 units) are standalone workforce credentials.

= Implications for Drone Program Design

Based on this analysis, several design principles emerge:

*Use the stackable model.* The aviation mechanic pattern works well and is already familiar to the institution. A reasonable approach would be a Certificate of Specialization at 6--9 units covering drone fundamentals (regulations, basic flight, safety), stackable into a Certificate of Achievement at 15--20 units that adds applied skills (mapping, inspection, commercial operations, data processing).

*Stay in the 15--20 unit range for the primary credential.* This is the institutional sweet spot. A Certificate of Achievement in this range would be comparable to Welding Technology (18.5 units), Cloud Computing (16 units), and Audio Technology I (16 units), which are all successful workforce programs.

*Keep the structure simple.* The overwhelming norm is a single block of required courses with no electives. Unless there is a strong pedagogical reason to offer elective tracks (e.g., agriculture drones vs. inspection drones), a straightforward required sequence will be easiest to approve and administer.

*Target 5--7 courses.* This is the median for CTE certificates in the target unit range. Courses of 3 units each fit naturally into a semester schedule and align with other programs at the college.

*Include 3--5 program outcomes.* Focus on the specific competencies employers expect: FAA Part 107 certification preparation, flight proficiency, mission planning, data collection and processing, and safety/regulatory compliance.

*Consider cross-enrollment opportunities.* If any courses could serve students in related programs (agriculture, construction, GIS, electronics), design them to be broadly useful. This is standard practice at Cuesta and strengthens enrollment.

*The AVMT prefix is already established.* The existing aviation mechanic courses use the AVMT prefix. A drone program housed in the same department could potentially share that prefix or establish a new one, depending on how the college's curriculum committee wants to organize things.
