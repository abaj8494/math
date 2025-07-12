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
  #text(size: 16pt)[Version 1.2]
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

#pagebreak()
= Metric Spaces

== Basic Definitions and Properties

#definition(
  title: "Metric Space"
)[
  A *metric space* is a pair $(X, d)$, where $X$ is a non-empty set and $d : X times X arrow [0, infinity)$ is a function such that for all $x, y, z in X$:
  + $d(x, y) = 0 iff x = y$
  + $d(x, y) = d(y, x)$ (symmetry)
  + $d(x, z) lt.eq d(x, y) + d(y, z)$ (triangle inequality)
]

#definition(
  title: "Sequence in Metric Space"
)[
  A *sequence* in a set $X$ is a function from $NN$ (or $ZZ^+$) to $X$.
]

#theorem(
  title: "Uniqueness of Limits"
)[
  A sequence in a metric space can have at most one limit.
]

#definition(
  title: "Open Ball"
)[
  For a point $x$ in a metric space $(X, d)$ and $epsilon > 0$, the *open $epsilon$-ball* is
  $
  B(x, epsilon) = {y in X : d(y, x) < epsilon}.
  $
]

== Topology in Metric Spaces

#definition(
  title: "Interior and Boundary"
)[
  Let $Y subset.eq X$ in a metric space $(X, d)$. Define:
  + $"Int"(Y) = {y in Y : exists epsilon > 0 "such that" B(y, epsilon) subset.eq Y}$
  + $"Bd"(Y) = X without ("Int"(Y) union "Int"(X without Y))$
]

#definition(
  title: "Open Sets"
)[
  $Y$ is *open* if $Y = "Int"(Y)$.
]

#definition(
  title: "Closed Sets"
)[
  $Y$ is *closed* if $X without Y$ is open.
]

#lemma(
  title: "Interior is Idempotent"
)[
  Let $(X, d)$ be a metric space and $Y subset.eq X$. Then $"Int"("Int"(Y)) = "Int"(Y)$.
]

#corollary(
  title: "Interior is Open"
)[
  $"Int"(Y)$ is open.
]

#definition(
  title: "Closure"
)[
  The *closure* of $Y$ is $"Cl"(Y) = "Int"(Y) union "Bd"(Y)$.
]

#definition(
  title: "Dense Sets"
)[
  $Y$ is *dense* if $"Cl"(Y) = X$.
]

#definition(
  title: "Neighborhood"
)[
  A *neighborhood* of $x$ is a set $U subset.eq X$ such that there exists an open set $V$ with $x in V subset.eq U$.
]

#definition(
  title: "Topology"
)[
  The set of open subsets of $X$ is called the *topology* $scr(O)(X)$.
]

#theorem(
  title: "Properties of Topology"
)[
  The topology $scr(O)(X)$ satisfies:
  + $nothing, X in scr(O)(X)$
  + Arbitrary unions of open sets are open
  + Finite intersections of open sets are open
]

== Continuity and Boundedness

#definition(
  title: "Continuity in Metric Spaces"
)[
  Let $(X, d_X)$ and $(Y, d_Y)$ be metric spaces. A function $f: X arrow Y$ is *continuous* if for every open $V subset.eq Y$, the preimage $f^(-1)(V)$ is open in $X$.
]

#theorem(
  title: "Composition of Continuous Functions"
)[
  If $f: X arrow Y$ and $g: Y arrow Z$ are continuous, then $g compose f: X arrow Z$ is continuous.
]

#definition(
  title: "Bounded Sets"
)[
  A subset $Y subset.eq X$ is *bounded* if there exists $R > 0$ and $x in X$ such that $Y subset.eq B(x, R)$.
]

== Completeness and Cauchy Sequences

#definition(
  title: "Cauchy Sequence"
)[
  A sequence ${x_n}$ in $(X, d)$ is a *Cauchy sequence* if for all $epsilon > 0$, there exists $N$ such that $d(x_m, x_n) < epsilon$ for all $m, n > N$.
]

#definition(
  title: "Complete Metric Space"
)[
  A metric space is *complete* if every Cauchy sequence converges to a point in the space.
]

#theorem(
  title: "Completeness and Closedness"
)[
  Let $(X, d)$ be a complete metric space. A subset $Y subset.eq X$ is complete $iff$ $Y$ is closed.
]

