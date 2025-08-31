/// Converts a string to camel case format.
///
/// -> str
#let camel-case(body) = {
  body.split(" ").map(word => upper(word.at(0)) + lower(word.slice(1))).join("")
}

/// Converts a name string/content to format SURNAME, Given Name
/// -> str
#let format-name(body) = {
  let name_parts = body.split(" ")
  let surname = name_parts.first()
  let given_name = name_parts.last()
  upper(surname) + ", " + camel-case(given_name)
}