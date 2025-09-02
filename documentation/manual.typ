#import "@preview/tidy:0.4.3"
#import "../layouts/appendix.typ"

#align(center)[#text(size: 20pt)[*modern-um-thesis*]]

Typst thesis template for University of Macau.

#outline(depth: 3)

#pagebreak()

= Top Level

#let docs = tidy.parse-module(
  read("../lib.typ"),
  name: "Entry point",
)
#tidy.show-module(docs)

= Layouts

#let docs = tidy.parse-module(
  read("../layouts/doc.typ"),
  name: "Global Document Settings",
)
#tidy.show-module(docs)

#let docs = tidy.parse-module(
  read("../layouts/frontmatter.typ"),
  name: "Front Matter Environment",
)
#tidy.show-module(docs)

#let docs = tidy.parse-module(
  read("../layouts/mainmatter.typ"),
  name: "Main Matter Environment",
)
#tidy.show-module(docs)

#let docs = tidy.parse-module(
  read("../layouts/appendix.typ"),
  name: "Appendix Environment",
  scope: (appendix: appendix),
  preamble: "#import appendix: *\n",
)
#tidy.show-module(docs)

= Pages

#let docs = tidy.parse-module(
  read("../pages/cover-phd.typ"),
  name: "Cover Page (PhD)",
)
#tidy.show-module(docs)

#let docs = tidy.parse-module(
  read("../pages/declare-phd.typ"),
  name: "Declaration Page (PhD)",
)
#tidy.show-module(docs)
