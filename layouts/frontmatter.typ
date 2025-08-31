#let frontmatter(
  doctype: "doctor",
  lang: "en",
  body,
) = {
  // Required format settings
  set page(numbering: "i")
  counter(page).update(1)
  set heading(numbering: none) // Omit numbering for first level headings
  // doctype specific settings
  set outline(
    depth: 3,
    indent: n => calc.max(0, n - 1) * 2.5em,
  ) if doctype == "doctor"
  set outline(
    depth: 4,
    indent: 3em,
  ) if doctype == "master"

  // Custom format settings
  show outline.entry.where(level: 1): set text(
    weight: if doctype == "doctor" { "bold" } else { "regular" },
  )

  body
}
