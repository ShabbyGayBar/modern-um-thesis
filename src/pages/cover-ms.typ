#import "../utils/line.typ": *

/// Generate cover page for Master's thesis
///
/// This is a replica of the thesis cover .doc file provided by University of Macau
/// 
/// You can simply call `#cover()` instead of `#cover-ms()`.
/// The document will automatically choose the correct cover based on the `doctype` parameter.
///
/// -> content
#let cover-ms(
  /// Date of submission
  ///
  /// -> datetime
  date: datetime.today(),
  /// Enable double-sided printing
  ///
  /// -> bool
  double-sided: true,
  /// Thesis information
  ///
  /// -> dictionary
  info: (:),
) = {
  set page(
    margin: (top: 1.5in, bottom: 1in),
    header: none,
    footer: none,
  )
  set par(leading: 0.15em, spacing: 0.15em, justify: true)
  set align(center)
  set pagebreak(weak: true, to: if double-sided { "odd" })

  ////////////////
  // Cover page //
  ////////////////
  set text(size: 14pt)
  page(
    margin: (left: 1in, right: 1in),
    grid(
      columns: 1,
      gutter: (
        0.66em + 39pt,
        0.15em + 21pt,
        0.15em + 28pt,
        1fr,
        0.66em + 142pt,
        0.66em + 20pt,
        0em,
        0.15em,
        0em,
      ),
      align: center + horizon,

      v(7pt),
      // Title
      strong(info.title-en),
      text(size: 12pt)[by],
      // Name
      strong(info.author-en),
      // Degree Title
      strong(info.degree-en),
      // Year
      [#datetime.today().year()],
      // University Logo
      image("../assets/UM-Logo_Monotone.png", height: 77pt),
      // Academic Unit
      strong(info.academic-unit-en),
      [*University of Macau*],
      v(39pt),
    ),
  )

  ////////////////
  // Title page //
  ////////////////
  set text(size: 12pt)

  grid(
    columns: 1,
    gutter: (
      0.66em + 39pt,
      0.15em + 21pt,
      1.29em,
      1.29em,
      0.15em,
      0.15em + 28pt,
      0.15em + 28pt,
      0.15em,
      0.15em + 28pt,
      1fr,
      0em,
    ),
    align: center + top,

    // Empty line
    [\ ],
    // Thesis Title
    info.title-en,
    // Name of Author
    [by],
    [#info.author-en],
    [\ ],
    [A thesis submitted in partial fulfillment of the\
      requirements for the degree of],
    // Degree Title
    info.degree-en,
    // Name of Academic Unit
    [#info.academic-unit-en],
    [University of Macau],
    // Expected Degree Awarding Year
    [#date.year()],
    // Approval Signature
    [
      #grid(
        columns: 3,
        rows: 7,
        row-gutter: (0.15em, 1.29em),
        align: (center + top),

        grid.cell(
          x: 0,
          y: 0,
          colspan: 1,
          rowspan: 5,
        )[Approved by],
        uline(),
        grid.cell(
          x: 2,
          y: 0,
          colspan: 1,
          rowspan: 7,
        )[#h(0.6in)],
        [Supervisor],
        uline(),
        uline(),
        uline(),
        grid.cell(
          x: 0,
          y: 5,
          colspan: 2,
          rowspan: 1,
        )[Date#uline()],
      )
    ],
    v(63pt)
  )

  pagebreak()
}
