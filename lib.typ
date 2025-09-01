#import "@preview/tidy:0.4.3"
#import "layouts/appendix.typ": *
#import "layouts/doc.typ": *
#import "layouts/frontmatter.typ": *
#import "layouts/mainmatter.typ": *
#import "pages/cover-phd.typ": cover-phd
#import "pages/declare-phd.typ": declare-phd
#import "pages/table-of-contents.typ": table-of-contents, list-of-images, list-of-tables, list-of-algorithms
#import "utils/symbols.typ": *

/// Typst thesis template for University of Macau
///
/// - doctype (): 
/// - date (): 
/// - lang (): 
/// - double-sided (): 
/// - print (): 
/// - info (): 
/// -> 
#let documentclass(
  /// Type of thesis
  /// -> "doctor" | "master" | "bachelor"
  doctype: "doctor",
  /// -> datetime
  date: datetime.today(),
  /// Language of the thesis
  /// -> "en" | "zh" | "pt"
  lang: "en",
  /// Enable double-sided printing
  /// for Doctoral theses, double-sided printing is required (i.e. please set to true)
  /// for Master's and Bachelor's theses though, single-sided printing is strongly recommended, double-sided printing is still allowed
  /// -> bool
  double-sided: true,
  /// Add margins to binding side for printing
  /// -> bool
  print: true,
  info: (:),
) = {
  if not ("doctor", "master", "bachelor").contains(doctype) {
    panic("Invalid document type. Please select one of the following document types: doctor, master, bachelor.")
  }
  if not ("en", "zh", "pt").contains(lang)  {
    panic("Invalid language. Please select one of the following languages: en, zh, pt.")
  }

  return (
    doctype: doctype,
    date: date,
    lang: lang,
    double-sided: double-sided,
    print: print,
    info: info,
    // Layouts
    doc: (..args) => {
      doc(
        ..args,
        doctype: doctype,
        double-sided: double-sided,
        print: print,
        info: info + args.named().at("info", default: (:)),
      )
    },
    frontmatter: (..args) => {
      frontmatter(
        ..args,
        doctype: doctype,
        lang: lang,
      )
    },
    mainmatter: (..args) => {
      mainmatter(
        ..args,
        doctype: doctype,
        lang: lang,
      )
    },
    appendix: (..args) => {
      appendix(
        ..args,
        doctype: doctype,
        lang: lang,
      )
    },
    // Pages
    cover: (..args) => {
      if doctype == "doctor" {
        cover-phd(
          ..args,
          lang: lang,
          info: info + args.named().at("info", default: (:)),
          date: date,
        )
      } else {
        cover-page(
          ..args,
          doctype: doctype,
          info: info + args.named().at("info", default: (:)),
          date: date,
        )
      }
    },
    declare: (..args) => {
      declare-phd(
        ..args,
        lang: lang,
        double-sided: double-sided,
      )
    },
    table-of-contents: (..args) => {
      table-of-contents(
        ..args,
      )
    },
    list-of-images: (..args) => {
      list-of-images(
        ..args,
      )
    },
    list-of-tables: (..args) => {
      list-of-tables(
        ..args,
      )
    },
    list-of-algorithms: (..args) => {
      list-of-algorithms(
        ..args,
      )
    },
    list-of-abbreviations: (..args) => {
      list-of-abbreviations(
        ..args,
      )
    },
  )
}
