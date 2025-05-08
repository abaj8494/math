#import "@preview/thmbox:0.2.0": *

// custom
//
//
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

== Sets
#definition(
  title: "Convex Set"
)[]

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

== Functions

#definition(
  title: "Convex / Concave Functions"
)[]

= Unconstrained Optimisation

== Standard Form

$
op("minimise", limits: #true)_(ve(x) in Omega) f(ve(x))
$

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

== Standard Form

$ op("minimise", limits: #true)_(ve(x) in Omega) #h(1cm) f(ve(x))& \
"subject to" #h(1cm) ve(c)_i (ve(x))& $

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
)

= Inequality Constraints

#note(
  title: "Reduced Hessian"
)[The reduced Hessian $W_Z^*$ is the projection of the Lagrandian's Hessian onto the tangent space of the constraints at the point $x^*$]

= Line Search Descent

= Newton's Method & Conjugate Gradient Methods

= Penalty Methods

= Optimal Control Theory

== Notation
Unless stated otherwise, $x in RR^n$, $f: RR^n -> RR$ is continuously differentiable, $nabla f$ and $nabla^2 f$ denote the gradient and Hessian respectively, and $c_i$ are the constraint functions of a non-linear programme
$
min_(x in RR^n) f(x) quad "s.t. " c_i(x) = 0 (i in E), c_i(x) <= 0 (i in I).
$

== Topic 1 – Model Formulation

=== Standard form
$
min_(x in RR^n) f(x) quad "s.t." quad c_i(x) = 0 (i = 1, dots, m_E), c_i(x) <= 0 (i = m_E + 1, dots, m).
$

==== Typical conversions
- *Maximisation.* $max f(x) = -min{-f(x)}$.
- *Right-hand sides.* $c_i(x) = b_i <==> c_i(x) - b_i = 0$.
- *"$gt.eq$" constraints.* $c_i(x) >= 0 <==> -c_i(x) <= 0$.
- *Strict inequalities.* $c_i(x) < 0 <==> c_i(x) + epsilon <= 0$ for some $epsilon > 0$.

== Topic 2 – Mathematical Background

=== Gradients and Hessians
For $f in C^2(RR^n)$
$
nabla f(x) = mat(partial f / partial x_1; dots.v; partial f / partial x_n), quad
nabla^2 f(x) = [partial^2 f / partial x_i partial x_j]_(i,j=1)^n.
$

=== Definiteness of real matrices
A (not necessarily symmetric) $A in RR^(n times n)$ is

| | |
|---|---|
| positive definite | $<==> x^top A x > 0 forall x != 0$,|
| positive semi-def. | $<==> x^top A x >= 0 forall x$,|
| negative definite | $<==> x^top A x < 0 forall x != 0$,|
| negative semi-def. | $<==> x^top A x <= 0 forall x$,|
| indefinite | $<==> exists x,z: x^top A x < 0, z^top A z > 0$.|

For a *symmetric* matrix the signs of the eigenvalues $lambda_1, dots, lambda_n$ fully determine definiteness; e.g. $A succ 0 <==> lambda_i > 0 forall i$.
A convenient test for $A succ 0$ is that all leading principal minors are positive (Sylvester's criterion).

== Topic 3 – Convexity of Sets and Functions

=== Sets
$Omega subset RR^n$ is *convex* if $theta x + (1 - theta)y in Omega$ for every $x, y in Omega$ and $theta in [0, 1]$.

=== Functions
A function $f: Omega -> RR$ (with $Omega$ convex) is
- *convex* if $f(theta x + (1 - theta)y) <= theta f(x) + (1 - theta)f(y)$;
- *strictly convex* if strict inequality holds whenever $x != y$;
- *concave* if $-f$ is convex.

Useful characterisations:
$
f text(" convex ") <==> (forall x, y in Omega) f(y) >= f(x) + nabla f(x)^top (y - x);
$

$
f text(" convex on open ") Omega <==> nabla^2 f(x) succ.eq 0 forall x in Omega;
$

$
text("epigraph ") "epi" f = {(x, r): x in Omega, f(x) <= r} text(" is convex.")
$

== Topic 4 – Unconstrained Optimisation

=== First- and second-order tests
For $f in C^1$:
$
x^* text(" local min") => nabla f(x^*) = 0.
$
For $f in C^2$:
$
x^* text(" local min") => nabla f(x^*) = 0, nabla^2 f(x^*) succ.eq 0.
$
Moreover, if $nabla f(x^*) = 0$ and $nabla^2 f(x^*) succ 0$ then $x^*$ is a *strict* local minimiser; $prec 0$ gives a maximiser; an indefinite Hessian implies a saddle.

For *convex* (resp. concave) $f$, *any* stationary point is a global minimum (resp. maximum).

== Topic 5 – Equality-Constrained Optimisation

=== Problem
$
min f(x) quad text("s.t. ") c_i(x) = 0 (i = 1, dots, m).
$

==== Lagrangian
$L(x, lambda) = f(x) + sum_(i=1)^m lambda_i c_i(x)$.

==== Regularity
A feasible $x$ is *regular* if ${nabla c_i(x)}_(i=1)^m$ are linearly independent.

==== First-order (KKT) conditions
If $x^*$ is a local minimiser and regular, then
$
nabla_x L(x^*, lambda^*) = 0, quad c_i(x^*) = 0.
$
Any point satisfying these with some multipliers is a *constrained stationary point*.

==== Second-order sufficiency
Let $Z^*$ whose columns form a basis for $"ker" A^top$ with $A = [nabla c_1(x^*) dots nabla c_m(x^*)]$. Define $W^* = nabla^2 f(x^*) + sum_(i=1)^m lambda_i^* nabla^2 c_i(x^*)$. If $(Z^*)^top W^* Z^* succ 0$ then $x^*$ is a strict local minimum.

== Topic 6 – Problems with Inequality Constraints

Given (NLP)
$
min f(x) quad text("s.t.") quad c_i(x) = 0 (i in E), c_i(x) <= 0 (i in I),
$
let the *active set* $A(x) = {i in E union I : c_i(x) = 0}$.

==== KKT conditions
At a regular local minimiser $x^*$ there exist multipliers $lambda^*$ such that
$
nabla f(x^*) + sum_(i in A(x^*)) lambda_i^* nabla c_i(x^*) = 0, quad
lambda_i^* >= 0 (i in I inter A(x^*)).
$

==== Second-order test
With $Z^*$, $W^*$ defined as before and $t^* = |A(x^*)| < n$: if $lambda_i^* > 0 forall i in I inter A(x^*)$ and $(Z^*)^top W^* Z^* succ 0$ then $x^*$ is a strict local minimum.

=== Convex programmes
If $f$ is convex, $c_i$ affine $(i in E)$, and $c_i$ convex $(i in I)$, then *any* point satisfying the KKT conditions with $lambda_i >= 0 (i in I)$ is a *global* minimiser.

=== Wolfe dual
For $m = |E union I|$
$
max_(y, lambda) f(y) + sum_(i=1)^m lambda_i c_i(y) text(" s.t. ") nabla f(y) + sum_(i=1)^m lambda_i nabla c_i(y) = 0, lambda_i >= 0 (i in I).
$
Strong duality holds in the convex case.

== Topic 7 – Numerical Methods (Unconstrained)

=== General line-search framework
Given descent direction $s^(k)$ at $x^(k)$, choose $alpha^(k) > 0$ (exact or inexact) and set $x^(k+1) = x^(k) + alpha^(k) s^(k)$.

==== Convergence rates
If $x^(k) -> x^*$ and $norm(x^(k+1) - x^*)/norm(x^(k) - x^*)^alpha -> beta$ then the method is *$alpha$-th-order*: $alpha = 1$ linear, $alpha = 1, beta = 0$ super-linear, $alpha = 2$ quadratic.

=== Steepest Descent
$
s^(k) = -nabla f(x^(k)).
$
Globally convergent, linear rate in the quadratic case; no quadratic termination.

=== Newton's method
$
nabla^2 f(x^(k)) delta^(k) = -nabla f(x^(k)), quad s^(k) = delta^(k).
$
Quadratic convergence near a non-singular minimiser; single-step termination for strictly convex quadratics; may fail globally if $nabla^2 f$ is singular or indefinite.

=== Conjugate Gradient (non-linear CG)
$
s^(k) = -g^(k) + beta^(k) s^(k-1), quad g^(k) = nabla f(x^(k)).
$
Descent directions, quadratic termination (exact line search), especially attractive for large-scale problems because only vector operations are required.

== Topic 8 – Penalty Function Methods

For (P) with mixed constraints define
$
P(x) = sum_(i in E) c_i(x)^2 + sum_(i in I) [c_i(x)]_+^2, quad [x]_+ = max{x, 0}.
$
The penalty subproblem
$
min_(x in RR^n) f(x) + mu P(x) quad (:= P_mu)
$
is unconstrained. Under mild boundedness assumptions, every sequence of minimisers $x_mu$ with $mu -> infinity$ has accumulation points that solve the original constrained problem, and $mu P(x_mu) -> 0$.

== Topic 9 – Optimal Control (Pontryagin Maximum Principle)

For an autonomous system with fixed end-points
$
min_(u(.)) integral_(t_0)^(t_1) f_0(x(t), u(t)) dif t, quad dot(x) = f(x(t), u(t)), x(t_0) = x_0, x(t_1) = x_1,
$
define the Hamiltonian $H(x, hat(z), u) = hat(z)^top (f_0(x, u), f(x, u))$. There exists a non-trivial adjoint $hat(z)(t)$ with $dot(hat(z)) = -partial H / partial x$ such that the optimal control $u^*(t)$ maximises $H(x^*(t), hat(z)(t), u)$ for all $u in U$. For fixed end-time the Hamiltonian is constant along the optimal trajectory; it vanishes when the terminal time is free. If only some components of $x(t_1)$ are fixed, a transversality condition relates adjoint values to the gradients of the terminal constraints.
