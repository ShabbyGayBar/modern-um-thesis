#import "@preview/i-figured:0.2.4"
#import "@preview/numbly:0.1.0": numbly

#let appendix(
  doctype: "doctor",
  lang: "en",
  body,
) = {
  // Use "Appendix <ABC>: " as heading prefixes
  set heading(
    numbering: if lang == "zh" {
      numbly("附录{1:A}：", "{1:A}.{2}.")
    } else if lang == "pt" {
      numbly("Apêndice {1:A}:", "{1:A}.{2}.")
    } else {
      numbly("Appendix {1:A}:", "{1:A}.{2}.")
    },
  )
  counter(heading).update(0)

  show heading: i-figured.reset-counters
  show figure: i-figured.show-figure.with(numbering: "A.1")
  show math.equation: i-figured.show-equation.with(numbering: "(A.1)")

  body
}
