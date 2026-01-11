#import "@preview/tidy:0.4.3"
#import "../src/layouts/appendix.typ"

#set document(
  title: [modern-um-thesis Documentation Manual],
  author: "Brian Li",
  description: [The documentation manual for the modern-um-thesis Typst template, generated using Tidy.],
  keywords: ("thesis", "format", "standardization", "documentation", "Typst", "University of Macau"),
)
#set page(numbering: "1",)

#align(center)[#text(size: 20pt)[*modern-um-thesis*]]

This is the documentation manual for the `modern-um-thesis` Typst template, generated using `Tidy`.

#outline()

#pagebreak()

= Top Level

#let docs = tidy.parse-module(
  read("../src/lib.typ"),
)
#tidy.show-module(
  docs,
  first-heading-level: 1,
  show-outline: false,
)

= Layouts

#let docs = tidy.parse-module(
  read("../src/layouts/doc.typ"),
)
#tidy.show-module(
  docs,
  first-heading-level: 1,
  show-outline: false,
)

#let docs = tidy.parse-module(
  read("../src/layouts/frontmatter.typ"),
)
#tidy.show-module(
  docs,
  first-heading-level: 1,
  show-outline: false,
)

#let docs = tidy.parse-module(
  read("../src/layouts/mainmatter.typ"),
)
#tidy.show-module(
  docs,
  first-heading-level: 1,
  show-outline: false,
)

#let docs = tidy.parse-module(
  read("../src/layouts/appendix.typ"),
  scope: (appendix: appendix),
  preamble: "#import appendix: *\n",
)
#tidy.show-module(
  docs,
  first-heading-level: 1,
  show-outline: false,
)

= Pages

#let docs = tidy.parse-module(
  read("../src/pages/cover-phd.typ"),
)
#tidy.show-module(
  docs,
  first-heading-level: 1,
  show-outline: false,
)

#let docs = tidy.parse-module(
  read("../src/pages/declare-phd.typ"),
)
#tidy.show-module(
  docs,
  first-heading-level: 1,
  show-outline: false,
)
