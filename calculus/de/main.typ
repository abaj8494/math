#import "custom.typ": mgrid, veq, vapprox, proof
#show math.equation: set text(14pt)

// Create a simple theorem environment
#let theorem(body) = block(
  width: 100%,
  fill: rgb(248, 248, 248),
  stroke: (paint: rgb(100, 100, 100), thickness: 0.8pt),
  radius: 3pt,
  inset: (x: 1em, y: 0.8em),
  outset: (bottom: 0.8em),
)[
  #text(weight: "bold", style: "italic")[Theorem.] #h(0.5em) #body
]

#set document(title: "Theory of Differential Equations", author: "Aayush Bajaj")
#set page(numbering: "1")

// Title page
#align(center)[
  #block(text(weight: "bold", size: 24pt)[Theory of Differential Equations])
  #v(2em)
  #text(size: 14pt)[Aayush Bajaj]
  #v(1em)
  #text(size: 12pt)[Version 0.1]
  #v(1em)
  #text(size: 12pt)[#datetime.today().display()]
]

#pagebreak()

// Table of contents
#outline(title: "Table of Contents")

#pagebreak()

#set heading(numbering:"1.")
#set math.equation(numbering: "(1)")

= Definitions <definitions>

// Define a function for creating fancy definition boxes
#let def-box(term, content) = {
  block(
    width: 100%,
    fill: rgb(248, 248, 248),
    stroke: (paint: rgb(120, 120, 120), thickness: 0.8pt),
    radius: 3pt,
    inset: (x: 0.8em, y: 0.6em),
    outset: (bottom: 0.8em),
  )[
    #text(weight: "bold")[#term] #h(0.5em) #text[=] #h(0.5em) #content
  ]
}

// Define a function for stability types with a different style
#let stability-box(type, content) = {
  block(
    width: 100%,
    fill: rgb(240, 240, 240),
    stroke: (paint: rgb(100, 100, 100), thickness: 0.8pt, dash: "dashed"),
    radius: 3pt,
    inset: (x: 0.8em, y: 0.6em),
    outset: (bottom: 0.8em),
  )[
    #text(style: "italic", weight: "bold")[#type] #h(0.5em) #text[=] #h(0.5em) #content
  ]
}

// Basic definitions
#def-box("order", [the power the differential is raised to.])

#def-box("linear", [the dependent variable and it's derivatives are all not non-linear.])

// Example equations showing linearity
$ mgrid(gutter: #1em,
    underbrace((dif^2 y) / (dif t))
      & underbrace(cos(x) (dif y)/(dif x))
      & underbrace((dif y) / (dif t) (dif ^3 y) / (dif t^3))
      & underbrace(y^' = e^y)
      & underbrace(y (dif y)/(dif x)) \

    "linear" & "linear" & "non-linear" & "non-linear" & "non-linear" \
) $

// More definitions
#def-box("autonomous", [independent variable does not appear in the equation])

#def-box("non-autonomous", [independent variable _does_ appear in the equation])

#def-box("ansatz", [our initial guess for the form of a solution, i.e. $y_p = A cos (t) + B sin (t)$])

#def-box("indicial equation", [a quadratic equation that pops out during the application of the Frobenius method])

#def-box("analytic", [a function is analytic at a point if it can be expressed as a convergent power series in a neighborhood of that point])

#def-box("ordinary point", [when $p(x)$ and $q(x)$ are analytic at that point]) <ordinary-point>

#def-box("regular singular point", [if $P(x) = (x-x_0)p(x)$ and $Q(x) = (x-x_0)^2 q(x)$ are both analytic at $x_0$.])

#def-box("irregular singular point", [not regular.])

// Convergence definitions
#def-box("mean convergence", [a sequence of functions $f_n$ converges in mean to $f$ on $[a,b]$ if $lim_(n->infinity) integral^b_a |f_n(x) - f(x)|^2 dif x = 0$])

#def-box("pointwise convergence", [a sequence of functions $f_n$ converges pointwise to $f$ on $[a,b]$ if $lim_(n->infinity) f_n(x) = f(x)$ for every $x in [a,b]$])

#def-box("uniform convergence", [a sequence of functions $f_n$ converges uniformly to $f$ on $[a,b]$ if $lim_(n->infinity) sup_(x in [a,b]) |f_n(x) - f(x)| = 0$])

// Equilibrium and stability section with special styling
#pagebreak()
#block(width: 100%, outset: (top: 0.8em, bottom: 0.6em))[
  #align(center)[#text(weight: "bold", size: 1.1em)[Equilibrium Points and Stability]]
]

