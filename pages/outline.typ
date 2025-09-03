#import "@preview/i-figured:0.2.4"

#let outline-image(lang: "en") = {
  if lang == "zh" [= 插图目录]
  else if lang == "pt" [= Lista de Figuras]
  else [= List of Figures]
  i-figured.outline(target-kind: image, title: none)
}

#let outline-table(lang: "en") = {
  if lang == "zh" [= 表格目录]
  else if lang == "pt" [= Lista de Tabelas]
  else [= List of Tables]
  i-figured.outline(target-kind: table, title: none)
}

#let outline-table-image(lang: "en") = {
  if lang == "zh" [= 图表目录]
  else if lang == "pt" [= Lista de Tabelas e Figuras]
  else [= List of Tables and Figures]
  i-figured.outline(target-kind: image, title: none)
  i-figured.outline(target-kind: table, title: none)
}
