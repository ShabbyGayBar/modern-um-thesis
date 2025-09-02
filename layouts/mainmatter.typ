#import "@preview/i-figured:0.2.4"
#import "@preview/numbly:0.1.0": numbly
#import "../utils/numbering.typ": *

/// Set up main matter environment
///
/// -> content
#let mainmatter(
  /// Type of thesis
  ///
  /// -> "doctor" | "master" | "bachelor"
  doctype: "doctor",
  /// Language of the thesis
  ///
  /// -> "en" | "zh" | "pt"
  lang: "en",
  /// -> content
  body,
) = {
  set page(numbering: "1")
  counter(page).update(1)
  counter(heading).update(0)
  // Set chapter prefix
  set heading(numbering: numbly(
    pattern-heading-first-level(lang: lang, supplement: [Chapter]) + if doctype == "master" { ":" },
  ))
  // Set chapter supplement for identification in doc.typ
  show heading.where(level: 1): set heading(supplement: [Chapter])

  // i-figured settings
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
