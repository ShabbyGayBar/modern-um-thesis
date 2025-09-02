#import "@preview/unify:0.7.1": *
#import "@preview/theorion:0.4.0": *
#import "layouts/appendix.typ": appendix
#import "layouts/doc.typ": doc
#import "layouts/frontmatter.typ": frontmatter
#import "layouts/mainmatter.typ": mainmatter
#import "pages/cover-phd.typ": cover-phd
#import "pages/declare-phd.typ": declare-phd
#import "pages/table-of-contents.typ": table-of-contents, list-of-images, list-of-tables, list-of-algorithms
#import "utils/symbols.typ": *

/// All functions and variables to be used in the Typst thesis template for University of Macau.
/// 
/// -> dictionary
#let documentclass(
  /// Type of thesis
  /// 
  /// -> "doctor" | "master" | "bachelor"
  doctype: "doctor",
  /// Date of submission
  /// 
  /// -> datetime
  date: datetime.today(),
  /// Language of the thesis
  /// 
  /// -> "en" | "zh" | "pt"
  lang: "en",
  /// Enable double-sided printing
  /// 
  /// For Doctoral theses, double-sided printing is required (i.e. please set to true).
  /// 
  /// For Master's and Bachelor's theses though, single-sided printing is strongly recommended, but double-sided printing is still allowed.
  /// 
  /// -> bool
  double-sided: true,
  /// Add margins to binding side for printing
  /// 
  /// In most cases, this should be set to true.
  /// 
  /// -> bool
  print: true,
  /// Thesis information, including:
  /// 
  /// `title-en`: Title of Thesis, *required*\
  /// `title-zh`: 论文标题\
  /// `title-pt`: Título da Tese\
  /// `author-en`: Name of Author, *required*\
  /// `author-zh`: 作者姓名\
  /// `author-pt`: Nome do Autor\
  /// `degree-en`: Degree Title, *required*\
  /// `degree-zh`: 学位名称\
  /// `degree-pt`: Doutorado\
  /// `academic-unit-en`: Name of Academic Unit, *required*\
  /// `academic-unit-zh`: 学术单位名称\
  /// `academic-unit-pt`: Nome da Unidade Acadêmica\
  /// `supervisor-en`: Name of Supervisor, *required*\
  /// `supervisor-zh`: 导师姓名\
  /// `supervisor-pt`: Nome do Supervisor\
  /// `co_supervisor-en`: Name of Co-Supervisor\
  /// `co_supervisor-zh`: 共同导师姓名\
  /// `co_supervisor-pt`: Nome do Co-Supervisor\
  /// `department-en`: Name of Department\
  /// `department-zh`: 系名称\
  /// `department-pt`: Nome do Departamento\
  /// 
  /// Apart from all *required* entries above, if you choose a language other than "en", you must also provide translations for all *required* entries in that language.
  /// 
  /// -> dictionary
  info: (:),
) = {
  if not ("doctor", "master", "bachelor").contains(doctype) {
    panic("Invalid document type. Please select one of the following document types: doctor, master, bachelor.")
  }
  if not ("en", "zh", "pt").contains(lang) {
    panic("Invalid language. Please select one of the following languages: en, zh, pt.")
  }
  
  return (
    // Metadata
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
