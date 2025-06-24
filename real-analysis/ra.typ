#import "@preview/drafting:0.2.2": *
#import "@preview/thmbox:0.2.0": *
#import "@preview/marge:0.1.0": sidenote
#import "@preview/hydra:0.6.1": hydra

#show math.equation.where(block: false): it => box(
  it,            // keep the original math
  height: auto,
  // debug:
  //fill: red, 
  //stroke: blue
)
//#show math.equation.where(block: false): math.equation.with(block: true)
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

#show math.equation: set text(14pt)
#set text( size: 14pt )

#show: thmbox-init()

#set document(title: "Real Analysis", author: "Aayush Bajaj")

#align(center)[
  #v(2em)
  #block(text(weight: "bold", size: 24pt)[Real Analysis])
  #v(2em)
  #text(weight: "bold", size: 20pt)[Aayush Bajaj]
  #v(1em)
  #text(size: 16pt)[Version 1.0]
  #v(1em)
  #text(size: 16pt)[#datetime.today().display()]
  #v(4em)
  #image("crest.svg", width: 90%)
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

#v(-0.4cm)
= Foundations
#v(-1.0cm)
#hide([#heading(outlined: false, depth: 2)[Hidden]])

#definition(
  title: "Analysis Concepts"
)[
  + *Metric:* An abstract notion of distance in a space (not necessarily $RR^n$).
  + *Topology:* An abstract notion of convergence (even in spaces with no underlying notion of distance).
]

#pagebreak()
= Russell's Paradox

Let
$
S = {T: T "is a set and" T in.not T}.
$
Is $S in S$?

= Constructing Sets

+ *Unions:* If $S = {T_i}_(i in I)$, then
  $
  union.big_(i in I) T_i = {x : exists i in I "such that" x in T_i}
  $
  is a set.

+ *Subsets with Conditions:* If $S$ is a set and $phi(x)$ is a condition on elements, then
  $
  {x in S : phi(x)}
  $
  is a set.

+ *Power Set:* If $S$ is a set, then
  $
  scr(P)(S) = {T : T subset.eq S}
  $
  is a set.

= Cartesian Product

If $A$ and $B$ are sets, then
$
A times B = {(a,b): a in A, b in B}.
$

More generally, if ${S_i}_(i in I)$ is a collection of sets, we can form the product
$
product_(i in I) S_i.
$
An element is a tuple $(s_i)_(i in I)$ such that $s_i in S_i$. Formally,
$
product_(i in I) S_i = {f : I arrow union.big_(i in I) S_i : f(i) in S_i "for all" i in I}.
$

= Axiom of Choice (AC)

#proposition(
  title: "Axiom of Choice"
)[
  A Cartesian product of non-empty sets is non-empty.
]

= Functions

A function $f : A arrow B$ assigns each element of $A$ exactly one element of $B$. Formally,
$
f subset.eq A times B "is a function" iff forall x in A, exists! y in B "such that" (x, y) in f.
$

== Types of Functions

+ *Injective:* $forall x_1, x_2 in A, f(x_1) = f(x_2) imp x_1 = x_2$.
+ *Surjective:* $forall y in B, exists x in A "such that" f(x) = y$.
+ *Bijective:* $f$ is both injective and surjective.

#definition(
  title: "Cardinality Equivalence"
)[
  Two sets $A$ and $B$ have the same cardinality if there exists a bijection $f : A arrow B$. We write $A tilde B$.
]

#theorem(
  title: "Cantor's Theorem"
)[
  For any set $S$, the power set $scr(P)(S)$ has strictly greater cardinality than $S$: $S not tilde scr(P)(S)$.
]

= Cardinality

== Properties
+ $A tilde A$ (reflexive)
+ $A tilde B imp B tilde A$ (symmetric)  
+ $A tilde B "and" B tilde C imp A tilde C$ (transitive)

== Notations
+ $A lt.eq B$: there exists an injective map $f: A arrow B$
+ $A = B$: $A tilde B$
+ $A < B$: $A lt.eq B$ and $A not tilde B$

= Schröder-Bernstein Theorem

#theorem(
  title: "Schröder-Bernstein Theorem"
)[
  If there are injective maps $f : A arrow B$ and $g : B arrow A$, then there exists a bijection $h : A arrow B$.
]

= Finite and Infinite Sets

#definition(
  title: "Finite Sets"
)[
  A set $S$ is finite if $abs(S) = {1, 2, ..., n}$ for some $n in NN$. Otherwise it is infinite.
]

#definition(
  title: "Dedekind-Infinite Sets"
)[
  A set $S$ is Dedekind-infinite if there exists a bijection from $S$ to a proper subset of itself. Otherwise, it is Dedekind-finite.
]

= Countability

#definition(
  title: "Countable Sets"
)[
  A set $S$ is *countable* if $S lt.eq NN$. If countable and infinite, we say it is *countably infinite*. Otherwise, it is *uncountable*.
]

#theorem(
  title: "Countable Union of Countable Sets"
)[
  Let $I$ be a countable set, and let ${S_i}_(i in I)$ be a countable collection of countable sets. Then
  $
  union.big_(i in I) S_i
  $
  is countable.
] 