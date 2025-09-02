#import "@preview/i-figured:0.2.4"
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

  // Set chapter prefix
  set heading(
    numbering: if doctype == "master" {
      if lang == "zh" {
        numbly("第{1:一}章")
      } else if lang == "pt" {
        numbly("Capítulo {1}")
      } else {
        numbly("Chapter {1}")
      }
    } else {
      if lang == "zh" {
        numbly("第{1:一}章：")
      } else if lang == "pt" {
        numbly("CAPÍTULO {1}:")
      } else {
        numbly("CHAPTER {1}:")
      }
    }
  )

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
