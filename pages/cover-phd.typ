#import "../utils/naming.typ": format-name

/// Generate cover page for PhD thesis
///
/// -> content
#let cover-phd(
  /// Date of submission
  ///
  /// -> datetime
  date: datetime.today(),
  /// Language of the thesis
  ///
  /// -> "en" | "zh" | "pt"
  lang: "en",
  /// Enable double-sided printing
  ///
  /// -> bool
  double-sided: true,
  /// Thesis information, including:
  ///
  /// -> dictionary
  info: (:),
) = {
  // Normal margins for cover, title page and author's right page
  set page(margin: (top: 1in, bottom: 1in, left: 1in, right: 1in))
  set align(center)
  set pagebreak(weak: true, to: if double-sided { "odd" })

  ////////////////
  // Cover page //
  ////////////////

  grid(
    columns: 1,
    gutter: (1fr, 6em, 6em, 4em, 4em, 4em),
    align: center + top,

    // Thesis title
    if lang == "en" {
      [#info.title-en\ \ ]
    } else if lang == "zh" {
      [#info.title-zh\ #info.title-en]
    } else if lang == "pt" {
      [#info.title-pt\ #info.title-en]
    },
    // Name of Author
    if lang == "en" {
      [by\ #info.author-en]
    } else if lang == "zh" {
      [#info.author-zh\ #info.author-en]
    } else if lang == "pt" {
      [#par(leading: 1em, spacing: 0em)[por\ by\ ] #info.author-pt]
    },
    // Degree Title
    if lang == "en" {
      [#info.degree-en\ \ ]
    } else if lang == "zh" {
      [#info.degree-zh\ #info.degree-en]
    } else if lang == "pt" {
      [#info.degree-pt\ #info.degree-en]
    },
    // Year
    [#datetime.today().year()],
    // University Logo
    image(
      "../assets/um-logo.svg",
      width: 5cm,
    ),
    // Name of Academic Unit
    if lang == "en" {
      [#info.academic-unit-en\ \ ]
    } else if lang == "zh" {
      [#info.academic-unit-zh\ #info.academic-unit-en]
    } else if lang == "pt" {
      [#info.academic-unit-pt\ #info.academic-unit-en]
    },
    if lang == "en" {
      [University of Macau\ \ ]
    } else if lang == "zh" {
      [澳門大學\ University of Macau]
    } else if lang == "pt" {
      [Universidade de Macau\ University of Macau]
    },
  )

  pagebreak()

  ////////////////
  // Title page //
  ////////////////

  grid(
    columns: 1,
    gutter: 1fr,
    align: center + top,

    // Thesis Title
    if lang == "en" {
      [#info.title-en\ \ ]
    } else if lang == "zh" {
      [#info.title-zh\ #info.title-en]
    } else if lang == "pt" {
      [#info.title-pt\ #info.title-en]
    },
    // Name of Author
    if lang == "en" {
      [by\ #info.author-en]
    } else if lang == "zh" {
      [#info.author-zh\ #info.author-en]
    } else if lang == "pt" {
      [#par(leading: 1em, spacing: 0em)[por\ by\ ] #info.author-pt]
    },
    // Name of Supervisor
    if lang == "en" {
      [SUPERVISOR: #info.supervisor-en\ \ ]
    } else if lang == "zh" {
      [導師：#info.supervisor-zh\ SUPERVISOR: #info.supervisor-en]
    } else if lang == "pt" {
      [ORIENTADOR(A) / SUPERVISOR: #info.supervisor-pt\ \ ]
    },
    // Name of Co-supervisor(s) (if applicable)
    if lang == "en" {
      if "co_supervisor-en" in info {
        [CO-SUPERVISOR: #info.co_supervisor-en\ \ ]
      } else {
        []
      }
    } else if lang == "zh" {
      if "co_supervisor-zh" in info and "co_supervisor-en" in info {
        [副導師：#info.co_supervisor-zh\ CO-SUPERVISOR: #info.co_supervisor-en]
      } else {
        []
      }
    } else if lang == "pt" {
      if "co_supervisor-pt" in info {
        [CO-ORIENTADOR(A) / CO-SUPERVISOR: #info.co_supervisor-pt\ \ ]
      } else {
        []
      }
    },
    // Name of Department (if applicable)
    if lang == "en" {
      if "department-en" in info {
        [DEPARTMENT: #info.department-en\ \ ]
      } else {
        []
      }
    } else if lang == "zh" {
      if "department-zh" in info and "department-en" in info {
        [學系：#info.department-zh\ DEPARTMENT: #info.department-en]
      } else {
        []
      }
    } else if lang == "pt" {
      if "department-pt" in info and "department-en" in info {
        [DEPARTAMENTO: #info.department-pt\ DEPARTMENT: #info.department-en]
      } else {
        []
      }
    },
    // Degree Title
    if lang == "en" {
      [#info.degree-en\ \ ]
    } else if lang == "zh" {
      [#info.degree-zh\ #info.degree-en]
    } else if lang == "pt" {
      [#info.degree-pt\ #info.degree-en]
    },
    // Expected Degree Awarding Year
    [#datetime.today().year()],
    // Academic Unit
    if lang == "en" {
      [#info.academic-unit-en\ \ ]
    } else if lang == "zh" {
      [#info.academic-unit-zh\ #info.academic-unit-en]
    } else if lang == "pt" {
      [#info.academic-unit-pt\ #info.academic-unit-en]
    },
    if lang == "en" {
      [University of Macau\ \ ]
    } else if lang == "zh" {
      [澳門大學\ University of Macau]
    } else if lang == "pt" {
      [Universidade de Macau\ University of Macau]
    },
  )

  pagebreak()

  // Author’s right page.
  v(10cm - 1in) // 10 cm below top of page, accounting for page margin
  if lang == "pt" {
    [#datetime.today().year() por\ #format-name(info.author-pt)]
  } else {
    [#datetime.today().year() by\ #format-name(info.author-en)]
  }

  pagebreak()
}
