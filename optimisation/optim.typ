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

#definition(
  title: "Continuous Derivatives"
)[
  The notation $ f in C^k ( RR^n) $
  means that the function $f: RR^n arrow.r RR$ possesses continuous derivatives up to order $k$ on $RR^n$.

  #example()[
    + $f in C^1 (RR^n)$ implies each $(partial f)/(partial x_i)$ exists, and $nabla f(x)$ is continuous on $RR^n$
    + $f in C^2 (RR^n)$ implies each $(partial f^2)/(partial x_i y_i)$ exists, and $nabla^2 f(x)$ forms a continuous Hessian matrix.
  ]
]

#theorem(
  title: "Cauchy Shwarz-Inequality"
)[
  $
    abs(ve(x)^T ve(y)) lt.eq norm(ve(x), p:2) norm(ve(y), p:2)
  $
]

#definition(
  title: "Closed and Bounded Sets"
)[
  A set $Omega subset RR^n$ is _closed_ if it contains all the limits of convergent sequences of points in $Omega$.

  A set $Omega subset RR^n$ is _bounded_ if $exists K in RR^+$ for which $Omega subset B[0,K]$, where $B[0,K] = {ve(x) in RR^n : norm(ve(x)) lt.eq K}$ is the ball with centre 0.
]

#definition(
  title: "Standard Vector Function Forms"
)[
  If $f_0 in RR, ve(g) in RR^n, G in R^{n times n}$:
  + Linear: $f(ve(x)) = ve(g)^T ve(x)$
  + Affine: $f(ve(x)) = ve(g)^T ve(x) + f_0$
  + Quadratic: $f(ve(x)) = 1/2 ve(x)^T G ve(x) + ve(g)^T ve(x) + f_0$
]

#definition(
  title: "Symmetric"
)[
  Let $A in RR^{n times n}$ be a symmetric matrix. Then:
  + $A$ has $n$ real eigenvalues.
    + There exists an orthogonal matrix $Q$ ($Q^top Q=I$) such that $A= Q D Q^top$ where $D=op("diag")(lambda_1,dots.h,lambda_n)$ and $Q=[v_1 thin dots.h thin v_n]$ with $v_i$ an eigenvector of $A$ corresponding to eigenvalue $lambda_i$.
    + $op("det")(A)=product{i=1}^n lambda_i$ and $op("tr")(A)=sum_{i=1}^n lambda_i=sum_{i=1}^n A_{i i}$.
    + $A$ is positive definite $iff lambda_i>0$ for all $i=1,dots.h,n$.
    + $A$ is positive semi-definite $iff lambda_i gt.eq 0$ for all $i=1,dots.h,n$.
    + $A$ is indefinite $iff$ there exist $i,j$ with $lambda_i>0$ and $lambda_j<0$.
]

#definition(
  title: "Leading Principal Minors / Sylvester's Criterion"
)[
  A symmetric matrix $A$ is *positive definite* if and only if all leading principal minors of A are positive. The $i$th principal minor $delta_i$ of A is the determinant of the leading $i times i$ submatrix of A. 

  If $delta_i, i = 1, 2, dots.h, n$ has the sign of $(-1)^i, i = 1, 2, dots.h, n$, that is, the values of $delta_i$ are alternatively negative and positive, then $A$ is *negative definite*.

  *Note* that _PSD_ only applies if you check *all* principal minors, of which there are $2^n - 1$, as opposed to checking $n$ submatrices here.
]

#pagebreak()
= Convexity

#definition(
  title: "Convex"
)[
  A set $Omega subset.eq RR^n$ is convex $iff theta \ve(x) + (1-theta) ve(y) in Omega$ for all $theta in[0,1]$ and for all $ve(x),ve(y) in Omega$.
  *Note:* there is no such thing as a _concave_ set.
]

#proposition(
  title: "Intersection of Convex Sets"
)[Let $Omega_1, dots.h, Omega_n subset.eq RR^n$ be convex, then their intersections $Omega = Omega_1 inter dots.h inter Omega_n $ is convex.]

#definition(
  title: "Extreme Points"
)[
  Let $Omega subset.eq RR^n$ be a convex set $macron(ve(x)) in Omega$ is an extreme point of $Omega iff ve(x), ve(y) in Omega, thin theta in [0,1]$ and $macron(ve(x)) = theta ve(x) + (1 - theta) y imp ve(x), ve(y) in RR$, or $x = y$.

  In other words, a point is in an extreme point if it cannot be on a line segment in $Omega$.

  #align(center)[ #image("extreme.svg", width: 70%) ]

]

#definition(
  title: "Convex Combination"
)[
  The convex combination of $ve(x)^((1)), dots.h, ve(x)^((m)) in RR^m$ is
  $
    ve(x) = sum^m_(i=1) alpha_i ve(x)^((i)), " where " sum^m_(i=0)alpha_i = 1 " and " alpha_i gt.eq 0, i= 1, dots.h, m
  $
]

#definition(
  title: "Convex Hull"
)[
  The convex hull $op("conv")(Omega)$ of a set $Omega$ is the set of all convex combinations of points in $Omega$.
]

