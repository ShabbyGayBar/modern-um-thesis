#import "@preview/i-figured:0.2.4"
#import "@preview/numbly:0.1.0": numbly
#import "../utils/numbering.typ": *

#let appendix(
  doctype: "doctor",
  lang: "en",
  body,
) = {
  // Set appendix prefix
  set heading(
    numbering: numbly(
      pattern-heading-first-level(lang: lang, supplement: [Appendix]) + if doctype == "master" { ":" },
      "{1:A}.{2}.",
    ),
  )
  show heading.where(level: 1): set heading(supplement: [Appendix])
  counter(heading).update(0)

  show heading: i-figured.reset-counters
  show figure: i-figured.show-figure.with(numbering: "A.1")
  show math.equation: i-figured.show-equation.with(numbering: "(A.1)")

  body
}
