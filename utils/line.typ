/// A box that fills the available space with spaces
///
/// -> content
#let fill(width: 1fr) = box(width: width, repeat(sym.space.nobreak))

/// Fill the available space with an underline
///
/// -> content
#let uline(width: 1fr) = underline(fill(width: width))
// #let uline(width: 1fr) = box(width: width, line(length: 100%))

/// A horizontal line that stretches across the page
///
/// -> content
#let hline(width: 1fr) = line(length: 100%)
