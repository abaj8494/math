#import "@preview/thmbox:0.2.0": *

// custom
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

#show math.equation: set text(14pt)

#show: thmbox-init()

#set document(title: "Convex and Non-Convex Optimisation", author: "Aayush Bajaj")

#align(center)[
  #v(2em)
  #block(text(weight: "bold", size: 24pt)[Convex and Non-Convex Optimisation])
  #v(2em)
  #text(weight: "bold", size: 20pt)[Aayush Bajaj]
  #v(1em)
  #text(size: 16pt)[Version 0.1]
  #v(1em)
  #text(size: 16pt)[#datetime.today().display()]
  #v(4em)
  #image("crest.svg", width: 90%)
]

#pagebreak()

#set page(numbering: "1")
#outline(title: "Table of Contents")

#pagebreak()

#set text( size: 14pt )
#set heading(numbering:"1.")
#set math.equation(numbering: "(1)")

= Mathematical Background

#definition(
  title: "Mathspeak"
)[
  + Axiom: A foundational statement accepted without proof. All other results are built ontop.
  + Proposition: A proved statement that is less central than a theorem, but still of interest.
  + Lemma: A ``helper'' proposition proved to assist in establishing a more important result.
  + Corollary: A statement following from a theorem or proposition, requiring little to no extra proof.
  + Definition: A precise specification of an object, concept or notation.
  + Theorem: A non-trivial mathematical statement proved on the basis of axioms, definitions and earlier results.
  + Remark: An explanatory or clarifying note that is not part of the formal logical chain but gives insight / context.
  + Claim / Conjecture: A statement asserted that requires a proof.
]

#set enum(numbering: "a)")
#definition(
  title: "Vector Norm"
)[
  A vector norm on $RR^n$ is a function $norm(dot.c)$ from $RR^n$ to $RR$ such that:

  + $norm(ve(x)) gt.eq 0,thin forall ve(x) in RR^n$ and $norm(ve(x)) = 0 iff ve(x) = ve(0)$ 
  + $norm(ve(x)+ve(y)) lt.eq norm(ve(x))+norm(ve(y))$ $forall ve(x),ve(y) in RR^n$ (Triangle Inequality)
  + $norm(alpha ve(x)) = |alpha| norm(ve(x))$ $forall alpha in RR, ve(x) in RR^n$
]

// repeat the above definition for the norm of a function.

#theorem(
  title: "Cauchy Shwarz-Inequality"
)[
  $
    abs(ve(x)^T ve(y)) lt.eq norm(ve(x), p:2) norm(ve(y), p:2)
  $
]

#definition(
  title: "Closed and Bounded Sets"
)[/*todo*/]

#definition(
  title: "Functions"
)[
  + Linear:
  + Affine:
  + Quadratic:
]

#definition(
  title: "Symmetric"
)[
  Definition, plus trace and determinant properties
]

#definition(
  title: "Principal Minors"
)[
]

= Convexity

#definition(
  title: "Convex Set"
)[
$Omega subset RR^n$ is *convex* if $theta x + (1 - theta)y in Omega$ for every $x, y in Omega$ and $theta in [0, 1]$.
]

#proposition(
  title: "Intersection of Convex Sets"
)[]

#definition(
  title: "Extreme Points"
)[]

#definition(
  title: "Convex Combination"
)[]

#definition(
  title: "Convex Hull"
)[]

#theorem(
  title: "Separating Hyperplane",
  color: red
)[
  // todo graphics in cetz
]

#definition(
  title: "Convex Hull"
)[]

#definition(
  title: "Convex / Concave Functions"
)[
A function $f: Omega -> RR$ (with $Omega$ convex) is
- *convex* if $f(theta x + (1 - theta)y) <= theta f(x) + (1 - theta)f(y)$;
- *strictly convex* if strict inequality holds whenever $x != y$;
- *concave* if $-f$ is convex.
]

= Unconstrained Optimisation

== Standard Form
#definition(
  title: "Standard Form"
)[ $ op("minimise", limits: #true)_(ve(x) in Omega) f(ve(x)) $
Remark: $max f(x) = -min{-f(x)}$
]

#theorem(
  title: "First order necessary conditions"
)[]

#definition(
  title: "Stationary point"
)[]

#definition(
  title: "Saddle point"
)[]

#theorem(
  title: "Second order necessary conditions"
)[]

