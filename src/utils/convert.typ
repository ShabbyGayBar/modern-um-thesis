/// Converts a value to a string representation.
///
/// -> str
#let to-str(it) = {
  if type(it) == str {
    it
  } else if type(it) != content {
    str(it)
  } else if it.has("text") {
    it.text
  } else if it.has("children") {
    it.children.map(to-str).join()
  } else if it.has("body") {
    to-str(it.body)
  } else if it == [ ] {
    " "
  }
}

/// Converts a name string/content to format SURNAME, Given Names.
///
/// The final whitespace-separated word is the surname. All preceding words
/// are given names, with their spelling and capitalization preserved.
/// Surrounding and repeated whitespace is removed. A single-word name is
/// uppercased without a comma; an empty name produces an empty string.
///
/// -> str
#let format-name(body) = {
  let name = to-str(body)
  if name == none {
    return ""
  }
  let name-parts = name.split(regex("\\s+")).filter(part => part != "")
  if name-parts.len() == 0 {
    return ""
  }
  let surname = upper(name-parts.pop())
  if name-parts.len() == 0 {
    surname
  } else {
    surname + ", " + name-parts.join(" ")
  }
}