#def-box("equilibrium point", [a point where the derivative of the dependent variable with respect to the independent variable is zero])

// Stability types with different styling
#stability-box("stable node", [trajectories approach the equilibrium point from all directions and eigenvalues are real and negative])

#stability-box("unstable bicritical node (\"star\")", [trajectories move away from the equilibrium point in all directions and eigenvalues are real and positive])

#stability-box("stable centre", [trajectories orbit around the equilibrium point with eigenvalues that are purely imaginary])

#stability-box("unstable saddle point", [trajectories approach the equilibrium point in one direction and move away in another, with eigenvalues having opposite signs])

#stability-box("unstable focus", [trajectories spiral away from the equilibrium point with eigenvalues having positive real parts and non-zero imaginary parts])

#pagebreak()
= Solving Methods

== First Order

=== standard form
$ (dif y) / (dif x) = f(x, y) $

=== separable
$ (dif y)/(dif x) = f(x) g(y)
arrow.r.double.long integral (dif y)/g(y) = integral f(x) dif x $

=== reduction to separable

$ (dif y) / (dif x) = f ( y/x) $
with substitution: $y(x) = x v(x)$

=== linear standard form

$ (dif y) / (dif x) + p(x) y = q(x) $ <linear-standard-form>

==== integrating factor

note, the coefficient of $y'(x)$ must be 1.

$ phi(x) = exp(integral p(x) dif x) $ <phi_x>

multiplying the @linear-standard-form[Linear Standard Form] with $phi(x)$ yields:

$ (dif)/(dif x)(phi y) = phi(x) q(x)
arrow.r.double.long y = phi^(-1) integral phi q(x) dif x $

=== exact
A first-order ODE is exact if it can be written in the form:
$ M(x,y) dif x + N(x,y) dif y = 0 $
where $(partial M)/(partial y) = (partial N)/(partial x)$. The solution is then given by: $F(x,y) = C$ where $F(x,y)$ satisfies $(partial F)/(partial x) = M(x,y)$ and $(partial F)/(partial y) = N(x,y)$

#pagebreak()
== Second Order

=== standard form <second-order-standard-form>
$ y^('') + p(x)y^' + q(x)y = r(x) $

=== reducible to first order

$ (dif^2 y)/(dif x^2) + f(y, (dif y)/(dif x)) = 0 $

is reducible to the first-order ODE

$ p (dif p)/(dif y) + f(y, p) = 0 $
with substitution $p = (dif y)/(dif x)$

=== constant coefficients
when $p(x)$ and $q(x)$ are constants:
$ y^('') + a_1 y^' + a_0 y = 0 $

==== homogenous
solve the characteristic equation:
$ lambda^2 + a_1 lambda + a_0 = 0 $
cases:
- $lambda_1, lambda_2$ are real and distinct 
- $lambda_1, lambda_2$ are real and coincide (same) 
- $lambda_1, lambda_2$ are complex conjugates

in each case, the solution of $y(x)$ becomes:
- $y(x) = C exp(lambda_1 x) + D exp(lambda_2 x)$
- $y(x) = C exp(lambda_1 x) + D x exp(lambda_1 x)$
- $y(x) = C exp(alpha x)cos(beta x) + D exp(alpha x)sin(beta x) 
  &= exp(alpha x)(A cos(beta x) + B sin(beta x)) "by DeMoivre's Theorem"$

==== inhomogenous $arrow.r$ method of undetermined coefficients <method-uc>
$ y(x) = y_h(x) + y_p(x) $
guesses for $y_p(x)$:
- for $r(x) = P_n(x)$ (polynomial of degree $n$), try $y_p(x) = Q_n(x)$ 
- for $r(x) = e^(alpha x)$, try $y_p(x) = A e^(alpha x)$
- for $r(x) = sin(beta x)$ or $r(x) = cos(beta x)$, try $y_p(x) = A sin(beta x) + B cos(beta x)$
- for products of the above forms, try products of the corresponding forms
- if $y_p(x)$ is already a solution of the homogeneous equation, multiply by $x$ or $x^k$ until linearly independent