#corollary(
  title: "Local maximiser"
)[$macron(ve(x))$ is a local maximiser $imp nabla f(macron(ve(x))) = ve(0)$ and $nabla^2 f(ve(macron(x)))$ negative semi-definite.

Note: As the definiteness of the Hessian changes, so does the nature of the maximiser.
]

#theorem(
  title: "Second order sufficient conditions"
)[]


= Equality Constraints

#definition(
  title: "Standard Form"
)[$ op("minimise", limits: #true)_(ve(x) in Omega) #h(1cm) &f(ve(x)) \ "subject to" #h(1cm) &ve(c)_i (ve(x)) = 0 $]

#definition(
  title: "Lagrangian"
)[]

#definition(
  title: "Regular Point"
)[]

#definition(
  title: "Matrix of Constraint Gradients"
)[$
A(ve(x)) = mat(nabla ve(c)_i (ve(x)), dots.h , ve(c)_m (ve(x));delim: "[") 
$]

#definition(
  title: "Jacobian"
)[$
J(ve(x)) &= A(ve(x))^T \
&= mat(nabla ve(c)_i (ve(x))^T; dots.v ; ve(c)_m (ve(x))^T;delim: "[") 
$]

#proposition(
  title: "First order necessary optimality conditions"
)[]

#corollary(
  title: "Constrained Stationary Point"
)[]

#proposition(
  title: "Second order sufficient conditions"
)[]

= Inequality Constraints

#definition(title: "Standard Form")[
$ op("minimise", limits: #true)_(ve(x) in Omega) #h(1cm) &f(ve(x)) \
"subject to" #h(1cm) &ve(c)_i (ve(x)) = 0, #h(2em) i = 1, dots.h, m_E  \
&ve(c)_i (ve(x)) lt.eq 0, #h(2em) i = m_E + 1, dots.h, m  $]

#definition(title: "Convex Problem")[
  The problem (NLP) is a standard form convex optimisation problem if the objective function $f$ is convex on the feasible set, $ve(c)_i$ is affine for each $i in cal(Epsilon)$, and $ve(c)_i$ is convex for each $i in script(I)$.
]

#definition(
  title: "Active Set"
)[
  The set of active constraints at a feasible point $ve(x)$ is
  $cal(A)(ve(x)) = { i in 1, dots.h, m : ve(c)_i (ve(x)) = 0} $
  *Note* that this concept only applies to inequality constraints.
]

#definition(
  title: "Regular Point"
)[]

#proposition(
  title: "Constrained Stationary Point"
)[]

#theorem(
  title: "Karush Kuhn Tucker (KKT) necessary optimality conditions"
)[kkt generalises lagrange multipliers]

#theorem(
  title: "Second-order sufficient conditions for strict local minimum"
)[]

#theorem(
  title: "KKT sufficient conditions for global minimum"
)[]

#theorem(
  title: "Wolfe Dual Problem"
)[
  strong duality, weak duality?
]


#note(
  title: "Reduced Hessian"
)[The reduced Hessian $W_Z^*$ is the projection of the Lagrandian's Hessian onto the tangent space of the constraints at the point $x^*$]

= General Constrained Optimisation

why does the reduced hessian exist for both? is there any difference when solving?

= Numerical Methods (unconstrained)

#definition(
  title: "Rates of convergence of iterative methods"
)[]

#algorithm(
  title: "Line Search Algorithms"
)[]

#algorithm(
  title: "Steepest Descent Method"
)[]

#algorithm(
  title: "Newton's Method"
)[]

#algorithm(
  title: "Conjugate Gradient Method"
)[]

= Penalty Methods

#definition(
  title: "Penalty function"
)[]

#remark()[
  + $c: RR^n arrow.r RR$ is a convex function $imp op("max"){ve(c)(ve(x)),0}^2$ is a convex function
  + $partial / (partial x_i) [op("max"){ve(c)(ve(x)),0}]^2 = 2 op("max"){ve(c)(ve(x)), 0}partial / (partial x_i)$
]

#theorem(
  title: "Convergence Theorem"
)[]

= Optimal Control Theory

#definition(
  title: "Standard Form"
)[]

#definition(
  title: "Hamiltonian"
)[break this up so it is understandable]

#definition(
  title: "Co-state Equations"
)[]

#theorem(
  title: "Pontryagin Maximum Principle"
)[]

partially free target 

non-autonmous problem


