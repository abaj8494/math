// imports
#import "@preview/drafting:0.2.2": *
#import "@preview/thmbox:0.2.0": *
#import "@preview/marge:0.1.0": sidenote
#import "@preview/hydra:0.6.1": hydra
#import "@preview/cetz:0.3.4"

// math inline bounding box definitions
#show math.equation.where(block: false): it => box(
  it,            // keep the original math
  height: auto,
  // debug:
  //fill: red, 
  //stroke: blue
)
//#show math.equation.where(block: false): math.equation.with(block: true)
// thmbox initialisation
#show: thmbox-init(counter-level: 2)

#let def-counter = counter("def")
#show: sectioned-counter(def-counter, level: 3)

#let defbox = note.with(
  numbering: "1.1.1",
  counter: def-counter,          
  fill: rgb("#f8f8f8"),
  border: (paint: rgb("#787878"), thickness: 0.8pt),
  radius: 3pt,
  inset: (x: 0.8em, y: 0.6em),
)

// link colours
#show link: set text(fill: blue)
#show link: underline
// convenience math commands / aliases
#let iff = $<==>$
#let imp = $==>$
#let ve(body) = {
  $op(upright(bold(body)))$
}
#let abs(body) = $bar.v #body bar.v$
#let norm(body, p: none) = {
  if p == none {
    $bar.v.double #body bar.v.double$
  } else {
    $bar.v.double #body bar.v.double_(#p)$
  }
}
#let scr(it) = text(
  features: ("ss01",),
  box($cal(it)$),
)

// font sizes
#show math.equation: set text(14pt)
#set text( size: 14pt )

#set document(title: "Catalogue of Scalar Valued Functions", author: "Aayush Bajaj")

#align(center)[
  #block(text(weight: "bold", size: 24pt)[Scalar Valued Functions])
  #v(1em)
  #text(weight: "bold", size: 20pt)[Aayush Bajaj]
  #v(1em)
  #text(size: 16pt)[Version 0.1]
  #v(1em)
  #text(size: 16pt)[#datetime.today().display()]
  #v(1em)
  #set par(justify: false)
  *Abstract* \
  Whilst the author believes the raison d'être of this manuscript is obvious, they 
  do not believe that the scope is.

  The _Theory of Functions_ is rich and central to Mathematics. As such, we limit our scope here to definitions and graphs of univariate functions $f: RR -> RR$. Whilst we include common equalities between different functions - say circular and exponential - what you will not find here are derivations of any sort. You will *not* find proofs *nor* set theoretic discussions of "jectivities", binary relations, etc. Furthermore there is a purposeful lack of rigour in this /catalogue/; theorems are asserted as is, with no warranty and no proof. Finally, analytic concerns of limits and convergence are also dutifuly ignored.
  #image("crest.svg", width: 60%)
]

#pagebreak()
#set page(
  numbering: "1",
)

#outline(title: "Table of Contents")

#pagebreak()

#set heading(numbering:"1.")
#set math.equation(numbering: "(1)")
#set page(
  header: context{
    align(left, emph(hydra(1)))
  }
)

// some reference ways: @algebraic[words] ; #ref(<algebraic>); #link(<elementary>)[word]

= Elementary <elementary>
These such functions are continuous on their domains and include taking *sums*, *products*, *roots* and *compositions* of finitely many #link(<algebraic>)[algebraic] or #link(<transcendental>)[transcendental] functions.
== Algebraic <algebraic>

=== Polynomials

$ p(x) &= a_n x^n + a_(n-1)x^(n-1) + dots.h + a_2 x^2 + a_0 
&= sum^n_(k=0) a_k x^k $

todo polynomial subplot grid from x^0 to x^7.

=== Rational
Much in the same way that $QQ$ is defined as any element $a/b$ where $a,b in ZZ$: 
#align(center)[#image("sets.svg", width: 30%)]

a function $f$ is called a rational function if it can be written in the form:
$ f(x) = (P(x))/(Q(x)) $
where $P(x)$ and $Q(x)$ are polynomial functions of $x$ and $Q$ is not the zero function.


== Transcendental <transcendental>
=== Exponential
=== Logarithm
=== Trigonometric
=== Inverse Trigonetric
=== Hyperbolic 
=== Inverse Hyperbolic
#pagebreak()
= Non-Elementary
== Gamma
== Error

$ op("erf")(x) = 2 / sqrt(Pi) integral^x_0 e^((-t)^2) dif t $
== Elliptic
== Bessel
== Riemann Zeta
== Fresnel

$ op("S")(x) = integral^x_0 sin(t^2) dif t, thick op("C")(x) = integral^x_0 cos(t^2) dif t $
#pagebreak()
= Discontinuous
== Absolute Value
== Step
=== Heaviside
=== Floor
=== Ceiling
=== Square Wave
