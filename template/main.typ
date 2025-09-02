#import "../lib.typ": *

#let (
  // Metadata
  doctype,
  date,
  lang,
  info,
  // Layouts
  double-sided,
  doc,
  frontmatter,
  mainmatter,
  appendix,
  // Pages
  cover,
  declare,
  table-of-contents,
  list-of-images,
  list-of-tables,
  list-of-algorithms,
  list-of-abbreviations,
) = documentclass(
  doctype: "doctor",
  date: datetime.today(),
  lang: "en",
  double-sided: true,
  print: true,
  info: (
    title-en: [Title of Thesis],
    title-zh: [论文标题],
    title-pt: [Título da Tese],
    author-en: [Name of Author],
    author-zh: [作者姓名],
    author-pt: [Nome do Autor],
    degree-en: [Degree Title],
    degree-zh: [学位名称],
    degree-pt: [Doutorado],
    academic-unit-en: [Name of Academic Unit],
    academic-unit-zh: [学术单位名称],
    academic-unit-pt: [Nome da Unidade Acadêmica],
    supervisor-en: [Name of Supervisor],
    supervisor-zh: [导师姓名],
    supervisor-pt: [Nome do Supervisor],
    co_supervisor-en: [Name of Co-Supervisor],
    co_supervisor-zh: [共同导师姓名],
    co_supervisor-pt: [Nome do Co-Supervisor],
    department-en: [Name of Department],
    department-zh: [系名称],
    department-pt: [Nome do Departamento],
  ),
)

#show: doc

#cover()

#show: frontmatter

= Acknowledgements

= Abstract

#lorem(250)

#declare(
  // confidentialty-level: "internal", // 保密级别: "public" | "internal" | "secret" | "confidential"
  // confidentialty-year: 2, // 保密年份数，请根据保密级别的要求填写
  date: datetime.today(),
  // original-statement-sign: place(dx: 13cm, dy: -1.3cm, image("figures/student-sign.png", height: 2em)),
  // authorization-author-sign: place(dx: 5cm, dy: -1.3cm, image("figures/student-sign.png", height: 2em)),
  // supervisor-sign: place(dx: 4cm, dy: -1.2cm, image("figures/supervisor-sign.png", height: 2em)),
)

#outline(title: [Table of Contents])

// #image-outline() // 插图目录，按需设置

// #table-outline() // 表格目录，按需设置

// #algorithm-outline() // 算法目录，按需设置

#show: mainmatter
// #show: word-count-cjk // 正文字数统计

= Introduction <introduction>

This thesis presents the research on...

== Second level heading <2nd-level-heading>

=== Third level heading <3rd-level-heading>

==== Fourth level heading <4th-level-heading>

#lorem(100)

== Footnotes <footnotes>

#lorem(10)#footnote()[#lorem(20)]

== Font <font>

The University of Macau (UM) is a comprehensive research-oriented public university of international standing. Since her establishment in 1981, UM has been dedicated to providing a multifaceted education through our unique educational model and residential college system and in accordance with the university motto: Humanity, Integrity, Propriety, Wisdom and Sincerity.

*In recent years, UM has been taking initiatives for a comprehensive and structural reform and entered a new era of unprecedented growth. We are pleased to see that our progress is being recognised globally as listed in the Times Higher Education World University Rankings and through our growing partnership with top academic institutions both at home and abroad. Locally, UM is the first institution to be awarded the Medal of Merit-Education by the Macao SAR government in recognition of the efforts and contributions of the university’s staff and students. We are confident that the rising reputation of UM will enable us to scale new heights in the international academic circles.*

_On behalf of UM, I would like to invite you to browse our website to get a better sense of our academic programmes and latest development. Also, I would like to welcome you to visit our gorgeous campus where you can see our strengths and advantages, interact with us, and experience the uniqueness of the UM community._

= Math And Citations <math-and-citations>

== Math <math>