=== variation of parameters
This method works for any 2nd order inhomogenous ODE if the complementary solution is known.

#theorem[
The general solution of the 2nd order inhomogenous ODE:
$ y^('') + b_1 (x) y^' + b_0 (x) y = f(x) $

is given by $y(x) = u_1(x) y_1(x) + u_2(x) y_2(x)$

where $y_1$ and $y_2$ are linearly independent solutions of the homogenous ODE such that the Wronskian $W(x) eq.not 0$ and 
$ u_1(x) = -integral (y_2(x)f(x))/(W(x)) dif x $
and $ u_2(x) = integral (y_1(x)f(x))/(W(x)) dif x $
]

=== power series method
note, that we embark on this approach because the @second-order-standard-form[second order standard form] is not solveable in general with _elementary functions_!

pick ansatz of the form
$ y = sum^infinity_(n=0) a_n z^n $
and take derivatives as required. for example:
$ (dif y)/(dif z) = sum^infinity_(n=1) n a_n z^(n-1) 
(dif^2 y)/(dif z^2) = sum^infinity_(n=2) n(n-1) a_n z^(n-2) $
and substitute them into the ODE. Then solve by rearranging indices as necessary to obtain a recurrence relation. Apply the initial conditions and then guess the closed-form solution of the recurrence relation. Change back to the original variables if required.

If $x_0$ is an ordinary point @definitions of the differential equation
$ y^('') + p(x)y^' + q(x)y = 0 $
then the general solution in a neighbourhood $|x - x_0|< R$ may be represented as a power series.

=== method of frobenius
#theorem[
If $x_0 = 0$ is a regular singular point of the differential equation
$ y^('') + p(x)y^' + q(x)y = 0 $
then there exists at least one series solution of the form
$ y(x) = x^r sum^infinity_(n=0) c_n x^n
= sum^infinity_(n=0) c_n x^(n+r), c_0 eq.not 0 $
for some constant $r$ (index).
]

==== general indicial equation
$ r(r-1) + p_0 r + q_0 = 0 $

== n order
admits $n$ linearly independent solutions.

=== power series expansion (not sure if it works for n order)
For an $n^"th"$ order linear ODE with variable coefficients:
$ a_n(x) y^((n)) + a_(n-1)(x) y^((n-1)) + dots + a_1(x) y^' + a_0(x) y = f(x) $

We assume a solution of the form:
$ y(x) = sum^infinity_(k=0) c_k (x-x_0)^k $

Taking derivatives and substituting yields a recurrence relation for coefficients $c_k$, typically allowing us to determine $c_n$ in terms of $c_0, c_1, dots, c_(n-1)$.

=== reduction of order
any $n^"th"$ order ODE can be formulated as a system of $n$ first order ODE's.

