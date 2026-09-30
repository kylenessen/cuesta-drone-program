"""Build the five course NOI review forms from their shared content file."""
import json
from pathlib import Path
from docx import Document
from docx.shared import Inches, Pt, RGBColor
from docx.oxml import OxmlElement
from docx.oxml.ns import qn

ROOT = Path(__file__).resolve().parents[1]
STEM = '2026-09-30-aero-noi-review'
courses = json.loads((ROOT / 'curriculum-content' / (STEM + '.json')).read_text())
doc = Document()
sec = doc.sections[0]
sec.page_width, sec.page_height = Inches(8.5), Inches(11)
sec.top_margin = sec.bottom_margin = Inches(.5)
sec.left_margin = sec.right_margin = Inches(.6)
sec.footer_distance = Inches(.22)
for name in ['Normal', 'Title', 'Subtitle', 'Heading 1', 'Heading 2']:
    st = doc.styles[name]
    st.font.name = 'Arial'
    st.font.color.rgb = RGBColor(0, 0, 0)
    st.paragraph_format.space_after = Pt(3)
    st.paragraph_format.space_before = Pt(0)
    st.paragraph_format.line_spacing = 1
normal = doc.styles['Normal']
normal.font.size = Pt(10.5)
normal.paragraph_format.widow_control = True
for name, size in [('Title', 15), ('Subtitle', 11), ('Heading 1', 10.5)]:
    doc.styles[name].font.size = Pt(size)
    doc.styles[name].font.bold = True
h = doc.styles['Heading 1'].paragraph_format
h.space_before = Pt(5)
h.space_after = Pt(3)
h.keep_with_next = True
footer = sec.footer.paragraphs[0]
footer.alignment = 2
run = footer.add_run('AERO notice of intent  |  ')
run.font.size = Pt(8)
fld = OxmlElement('w:fldSimple')
fld.set(qn('w:instr'), 'PAGE')
footer._p.append(fld)
doc.core_properties.title = 'AERO Notices of Intent'
doc.core_properties.author = 'Kyle Nessen'
doc.core_properties.subject = 'Course proposals for Ron Overacker review'
typ = ['#set document(title: "AERO Notices of Intent", author: "Kyle Nessen")',
       '#set page(paper: "us-letter", margin: (x: 0.6in, y: 0.5in), numbering: "1")',
       '#set text(font: "Arial", size: 10pt)', '#set par(leading: 0.3em, spacing: 0.35em)',
       '#set heading(numbering: none)', '#show heading.where(level: 1): set text(size: 15pt)',
       '#show heading.where(level: 2): set text(size: 10.5pt)']

def para(label, value):
    p = doc.add_paragraph()
    p.add_run(label + '  ').bold = True
    p.add_run(value)
    typ.append('*' + label + '* ' + value.replace('_', r'\_') + '\n')

def heading(s):
    doc.add_paragraph(s, 'Heading 1')
    typ.append('== ' + s + '\n')

for i,c in enumerate(courses):
    if i:
        doc.add_page_break()
        typ.append('#pagebreak()')
    n = c['number']
    independent = n == '147'
    advanced_regulations = n == '151'
    doc.add_paragraph('AERO ' + n + ' Notice of Intent', 'Title')
    doc.add_paragraph(c['title'], 'Subtitle')
    typ += ['= AERO ' + n + ' Notice of Intent', '*' + c['title'] + '*\n']
    heading('Basic Course Information')
    para('Subject', 'AERO, Aeronautical and Aviation Technology')
    para('Course number', n + (' (proposed)' if independent else ''))
    para('Tentative course description', c['description'])
    heading('Credit and Hours')
    if independent:
        para('Variable hours', 'Yes. Minimum units 0.5. Maximum units 2.0. All units are lab.')
        para('Lecture / lab / activity hours', '0 / 1.5 to 6 / 0 curriculum hours per week. Semester totals are 0 lecture, 27 to 108 lab, and 0 activity hours. Outside work is 0 hours. Total student hours are 27 to 108.')
    elif advanced_regulations:
        para('Variable hours', 'No. Minimum units 2.0. Lecture units 1.0. Lab units 1.0.')
        para('Lecture / lab / activity hours', '1 / 3 / 0 curriculum hours per week. Semester totals are 18 lecture, 54 lab, and 0 activity hours. Outside work is 36 hours. Total student hours are 108.')
    else:
        para('Variable hours', 'No. Minimum units 3.0. Lecture units 2.0. Lab units 1.0.')
        para('Lecture / lab / activity hours', '2 / 3 / 0 curriculum hours per week. Semester totals are 36 lecture, 54 lab, and 0 activity hours. Outside work is 72 hours. Total student hours are 162.')
    heading('Course Content')
    para('Fit within existing degrees or certificates', 'No. ' + ('No existing program is identified.' if independent else 'Planned certificates of specialization will be proposed separately.'))
    para('Course rationale', c['rationale'])
    para('Transfer or articulation intent', 'No.')
    para('Connection to the College Mission', c['mission'])
    para('Additional resources required', '____________________')
    para('Resources and funding', '________________________________________________________')
    para('Duplicate or overlap existing courses', c['overlap'])
    heading('Minimum Qualifications')
    para('Minimum qualification', 'Aeronautics. Condition ____________________')
    para('Department currently has faculty meeting minimum qualifications', '____________________')
    heading('Course Cap')
    category = '9 - Lab - Small (20-30)' if n in ['151','161','162','163'] else '____________________'
    para('Tentative course cap category', category + '. Tentative course cap 25.' if category[0]!='_' else category + '    Tentative course cap 25.')
    para('Effect on department efficiency', c['efficiency'])
    heading('Codes and Dates')
    para('Dean or director approval date', '____________________')
    para('Originator', 'Kyle Nessen. Co-contributor Ron Overacker.')

out = ROOT / 'output' / 'docx' / (STEM + '.docx')
out.parent.mkdir(parents=True, exist_ok=True)
for element in list(doc.styles.element.iter(qn('w:pBdr'))):
    element.getparent().remove(element)
for element in list(doc.element.iter(qn('w:pBdr'))):
    element.getparent().remove(element)
doc.save(out)
(ROOT / 'curriculum-content' / (STEM + '.typ')).write_text('\n'.join(typ)+'\n')
print(out)
