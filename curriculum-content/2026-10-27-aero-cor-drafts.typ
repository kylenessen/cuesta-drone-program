#let packet = json("2026-10-27-aero-cor-drafts.json")
#let selected = sys.inputs.at("course", default: "all")
#let courses = packet.courses.filter(course => selected == "all" or course.number == selected)
#assert(courses.len() > 0, message: "Select 151, 161, 162, 163, 147, or all.")

#set document(title: "AERO Course Outline Content Drafts", author: packet.author)
#set page(paper: "us-letter", margin: (x: 0.65in, top: 0.6in, bottom: 0.6in), numbering: "1", number-align: center)
#set text(font: "Arial", size: 11pt)
#set par(leading: 0.38em, spacing: 0.5em)
#set heading(numbering: none)
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 11.5pt)
#show heading: set block(above: 0.8em, below: 0.4em)

#let alignments(numbers) = box(text(size: 8.5pt, fill: rgb("555555"))[
  #if numbers.len() == 1 [Objective] else [Objectives]
  #numbers.map(str).join(", ")
])

#let numbered(items) = {
  for (index, item) in items.enumerate() {
    block(breakable: false)[#strong(str(index + 1) + ".") #item]
  }
}

#for (index, course) in courses.enumerate() {
  if index > 0 { pagebreak() }
  heading(level: 1)[AERO #course.number]
  text(size: 13pt, weight: "bold")[#course.title]
  parbreak()
  text(size: 9pt, fill: rgb("555555"))[Course outline content draft. October 27, 2026.]
  parbreak()
  if "lecture_units" in course and "lab_units" in course {
    [#course.units units, comprising #course.lecture_units lecture units and #course.lab_units lab unit. #course.lecture_hours lecture hours, #course.lab_hours lab hours, and #course.outside_hours outside hours per term. #course.total_hours total student hours.]
  } else {
    [#course.units units. #course.lecture_hours lecture hours, #course.lab_hours lab hours, and #course.outside_hours outside hours per term. #course.total_hours total student hours.]
  }
  if "prerequisite" in course {
    parbreak()
    [#strong[Prerequisite] #course.prerequisite.]
  }
  heading(level: 2)[Course description]
  course.description
  heading(level: 2)[Course rationale]
  course.rationale
  heading(level: 2)[Student learning outcomes]
  numbered(course.outcomes)
  heading(level: 2)[Course objectives]
  numbered(course.objectives)
  heading(level: 2)[Topics and scope]
  for topic in course.topics {
    block(breakable: false)[#strong(topic.title + ".") #topic.text #alignments(topic.objectives)]
  }

  pagebreak()
  text(size: 13pt, weight: "bold")[AERO #course.number]
  parbreak()
  text(size: 9pt, fill: rgb("555555"))[#course.title. Course outline content draft.]
  heading(level: 2)[Laboratory content]
  course.lab
  heading(level: 2)[Methods of instruction]
  course.instruction
  if "accessibility" in course {
    heading(level: 2)[Accessible and inclusive instruction]
    course.accessibility
  }
  if "outside_work" in course {
    heading(level: 2)[Reading, writing, and outside work]
    course.outside_work
  }
  heading(level: 2)[Assignment examples]
  for (assignment_index, assignment) in course.assignments.enumerate() {
    block(breakable: false)[
      #strong(str(assignment_index + 1) + ". " + assignment.kind + ".")
      #assignment.text #alignments(assignment.objectives)
    ]
  }
  if "evaluation_alignment" in course {
    pagebreak()
    text(size: 13pt, weight: "bold")[AERO #course.number]
    parbreak()
    text(size: 9pt, fill: rgb("555555"))[#course.title. Course outline content draft.]
  }
  heading(level: 2)[Methods of evaluation]
  course.evaluation
  if "evaluation_alignment" in course {
    heading(level: 2)[Assessment alignment]
    for assessment in course.evaluation_alignment {
      block(breakable: false)[#assessment.text #alignments(assessment.objectives)]
    }
  }
  heading(level: 2)[Instructional resources]
  course.materials
  if "content_review" in course {
    heading(level: 2)[Prerequisite content review]
    [The proposed AERO 100 prerequisite supports the following course objectives.]
    parbreak()
    for review in course.content_review {
      block(breakable: false)[#review.preparation #review.application #alignments(review.objectives)]
    }
  }
  if "preparation" in course {
    heading(level: 2)[Preparation for independent study]
    course.preparation
  }
}
