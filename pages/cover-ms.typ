#import "../utils/line.typ": *

/// Generate cover page for Master's thesis
///
/// This is a replica of the thesis cover .doc file provided by University of Macau
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
  /// Thesis information, including:
  ///
  /// -> dictionary
  info: (:),
) = {
  set page(margin: (top: 1.5in, bottom: 1.2in, left: 1.5in, right: 1.5in))
  set par(leading: 0.5em, spacing: 0.5em, justify: true)
  set align(center)
  set pagebreak(weak: true, to: if double-sided { "odd" })

  ////////////////
  // Cover page //
  ////////////////
  set text(size: 14pt)

  grid(
    columns: 1,
    gutter: (
      1.38cm + 0.5em,
      0.74cm + 0.5em,
      0.99cm + 0.5em,
      4.94cm + 0.5em,
      4.94cm + 0.5em,
      0.64cm + 0.5em,
      0.5em,
    ),
    align: center + top,

    // Empty line
    text(size: 10pt)[\ ],
    // Title
    info.title-en,
    text(size: 12pt)[by],
    // Name
    info.author-en,
    // Degree Title
    info.degree-en,
    // Year
    [#datetime.today().year()],
    // University Logo
    image("../assets/um-logo-mono.png", width: 2.86cm),
    // Academic Unit
    info.academic-unit-en,
    [University of Macau],
  )

  pagebreak()

  ////////////////
  // Title page //
  ////////////////
  set text(size: 12pt)

  grid(
    columns: 1,
    gutter: (
      1.38cm + 0.5em,
      0.74cm + 0.5em,
      0.99cm + 0.5em,
      0.99cm + 0.5em,
      0.99cm + 0.5em,
      0.99cm + 0.5em,
      0em,
    ),
    align: center + top,

    // Empty line
    [\ ],
    // Thesis Title
    info.title-en,
    // Name of Author
    [by\ \
      #info.author-en\ \ \
      A thesis submitted in partial fulfillment of the\
      requirements for the degree of],
    // Degree Title
    info.degree-en,
    [#info.academic-unit-en\
      University of Macau],
    // Expected Degree Awarding Year
    [#datetime.today().year()],
    // Approval Signature
    [\ \ \ \ \ \
      #grid(
        columns: 2,
        rows: 7,
        row-gutter: (0cm, 0.49cm),
        align: (center + top),
        inset: 0.25em,

        grid.cell(
          x: 0,
          y: 0,
          colspan: 1,
          rowspan: 6,
        )[Approved by],
        uline(),
        [Supervisor],
        uline(),
        uline(),
        uline(),
        uline(),
        grid.cell(
          x: 0,
          y: 6,
          colspan: 2,
          rowspan: 1,
        )[Date#uline()],
      )
    ],
  )

  pagebreak()

  ////////////////
  // Quote Slip //
  ////////////////

  set text(size: 12pt)
  set align(left)

  let fill(width) = box(width: width, repeat(sym.space.nobreak))

  [\ \ \ \ In presenting this thesis in partial fulfillment of the requirements for a Master's degree at the University of Macau, I agree that the Library and the Faculty of Science and Technology shall make its copies freely available for inspection. However, reproduction of this thesis for any purposes or by any means shall not be allowed without my written permission.    Authorization is sought by contacting the author at\ \

    #h(1cm)
    Address:\ \

    #h(1cm)
    Telephone:\
    #h(1cm)
    Fax:\
    #h(1cm)
    E-mail:\ \ \

    #h(7.62cm)
    Signature: #uline()\ \
    #h(7.62cm)
    Date: #uline()]

  pagebreak()
}
