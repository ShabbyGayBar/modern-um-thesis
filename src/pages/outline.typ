#import "@preview/i-figured:0.2.4"
#import "../utils/convert.typ": *

#let outline-image(lang: "en") = {
  if lang == "zh" [= 插图目录] else if lang == "pt" [= Lista de Figuras] else [= List of Figures]

  // Restore default formatting for titles
  show outline.entry: it => link(
    it.element.location(),
    it.indented(it.prefix(), it.inner()),
  )

  i-figured.outline(target-kind: image, title: none)
}

#let outline-table(lang: "en") = {
  if lang == "zh" [= 表格目录] else if lang == "pt" [= Lista de Tabelas] else [= List of Tables]

  // Restore default formatting for titles
  show outline.entry: it => link(
    it.element.location(),
    it.indented(it.prefix(), it.inner()),
  )

  i-figured.outline(target-kind: table, title: none)
}

#let outline-table-image(lang: "en") = {
  if lang == "zh" [= 图表目录] else if lang == "pt" [= Lista de Tabelas e Figuras] else [= List of Tables and Figures]

  // Restore default formatting for titles
  show outline.entry: it => link(
    it.element.location(),
    it.indented(it.prefix(), it.inner()),
  )

  i-figured.outline(target-kind: image, title: none)
  i-figured.outline(target-kind: table, title: none)
}