For $y^((n)) = f(x, y, y^', dots, y^((n-1)))$, set $y_i = y^((i-1))$ for $i = 1,2,dots,n$ to obtain:
$ y_i' = y_(i+1) $ for $i = 1,2,dots,n-1$
$ y_n' = f(x, y_1, y_2, dots, y_n) $

#pagebreak()
== partial differential equations

=== standard form (linear, homogenous, 2nd order pde)
$ A (partial^2 u)/(partial x^2) + B (partial^2 u)/(partial x partial y) + C (partial^2 u)/(partial y^2) + D(partial u)/(partial x) + E(partial u)/(partial y) + F u = 0 $

parabolic equation: $B^2 - 4A C = 0$ (@heat[Heat Equation])

hyperbolic equation: $B^2 - 4A C > 0$ (@wave[Wave Equation])

elliptic equation: $B^2 - 4A C < 0$ (@laplace-eqn[Laplace Equation])

=== separation of variables
$ U(x,y) = X(x) Y(y) $
then $U_x = Y X^'$ and $U_y = Y^' X$
rewrite the PDE with these substitutions, then divide through by $X Y$. Integrate and solve.

=== change of variables
When a PDE is difficult to solve directly, changing variables can transform it into a simpler form.

For a second-order PDE, the transformation $u = u(xi, eta)$ where $xi = xi(x,y)$ and $eta = eta(x,y)$ requires computing:
$ (partial u)/(partial x) = (partial u)/(partial xi)(partial xi)/(partial x) + (partial u)/(partial eta)(partial eta)/(partial x) $
$ (partial u)/(partial y) = (partial u)/(partial xi)(partial xi)/(partial y) + (partial u)/(partial eta)(partial eta)/(partial y) $

And similarly for second-order derivatives. The canonical transformations are:
- For hyperbolic: $xi = x + y, eta = x - y$ (characteristic coordinates)
- For parabolic: $xi = x, eta = y - f(x)$ (transformation along characteristics)
- For elliptic: $xi = x + i y, eta = x - i y$ (complex characteristics)

= systems / dynamical systems

- $lambda_2 < lambda_1 < 0 arrow.r.double.long "stable node"$
- $0 < lambda_1 < lambda_2 arrow.r.double.long "unstable node"$
- $lambda_1 = lambda_2, lambda_1 > 0 arrow.r.double.long "unstable star"$
- $lambda_1 = lambda_2, lambda_1 < 0 arrow.r.double.long "stable star"$
- $lambda_1 < 0 < lambda_2 arrow.r.double.long "unstable saddle node"$
- $Re(lambda_1) = 0 arrow.r.double.long "centre, stable"$
- $Re(lambda_1) < 0 arrow.r.double.long "stable focus"$
- $Re(lambda_1) > 0 arrow.r.double.long "unstable focus"$

real canonical form 
For a linear system $dot(bold(x)) = bold(A) bold(x)$, the real canonical form depends on the eigenvalues of $bold(A)$:

- Real distinct eigenvalues $lambda_1 eq.not lambda_2$:
$ bold(A)_"canonical" = mat(lambda_1, 0; 0, lambda_2) $

- Real repeated eigenvalues $lambda_1 = lambda_2$ with linearly independent eigenvectors:
$ bold(A)_"canonical" = mat(lambda_1, 0; 0, lambda_1) $

- Real repeated eigenvalues $lambda_1 = lambda_2$ with one linearly independent eigenvector:
$ bold(A)_"canonical" = mat(lambda_1, 1; 0, lambda_1) $

- Complex conjugate eigenvalues $lambda = alpha plus.minus i beta$:
$ bold(A)_"canonical" = mat(alpha, beta; -beta, alpha) $

= functions

== wronskian <wronskian>
$ "W"(f_1, f_2, dots, f_n)(x) = det(
  mat(
    f_1(x), f_2(x), dots, f_n(x);
    f_1^'(x), f_2^'(x), dots, f_n^'(x);
    dots.v, dots.v, dots.down, dots.v;
    f_1^((n-1))(x), f_2^((n-1))(x), dots, f_n^((n-1))(x)
  )
) $
note that if a set of functions is linearly dependent, then its Wronskian will equal 0.

== power series, taylor series and maclaurin series expansions

#figure(
  align(center)[
    #box(
      width: 90%,
      fill: rgb(230, 240, 255),
      stroke: blue,
      inset: 2em,
    )[
      #align(center)[
        #text(weight: "bold", size: 1.2em)[Power Series]
        #linebreak()
        $sum_(n=0)^(infinity) a_n (x - a)^n$
      ]
      
      #v(1em)
      
      #align(center)[
        #box(
          width: 80%,
          fill: rgb(230, 250, 230),
          stroke: green,
          inset: 2em,
        )[
          #align(center)[
            #text(weight: "bold", size: 1.2em)[Taylor Series]
            #linebreak()
            $sum_(n=0)^(infinity) (f^((n))(a))/(n!) (x - a)^n$
          ]
          
          #v(1em)
          
          #align(center)[
            #box(
              width: 70%,
              fill: rgb(255, 240, 220),
              stroke: orange,
              inset: 2em,
            )[
              #align(center)[
                #text(weight: "bold", size: 1.2em)[Maclaurin Series]
                #linebreak()
                $sum_(n=0)^(infinity) (f^((n))(0))/(n!) x^n$
              ]
            ]
          ]
        ]
      ]
    ]
  ],
  caption: [Relationship between power series, Taylor series, and Maclaurin series, showing proper subset relationships]
)

