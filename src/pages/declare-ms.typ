#import "../utils/line.typ": *

/// Generate Quote Slip (declaration page) for Master thesis
///
/// You can simply call `#declare()` instead of `#declare-ms()`.
/// The document will automatically choose the correct declaration based on the `doctype` parameter.
///
/// -> content
#let declare-ms(
  /// -> datetime
  date: none,
  /// Language of the thesis
  ///
  /// -> "en" | "zh" | "pt"
  lang: "en",
  /// Enable double-sided printing
  ///
  /// -> bool
  double-sided: true,
  /// -> str | content
  address: none,
  /// -> str | content
  telephone: none,
  /// -> str | content
  fax: none,
  /// -> str | content
  email: none,
) = {
  set page(margin: (top: 1.5in, left: 1.5in, right: 1.5in))
  set par(leading: 0.15em, spacing: 0.15em, justify: true)
  set align(center)
  set pagebreak(weak: true, to: if double-sided { "odd" })

  set text(size: 12pt)
  set align(left)

  [#v(54pt) In presenting this thesis in partial fulfillment of the requirements for a Master's degree at the University of Macau, I agree that the Library and the Faculty of Science and Technology shall make its copies freely available for inspection. However, reproduction of this thesis for any purposes or by any means shall not be allowed without my written permission.    Authorization is sought by contacting the author at\ \

    #h(1cm)
    Address: #address\ \

    #h(1cm)
    Telephone: #telephone\
    #h(1cm)
    Fax: #fax\
    #h(1cm)
    E-mail: #email\ \ \

    #h(7.62cm)
    Signature: #uline()\ \
    #h(7.62cm)
    Date: #underline(if date == none { fill() } else { fill() + date.display() + fill() })]

  pagebreak()
}
