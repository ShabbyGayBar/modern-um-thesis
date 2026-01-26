/// List of Figures
///
/// -> content
#let outline-image(
  /// Language of the thesis
  ///
  /// -> "en" | "zh" | "pt"
  lang: "en",
) = {
  // Restore default formatting for titles
  show outline.entry: it => link(
    it.element.location(),
    it.indented(it.prefix(), it.inner()),
  )
  show outline: set heading(outlined: true)
  outline(
    target: figure.where(kind: image),
    title: if lang == "zh" [插圖目錄] else if lang == "pt" [Lista de Figuras] else [List of Figures],
  )
}

/// List of Tables
///
/// -> content
#let outline-table(
  /// Language of the thesis
  ///
  /// -> "en" | "zh" | "pt"
  lang: "en",
) = {
  // Restore default formatting for titles
  show outline.entry: it => link(
    it.element.location(),
    it.indented(it.prefix(), it.inner()),
  )
  show outline: set heading(outlined: true)
  outline(
    target: figure.where(kind: table),
    title: if lang == "zh" [表格目錄] else if lang == "pt" [Lista de Tabelas] else [List of Tables],
  )
}

/// List of Tables and Figures
///
/// -> content
#let outline-table-image(
  /// Language of the thesis
  ///
  /// -> "en" | "zh" | "pt"
  lang: "en",
) = {
  // Restore default formatting for titles
  show outline.entry: it => link(
    it.element.location(),
    it.indented(it.prefix(), it.inner()),
  )
  show outline: set heading(outlined: true)
  outline(
    target: figure.where(kind: image),
    title: if lang == "zh" [圖表目錄] else if lang
      == "pt" [Lista de Tabelas e Figuras] else [List of Tables and Figures],
  )
  outline(
    target: figure.where(kind: table),
    title: none,
  )
}