=== Numbers and Units <numbers-and-units>

Numbers and units support are provided by `unify`:

- #num("12 345.678 90")
- #num("0.3e45")
- #unit("kg m s^-1")
- #unit("um") $unit("um")$
- #unit("ohm") $unit("ohm")$
- #qty("0.13", "mm")
- #numrange("10", "20")
- #qtyrange("10", "20", "celsius")

Typst also has special syntax and library functions to typeset mathematical formulas.

- $1 plus.minus 2 ii$
- $1.654 times 2.34 times 3.430$

=== Mathematical Symbols And Formulas <mathematical-symbols-and-formulas>

According to ISO 80000-2:2019, an explicitly defined function not depending on the context is printed in upright type, e.g. $sin$, $exp$, $ln$, $Gamma$.

While mathematical constants, the values of which never change, are printed in upright type, e.g. $ee = num("2.718281828") dots$; $uppi = num("3.141592") dots$; $ii^2 = -1$.

Well-defined operators are also printed in upright type, e.g. $div$, $partial$ in $partial x$ and each $dif$ in $(dif f)/(dif x)$. 

Formulas should be centered on a new line. Each formula should be numbered sequentially by chapter, with the number aligned to the right.

$ ee^(ii uppi) + 1 = 0 $

$ (dif^2 u)/(dif t^2) = integral f(x) dif x $

The end of the formula needs punctuation, whether a comma or a period, depending on the following sentence.

$
  (2h)/uppi integral_0^infinity sin(omega delta)/omega cos(omega x) dif omega
  = cases(h", "&abs(x) < delta ",", h/2", "&x=plus.minus delta",", 0", "&abs(x) > delta ".")
$

When the formula is long, it is best to break the line at the equal sign "=".

$
  &I(X_3; X_4) - I(X_3; X_4 | X_1) - I(X_3; X_4 | X_2)\
  = &[I(X_3; X_4) - I(X_3; X_4 | X_1)] - I(X_3; X_4 | accent(X, tilde)_2)\
  = &I(X_1; X_3; X_4) - I(X_3; X_4 | accent(X, tilde)_2). 
$

If breaking the line at the equal sign is difficult to achieve, you can also break the line at the $+$, $-$, $times$, $div$ operators. When breaking the line, the operator should only be written in front of the broken line and not repeated.

$
  1/2 Delta(f_(i j)f^(i j)) = 2(sum_(i<j) chi_(i j) (sigma_i - sigma_j)^2 + f^(i j) gradient_j gradient_i (Delta f)\
  + gradient_k f_(i j) gradient^k f^(i j) + f^(i j) f^k [2 gradient_i R_(j k) - gradient_k R_(i j)]).
$

=== Theorems <theorems>

`Theorion` is used in this template to set up environments for theorems, lemmas, and propositions.

Here is an example for a theorem:

#theorem(title: "Residue theorem")[
   Let $U$ be a simply connected open subset of the complex plane containing a finite list of points $a_1, dots, a_n, U_0 = U without {a_1, dots, a_n}$ and a function $f$ holomorphic on $U_0$. Letting $gamma$ be a closed rectifiable curve in $U_0$, and denoting the residue of $f$ at each point $a_k$ by Res ⁡ ( f , a k ) {\displaystyle \operatorname $"Res"(f, a_k)}$ and the winding number of $gamma$ around $a_k$ by $upright(*I*)(gamma, a_k)$, the line integral of $f$ around $gamma$ is equal to $2 uppi ii$ times the sum of residues, each counted as many times as $gamma$ winds around the respective point:

   _To be continued_
]

== Notation Of References <notation-of-references>

= Floats <floats>

= Conclusion <conclusion>

The conclusion drawn from this research is...

#bibliography("./ref.bib", full: true, style: "apa")

#show: appendix

= Maxwell Equations <maxwell-equations>

= Flow Charts <flow-charts>
