#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "@preview/theorion:0.4.0": *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/itemize:0.1.2" as el
#import "../utils/convert.typ": *
#import "../utils/numbering.typ": *

/// Document metadata & global settings
///
/// - info ():
/// - doctype ():
/// - double-sided ():
/// - print ():
/// - body ():
/// ->
#let doc(
  // documentclass 传入参数
  info: (:),
  doctype: "doctor",
  lang: "en",
  double-sided: true,
  print: true,
  body,
) = {
  set page(
    margin: if doctype == "doctor" {
      if not print {
        (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm)
      } else if double-sided {
        (top: 2.5cm, bottom: 2.5cm, inside: 4cm, outside: 2.5cm)
      } else {
        (top: 2.5cm, bottom: 2.5cm, left: 4cm, right: 2.5cm)
      }
    } else if doctype == "master" {
      if not print {
        (top: 1in, bottom: 1in, left: 1in, right: 1in)
      } else if double-sided {
        (top: 1in, bottom: 1in, inside: 1.5in, outside: 1in)
      } else {
        (top: 1in, bottom: 1in, left: 1.5in, right: 1in)
      }
    } else if doctype == "bachelor" {
      if not print {
        (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm)
      } else if double-sided {
        (top: 2.5cm, bottom: 2.5cm, inside: 4cm, outside: 2.5cm)
      } else {
        (top: 2.5cm, bottom: 2.5cm, left: 4cm, right: 2.5cm)
      }
    },
  )

  set text(
    font: ("Times New Roman", "Pmingliu"),
    size: 12pt,
    lang: lang,
  )
  set par(
    // Double-line spacing
    leading: 2em,
    spacing: 2em,
    // Enable first-line indent for Chinese
    first-line-indent: if lang == "zh" { (amount: 2em, all: true) } else { (amount: 0pt, all: false) },
  )
  show: show-cn-fakebold

  // Align first level headings to the center
  show heading.where(level: 1): set align(center)
  // Start a new page at every first level heading
  show heading.where(level: 1): body => {
    pagebreak(weak: true)
    if doctype == "master" {
      upper(body)
    } else {
      body
    }
  }
  // Double-line spacing for headings
  show heading: set block(above: 2em, below: 2em)

  // Custom format settings

  // Figure/image settings
  show figure.where(kind: image): set figure(supplement: [Fig.])
  show figure.caption: set text(weight: "bold")
  show figure.caption: set par(leading: 1em, justify: false)
  // Place table and algorithm captions above
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: "algorithm"): set figure.caption(position: top)
  // Allow figures to break across pages
  show figure: set block(breakable: true)
  // Make images sticky to avoid splitting
  show figure.where(kind: image): set block(sticky: true)
  // Table settings
  show table: set par(leading: 1em, spacing: 1em)
  set table(stroke: none)

  // List settings
  show ref: el.ref-enum
  show: el.default-enum-list
  show footnote.entry: set par(leading: 1em, spacing: 1em)
  show list: set par(leading: 1em)
  show enum: set par(leading: 1em)

  set math.equation(supplement: none)

  show: show-theorion

  show ref: it => {
    let el = it.element
    if el == none {
      it
    } else if el.func() == heading and el.level == 1 {
      link(el.location(), numbering(
        numbly(pattern-heading-first-level(lang: lang, supplement: el.supplement)),
        ..counter(heading).at(el.location()),
      ))
    } else {
      it
    }
  }

  // Document metadata
  set document(
    title: info.title-en,
    author: if lang == "zh" {
      to-str(info.author-zh)
    } else if lang == "pt" {
      to-str(info.author-pt)
    } else {
      to-str(info.author-en)
    },
  )

  body
}