#definition(
  title: "Equivalent Cauchy Sequences"
)[
  Two Cauchy sequences ${a_n}$ and ${b_n}$ are equivalent if $lim d(a_n, b_n) = 0$.
]

#definition(
  title: "Completion of Metric Space"
)[
  The *completion* of a metric space $(X, d)$ is the space of equivalence classes of Cauchy sequences with distance
  $
  d([{a_n}], [{b_n}]) = lim d(a_n, b_n).
  $
]

#theorem(
  title: "Properties of Completion"
)[
  The completion $overline(X)$ of $X$ is a complete metric space. The map $x arrow.bar [{x}]$ is an isometry, and its image is dense in $overline(X)$. The completion is unique up to isometric bijection.
]

#pagebreak()
== Normed and Inner Product Spaces

#definition(
  title: "Norm"
)[
  A *norm* on a vector space $V$ is a function $norm(dot.c): V arrow [0, infinity)$ satisfying:
  + $norm(x) = 0 iff x = 0$
  + $norm(lambda x) = abs(lambda) dot.c norm(x)$
  + $norm(x + y) lt.eq norm(x) + norm(y)$ (triangle inequality)
]

#theorem(
  title: "Norm Induces Metric"
)[
  Let $(V, norm(dot.c))$ be a normed vector space. Then $d(x, y) = norm(x - y)$ defines a metric.
]

#definition(
  title: "Banach Space"
)[
  A *Banach space* is a complete normed vector space.
]

#definition(
  title: "$ell^p$ Spaces"
)[
  For $p in [1, infinity)$, define
  $
  ell^p = {{x_n} subset.eq RR : sum_(n=1)^infinity abs(x_n)^p < infinity},
  $
  with norm $norm(x, p:p) = (sum abs(x_n)^p)^(1/p)$.
]

#theorem(
  title: "$ell^p$ is Banach"
)[
  $(ell^p, norm(dot.c, p:p))$ is a Banach space.
]

#definition(
  title: "Inner Product Space"
)[
  An *inner product space* is a vector space $V$ with a function $angle.l dot.c, dot.c angle.r$ such that:
  + $angle.l x, x angle.r > 0$ if $x eq.not 0$
  + $angle.l x, y angle.r = angle.l y, x angle.r$ (conjugate symmetry)
  + $angle.l x + lambda y, z angle.r = angle.l x, z angle.r + lambda angle.l y, z angle.r$ (linearity)
]

#definition(
  title: "Hilbert Space"
)[
  A *Hilbert space* is a complete inner product space.
]

== Contraction and Lipschitz Mappings

#definition(
  title: "Contraction Mapping"
)[
  A *contraction* is a function $f: X arrow X$ such that there exists $c < 1$ with $d(f(x), f(y)) lt.eq c d(x, y)$.
]

#lemma(
  title: "Contraction Generates Cauchy Sequence"
)[
  Let $(X, d)$ be a metric space and $f$ a contraction. Then the sequence $x_(n+1) = f(x_n)$ is Cauchy.
]

#theorem(
  title: "Contraction Mapping Theorem"
)[
  Let $(X, d)$ be a complete metric space and $f: X arrow X$ a contraction. Then $f$ has a unique fixed point. Moreover, for any $x in X$, the sequence $x_(n+1) = f(x_n)$ converges to that fixed point.
]

#definition(
  title: "Lipschitz Continuity"
)[
  A function $f: X arrow RR$ is *Lipschitz continuous* if there exists $K > 0$ such that $abs(f(x) - f(y)) lt.eq K abs(x - y)$.
]

#definition(
  title: "Lipschitz in Second Variable"
)[
  A function $f: X subset.eq RR^2 arrow RR$ is *Lipschitz in the second variable* if
  $
  abs(f(x, y_1) - f(x, y_2)) lt.eq K abs(y_1 - y_2).
  $
]

#theorem(
  title: "Picard–Lindelöf Theorem"
)[
  Let $g$ be continuous near $(a, b) in RR^2$ and Lipschitz in the second variable. Then the differential equation
  $
  y' = g(x, y), quad y(a) = b
  $
  has a unique solution near $a$.
] 