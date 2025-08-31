#import "@preview/i-figured:0.2.4"
#import "@preview/theorion:0.4.0": *
#import "@preview/numbly:0.1.0": numbly

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

  // Use "Chapter <number>: " as heading prefixes
  set heading(
    numbering: if lang == "zh" {
      numbly("第{1:一}章：")
    } else if lang == "pt" {
      numbly("Capítulo {1}:")
    } else {
      numbly("Chapter {1}:")
    }
  )
  show: show-theorion
  // Set figure caption separator and style
  set figure.caption(separator: [#h(1em)])
  show figure.caption: it => {
    set text(weight: "bold")
    it
  }
  // Place table and algorithm captions above
  show figure.where(kind: "table"): set figure.caption(position: top)
  show figure.where(kind: "algorithm"): set figure.caption(position: top)
  // Allow figures to break across pages
  show figure: set block(breakable: true)
  // Make images sticky to avoid splitting
  show figure.where(kind: "image"): set block(sticky: true)

  // Table paragraph and border settings
  show table: set par(leading: 1em, spacing: 1em)
  set table(stroke: none)

  set math.equation(supplement: [Eq.])
  show math.equation: i-figured.show-equation.with(numbering: "(1.1)")

  show heading: i-figured.reset-counters
  show figure: i-figured.show-figure

  show: show-theorion

  // Add metadata for total words and characters (for thesis statistics)
  context [
    #metadata(state("total-words-cjk").final()) <total-words>
    #metadata(state("total-characters").final()) <total-chars>
  ]

  body
}