#theorem(
  title: "Separating Hyperplane",
  color: red
)[
  Let $Omega subset.eq RR^n$ be a non-empty closed convex set and let $z in.not Omega$. There exists a hyperplane $H = {ve(u) in RR^n: ve(a)^T ve(u) = beta}$ such that $ve(a)^T ve(z) lt beta$ and $ve(a)^T ve(x) gt.eq beta$ for all $x in Omega$.

  #image("sep-hyper.svg")
]

#definition(
  title: "Convex / Concave Functions"
)[
A function $f: Omega -> RR$ (with $Omega$ convex) is
- *convex* if $f(theta ve(x) + (1 - theta)ve(y)) <= theta f(ve(x)) + (1 - theta)f(ve(y))$;
- *strictly convex* if strict inequality holds whenever $ve(x) != ve(y)$;
- *concave* if $-f$ is convex.
]

#pagebreak()
= Unconstrained Optimisation

#definition(
  title: "Standard Form"
)[ $ op("minimise", limits: #true)_(ve(x) in Omega) f(ve(x)) $
Remark: $max f(ve(x)) = -min{-f(ve(x))}$
]

#definition(
  title: "Hessian"
)[
  $f: RR^n arrow.r RR$ be twice continuously differentiable. The Hessian $nabla^2 f : RR^n arrow.r RR^{n times n}$ of $f$ at $x$ is
  $
    nabla^2 f(x)=mat(
      (partial^2 f(x))/(partial x_1^2) , (partial^2 f(x))/(partial x_1 partial x_2) , dots.h , (partial^2 f(x))/(partial x_1 partial x_n) ;
      (partial^2 f(x))/(partial x_2 partial x_1) , (partial^2 f(x))/(partial x_2^2) , dots.h , (partial^2 f(x))/(partial x_2 partial x_n) ;
      dots.v , dots.v , dots.down , dots.v ;
      (partial^2 f(x))/(partial x_n partial x_1) , (partial^2 f(x))/(partial x_n partial x_2) , dots.h , (partial^2 f(x))/(partial x_n^2); delim: "["
    )
  $
]

#theorem(
  title: "First order necessary conditions"
)[
]
  If $x^*$ is a local minimizer and $f in C^1(RR^n)$ then $nabla f(x^*) = 0$.

#definition(
  title: "(Unconstrained) Stationary point"
)[
  $x^*$ is an unconstrained stationary point $iff nabla f(x^*)=0$
  #example()[local min, local max, saddle point.]
]

#definition(
  title: "Saddle point"
)[
  A stationary point $ve(x^*) in RR^n$ is a saddle point of $f$ if for any $delta gt 0$ there exist $ve(x), ve(y)$ with $norm(ve(x)-ve(x^*)) lt delta$, $norm(ve(y)-ve(x^*)) lt delta$ such that:
  $
  f(ve(x)) lt f(ve(x^*)) " and " f(ve(y)) gt f(ve(x^*))
  $
]

#proposition(
  title: "Second order necessary conditions"
)[
  If $f\in C^2(RR^n)$ then
  + Local minimiser $imp nabla f(ve(x)^*)=0$ _and_ $nabla^2 f(ve(x)^*)$ positive semi-definite.
  + Local maximiser $imp nabla f(ve(x)^*)=0$ _and_ $nabla^2 f(ve(x)^*)$ negative semi-definite.

#corollary( title: "Local maximiser")[$macron(ve(x))$ is a local maximiser $imp nabla f(macron(ve(x))) = ve(0)$ and $nabla^2 f(ve(macron(x)))$ negative semi-definite. ]
]


#theorem(
  title: "Second order sufficient conditions"
)[
  If $nabla f(ve(x^*))=0$ then
  + $nabla^2 f(ve(x^*))$ positive definite $imp ve(x^*)$ is a _strict_ local minimiser.
  + $nabla^2 f(ve(x^*))$ negative definite $imp ve(x^*)$ is a _strict_ local maximiser.
  + $nabla^2 f(ve(x^*))$ indefinite $imp ve(x^*)$ is a saddle point.
  #v(1em)
  + $nabla^2 f(ve(x^*))$ positive semi-definite $imp ve(x^*)$ is _either_ a local minimiser or a saddle point!
  + $nabla^2 f(ve(x^*))$ negative semi-definite $imp ve(x^*)$ is _either_ a local maximiser or a saddle point! Be careful with these.

  #corollary(
    title: "Global Optimums"
  )
  [
    From the sufficiency of stationarity as above, and under the convexity / concavity of $f in C^2 (RR^n)$:
    + $f$ convex $imp$ any stationary point is a global minimiser.
    + $f$ _strictly_ convex $imp$ stationary point is the _unique_ global minimiser.
    + $f$ concave $imp$ any stationary point is a global maximiser.
    + $f$ _strictly_ concave $imp$ stationary point is the _unique_ global maximiser.
  ]
]


#pagebreak()
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

#pagebreak()
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

#pagebreak()
= General Constrained Optimisation

why does the reduced hessian exist for both? is there any difference when solving?

#pagebreak()
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

#pagebreak()
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

#pagebreak()
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


