#import "@preview/i-figured:0.2.4"
#import "@preview/numbly:0.1.0": numbly
#import "../utils/numbering.typ": *

#let mainmatter(
  // Document type: "bachelor", "master", etc. (affects equation numbering style)
  doctype: "doctor",
  lang: "en",
  // Main document body content
  body,
) = {
  // Start page numbering at 1
  set page(numbering: "1")
  counter(page).update(1)

  // Set chapter prefix
  set heading(
    numbering: numbly(
      pattern-heading-first-level(lang: lang, supplement: [Chapter]) + if doctype == "master" { ":" },
    ),
  )
  show heading.where(level: 1): set heading(supplement: [Chapter])
  counter(heading).update(0)

  show heading: i-figured.reset-counters
  show figure: i-figured.show-figure
  show math.equation: i-figured.show-equation

  // Add metadata for total words and characters (for thesis statistics)
  context [
    #metadata(state("total-words-cjk").final()) <total-words>
    #metadata(state("total-characters").final()) <total-chars>
  ]

  body
}
