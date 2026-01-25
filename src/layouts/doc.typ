#import "@preview/cuti:0.4.0": show-cn-fakebold
#import "@preview/itemize:0.2.0" as el
#import "@preview/numbly:0.1.0": numbly
#import "../utils/convert.typ": *
#import "../utils/numbering.typ": *

/// Document metadata & global settings
///
/// -> content
#let doc(
  /// Date of submission
  ///
  /// -> datetime
  date: datetime.today(),
  /// Type of thesis
  ///
  /// -> "doctor" | "master" | "bachelor"
  doctype: "doctor",
  /// Language of the thesis
  ///
  /// -> "en" | "zh" | "pt"
  lang: "en",
  /// Enable double-sided printing
  ///
  /// -> bool
  double-sided: true,
  /// Add margins to binding side for printing
  ///
  /// -> bool
  print: true,
  /// Thesis information
  ///
  /// -> dictionary
  info: (:),
  /// -> content
  body,
) = {
  set page(margin: if doctype == "doctor" {
    if not print {
      (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm)
    } else if double-sided {
      (top: 2.5cm, bottom: 2.5cm, inside: 4cm, outside: 2.5cm)
    } else {
      (top: 2.5cm, bottom: 2.5cm, left: 4cm, right: 2.5cm)
    }
  } else if doctype == "master" {
    if not print {
      (top: 1.5in + 22pt, bottom: 1in, left: 1in, right: 1in)
    } else if double-sided {
      (top: 1.5in + 22pt, bottom: 1in, inside: 1.5in, outside: 1in)
    } else {
      (top: 1.5in + 22pt, bottom: 1.71in, left: 1.5in, right: 1in)
    }
  } else if doctype == "bachelor" {
    if not print {
      (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm)
    } else if double-sided {
      (top: 2.5cm, bottom: 2.5cm, inside: 4cm, outside: 2.5cm)
    } else {
      (top: 2.5cm, bottom: 2.5cm, left: 4cm, right: 2.5cm)
    }
  })
  set text(
    font: ("Times New Roman", "Pmingliu"),
    size: 12pt,
    lang: lang,
    top-edge: 1em,
    bottom-edge: 0em,
  )
  set par(
    justify: true,
    // 0.15em: single line spacing in MS Word
    // 0.66em: 1.5 line spacing in MS Word
    // 1.29em: double line spacing in MS Word
    leading: if doctype == "doctor" { 1.29em } else { 0.66em },
    spacing: 1.29em,
    // Enable first-line indent for Chinese
    first-line-indent: if lang == "zh" { (amount: 2em, all: true) } else { (amount: 0pt, all: false) },
  )
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
  // Remove strong text from headings
  show heading: set text(weight: "regular") if doctype == "master"
  // Double-line spacing for headings
  show heading: set block(above: 1.29em, below: 0.66em)
  show heading.where(level: 1): set block(below: 46pt)
  show heading.where(level: 2): set block(above: 1.29em + 18pt, below: 0.66em + 6pt)
  show heading.where(level: 3): set block(above: 1.29em + 12pt, below: 0.66em + 3pt)
  show heading.where(level: 4): set block(above: 1.29em + 6pt, below: 0.66em + 6pt) if doctype == "master" // Weird setting
  // Change bibliography title to "References"
  set bibliography(title: "References") if doctype == "doctor"

  show: show-cn-fakebold

  ////////////////////////////
  // Custom format settings //
  ////////////////////////////

  // Figure/image settings

  // Use short supplement for figures and subfigures.
  show figure.where(kind: image): set figure(supplement: [Fig.])
  show figure.where(kind: image): set figure.caption(separator: [. ])
  show figure.where(kind: "subfigure"): set figure(supplement: [Fig.])
  // Figure captions settings
  show figure.caption: set text(weight: "bold")
  // Decrease spacing in figure captions
  show figure.caption: set par(leading: 0.15em, justify: false)
  // Place table and algorithm captions above
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: "algorithm"): set figure.caption(position: top)
  // Allow figures to break across pages
  show figure: set block(breakable: true)
  // Make images sticky to avoid splitting
  show figure.where(kind: image): set block(sticky: true)

  // Table settings

  set table(stroke: none)
  // Decrease spacing in table contents
  show table: set par(leading: 0.15em, spacing: 0.66em)

  // List settings

  // Fix bug when line is too tall
  show ref: el.ref-enum
  show: el.default-enum-list
  // Decrease spacing in table contents
  show footnote.entry: set par(leading: 0.15em, spacing: 0.66em)
  show list: set par(leading: 0.15em)
  show enum: set par(leading: 0.15em)

  set math.equation(number-align: end + bottom, supplement: none)

  // Override ref formatting for chapter/appendix headings
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
    date: date,
  )

  body
}
