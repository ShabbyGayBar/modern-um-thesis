#import "@preview/i-figured:0.2.4"

#let table-of-contents(
  depth: 3,
) = {
  outline(depth: depth)
}

#let list-of-images() = {
  i-figured.outline(target-kind: "image")[
    #if lang == "zh" [插图目录] else if lang == "pt" [Lista de Figuras] else [List of Figures]
  ]
}

#let list-of-tables() = {
  i-figured.outline(target-kind: "table")[
    #if lang == "zh" [表格目录] else if lang == "pt" [Lista de Tabelas] else [List of Tables]
  ]
}

#let list-of-algorithms() = {
  i-figured.outline(target-kind: "algorithm")[
    #if lang == "zh" [算法目录] else if lang == "pt" [Lista de Algoritmos] else [List of Algorithms]
  ]
}

#let list-of-abbreviations() = {
  i-figured.outline(target-kind: "abbreviation")[
    #if lang == "zh" [缩略词目录] else if lang == "pt" [Lista de Abreviações] else [List of Abbreviations]
  ]
}