== orthogonality <orthogonal>
A set of functions ${phi_n}_(n=1,2,3,dots)$ is said to be orthogonal on the interval $[a,b]$ with respect to the inner product defined by
$ (f, g)_w = integral^b_a w(x)f(x)g(x) dif x $
with weight function $w(x) > 0$, if $(phi_n,phi_m)_w =0$ for $m eq.not n$.

== orthonormality <orthonormal>
a set ${phi_n}_(n=1,2,3,dots)$ is _orthonormal_ when in addition to being @orthogonal, $(phi_n,phi_n) = 1$, for $n = 1,2,3,dots.h$.

== cauchy-euler <cauchy-euler>
$ x^2 y^('') + a_1 x y^' + a_0 y = 0$
you can solve this by either letting $x = e^t$ or using the ansatz $y = x^lambda$
the characteristic equation is $lambda^2 + (a_1 - 1) lambda + a_0 = 0$
if you are blessed with the inhomogenous case of above, just use method of undetermined coefficients @method-uc.

== legendre <legendre>
legendre's (differential) equation
$ ( 1 - x^2 )y^('') - 2x y^' + n(n+1)y = 0 $
legendre's polynomials

== bessel <bessel>
bessel's differential equation
$ y^('') x^2 + x y^' + (x^2 - nu^2) y = 0 $

bessel function of the first kind of order $alpha$:

$ J_alpha(x) = sum^infinity_(m=0) (-1)^m / Gamma(m+1)Gamma(m+alpha+1) (x/2)^(2m+alpha) $
implies $ dif / dif x [x^alpha J_alpha(x)] = x^alpha J_(alpha-1)(x) $
implies $ integral^r_0 x^n J_(n-1) (x) dif x = r^n J_n(r) $ for $n = 1, 2, 3, dots.h$

thus the de admits solutions
case 1: $2 nu in.not ZZ $
$ y(x) = A J_(nu)(x) + B J_(-nu)(x) $
$J_(nu)(x)$, $J_(-nu)(x)$ linearly independent
case 2: $2 nu in ZZ $
$ y(x) = A J_(nu)(x) + B J_(-nu)(x) $
case 3: $nu in ZZ $
$J_(nu)(x)$, $J_(-nu)(x)$ linearly independent
$ y(x) = A J_(nu)(x) + B Y_(nu)(x) $

== laguerre's equation
<laguerre>
$ x y^('') + (1-x)y^' +n y = 0 $

== hermite's equation
<hermite>
$ y^('') - 2 x y^' + 2 n y = 0 $

== sturm-liouville form
$ (p y^')^' + (q + lambda r ) y = 0 $

note that @bessel[Bessel], @laguerre[Laguerre], @hermite[Hermite] and @legendre[Legendre] equations can all be written in this form. furthermore, *any* 2nd order linear homogenous ODE $y^('') + a_1(x)y^' + [a_2(x) + lambda a_3(x)]y = 0$ may be written in this form.

== heat equation (pde) <heat>
$ (partial^2 u) / (partial x^2) = (partial u)/(partial t) $

== wave equation (pde) <wave>

$ (partial^2 u) / (partial x^2) = 1/c^2 (partial^2 u)/(partial t^2) $

== laplace's equation (pde ) <laplace-eqn>

$ (partial^2 u)/ (partial x^2) + (partial^2 u) / (partial y^2) = 0 $

== fourier series

$ y(x) = a_0/2 + sum^N_(n=1) (a_n cos (n x) + b_n sin (n x)) $
$ a_n = 1/pi integral^pi_(-pi) y(x) cos(n x) dif x, n = 0, 1, 2, dots.h $
$ b_n = 1/pi integral^pi_(-pi) y(x) sin(n x) dif x, n = 1, 2, dots.h $

== parseval's identity
$ (|| f ||^2) / L = 1/L integral^L_(-L) f^2 dif x
= a_0 / 2 + sum^infinity_(n=1) (a_n^2 + b_n^2) $

