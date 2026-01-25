/// Generate thesis abstract page
///
/// When `doctype` is "master", this is a replica of the thesis abstract .doc file provided by University of Macau
///
/// When `doctype` is "doctor" or "bachelor", this is merely a header
///
/// -> content
#let abstract(
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
  /// Thesis information
  ///
  /// -> dictionary
  info: (:),
  /// Thesis keywords (only listed in metadata)
  ///
  /// -> list of string
  keywords: (),
  /// -> content
  body,
) = {
  let keywords-str = {
    if lang == "en" {
      [*Keywords:* #keywords.join(", ")]
    } else if lang == "zh" {
      [*關鍵詞：* #keywords.join("、")]
    } else if lang == "pt" {
      [*Palavras-chave:* #keywords.join(", ")]
    }
  }

  if doctype == "master" {
    set page(margin: (top: 1.5in))
    set par(leading: 0.15em, spacing: 1.29em, justify: true)
    set align(center)
    set pagebreak(weak: true, to: if double-sided { "odd" })
    set text(size: 12pt)

    grid(
      columns: 1,
      gutter: (
        0.15em + 12pt,
        1.29*14pt + 18pt,
        1.29*14pt + 6pt,
        0.15em + 14pt,
        1.29em,
        0.15em,
        0.15em + 28pt,
      ),
      align: center + top,

      // Empty line
      v(11pt),
      text(size: 14pt)[University of Macau],
      text(size: 14pt)[Abstract],
      // Thesis Title
      upper(info.title-en),
      // Name of Author
      [by #info.author-en],
      [Thesis Supervisor: #info.supervisor-en],
      // Degree Title
      info.degree-en,
      {
        set par(leading: 0.66em)
        set align(left)
        body
        parbreak()
        keywords-str
      },
    )

    pagebreak()
  } else {
    heading(level: 1, numbering: none)[
      #if lang == "en" {
        [Abstract]
      } else if lang == "zh" {
        [摘要]
      } else if lang == "pt" {
        [Resumo]
      }]

    body
    parbreak()
    keywords-str
  }

  set document(
    description: body,
    keywords: keywords,
  )
}
