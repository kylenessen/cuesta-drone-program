// Cuesta College memo layout for Typst
// Usage:
//   #import "cuesta-memo.typ": cuesta-memo
//   #cuesta-memo(title: "...")[ ... ]
// Brand colors pulled from Cuesta style guide.

#let brand = (
  green: rgb("#026d4d"),       // New Cuesta Green (primary)
  black: rgb("#000000"),       // Cuesta Black
  bright-green: rgb("#3aac62"),
  rich-green: rgb("#157f58"),
  deep-green: rgb("#035333"),
  bright-gray: rgb("#ebf2ee"),
  rich-gray: rgb("#babfbb"),
  deep-gray: rgb("#5e6d67"),
)

#let body-font = ("Poppins", "Helvetica Neue", "Arial", "sans-serif")

#let cuesta-memo(
  banner: "Cuesta College",
  title: "",
  subtitle: none,
  audience: none,
  author: none,
  date: datetime.today().display("[month repr:long] [day], [year]"),
  draft: false,
  logo: "images/CuestaLogo-H-FC-Black.png",
  body: none,
) = [
  #let memo-body = if body == none { [] } else { body }
  #set document(title: title)
  #set page(margin: 1in)
  #set text(font: body-font, size: 11pt, fill: brand.deep-gray)
  #set par(justify: true, leading: 1.4em)
  #set figure(numbering: none)

  #show link: set text(fill: brand.green, weight: "semibold")
  #show link: underline

  #show heading.where(level: 1): it => block(above: 1.5em, below: 0.75em)[
    #text(size: 13pt, weight: "bold", fill: brand.green)[#it.body]
  ]
  #show heading.where(level: 2): it => block(above: 1.5em, below: 0.75em)[
    #text(size: 12pt, weight: "semibold", fill: brand.deep-green)[#it.body]
  ]
  #show heading.where(level: 3): it => block(above: 1.3em, below: 0.6em)[
    #text(weight: "semibold", fill: brand.rich-green)[#it.body]
  ]

  #set table(
    stroke: .6pt + brand.rich-gray,
    fill: (col, row) => if row == 0 { brand.bright-gray } else { none },
    align: center,
    inset: 6pt,
  )

  #align(center)[
    #if logo != none {
      image(logo, width: 2in)
    }
    #v(0.5em)
    #text(size: 16pt, weight: "bold", fill: brand.green)[#banner]
    #linebreak()
    #text(size: 14pt, weight: "semibold", fill: brand.black)[#title]
    #if subtitle != none {
      linebreak()
      text(size: 11pt, style: "italic", fill: brand.deep-gray)[#subtitle]
    }
  ]

  #v(1em)
  #line(length: 100%, stroke: 0.5pt + brand.rich-gray)
  #v(0.5em)

  #grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    text(size: 10pt, fill: brand.deep-gray)[*To:*], text(size: 10pt, fill: brand.deep-gray)[#audience],
    text(size: 10pt, fill: brand.deep-gray)[*From:*], text(size: 10pt, fill: brand.deep-gray)[#author],
    text(size: 10pt, fill: brand.deep-gray)[*Date:*], text(size: 10pt, fill: brand.deep-gray)[#date],
  )

  #v(0.5em)
  #line(length: 100%, stroke: 0.5pt + brand.rich-gray)
  #v(1em)

  #memo-body
]
