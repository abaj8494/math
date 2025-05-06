#import "custom.typ": mgrid, veq

#set heading(numbering:"1.")
#set math.equation(numbering: "(1)")

= Definitions <definitions>

order = the power the differential is raised to.
linear = the dependent variable and it's derivatives are all not non-linear.
$ mgrid(gutter: #1em,
    underbrace((dif ^2 y / dif t))
      & underbrace(cos(x) (dif y)/(dif x))
      & underbrace((dif y) / (dif t) (dif ^3 y) / (dif t^3))
      & underbrace(y^' = e^y)
      & underbrace(y (dif y)/(dif x)) \

    veq && veq && veq && veq \
  
    "linear" & "linear" & "non-linear" & "non-linear" & "non-linear" \
)$

autonomous = independent variable does not appear in the equation
non-autonomous = independent variable _does_ appear in the equation

ansatz = our initial guess for the form of a solution, i.e. $y_p = A cos (t) + B sin (t)$
indicial equation = a quadratic equation that pops out during the application of the Frobenius method

analytic = a function is analytic at a point if it can be expressed as a convergent power series in a neighborhood of that point  
ordinary point = when $p(x)$ and $q(x)$ are analytic at that point <ordinary-point>
regular singular point = if $P(x) = (x-x_0)p(x)$ and $Q(x) = (x-x_0)^2 q(x)$ are both analytic at $x_0$.
irregular singular point = not regular.

= Solving Methods

  == First Order
  table of contents

  === standard form
  $ (dif y) / (dif x) = f(x, y) $

  === separable
  $ (dif y)/(dif x) = f(x) g(y)
  arrow.r.double.long integral (dif y)/g(y) = integral f(x) dif x$

  === reduction to separable

  $ (dif y) / (dif x) = f ( y/x) $
  substitution: $y(x) = x v(x)$

  === linear standard form

  $ (dif y) / (dif x) + p(x) y = q(x) $ <linear-standard-form>

  ==== integrating factor

  note, the coefficient of $y'(x)$ must be 1.

  $ phi(x) = exp(integral p(x) dif x)$ <phi_x>

  multiplying the @linear-standard-form[Linear Standard Form] with $phi(x)$ yields:

  $ (dif)/(dif x)(phi y) = phi(x) q(x)
  arrow.r.double.long y = phi^(-1) integral phi q(x) dif x $

  === exact

  == Second Order

  === standard form

  === reducible to first order

  $ (dif^2 y)/(dif x) + f(y, (dif y)/(dif x)) = 0$

  is reducible to the first-order ODE

  $ p (dif p)/(dif y) + f(y, p) = 0 $

  === constant coefficients

  ==== homogenous
  solve the characteristic equation. cases:

  $ y = C e^((alpha + beta i)x) + D e^((alpha - beta i)x)
  = e^(alpha x)(A cos (beta x) + B sin (beta x)) "by DeMoivre's Theorem" $

  ==== inhomogenous -> method of undetermined coefficients
  y(x) = y_h(x) + y_p(x)
  guesses for y_p(x):

  === variation of parameters
  This method works for any 2nd order inhomogenous ODE if the complementary solution is known.

  Theorem:
  The general solution of the 2nd order inhomogenous ODE:
  $ y^('') + b_1 (x) y^' + b_0 (x) y = f(x) $

  is given by $y(x) = u_1(x) y_1(x) + u_2(x) y_2(x)$
  
  where $y_1$ and $y_2$ are linearly independent solutions of the homogenous ODE such that the Wronskian $W(x) eq.not 0$ and 
  $ u_1(x) = -integral (y_2(x)f(x))/(W(x)) dif x, "and"
  u_2(x) = integral (y_1(x)f(x))/(W(x)) dif x $

  === power series method

  pick ansatz of the form
  $ y = sum^infinity_(n=0) a_n z^n $
  and take derivatives as required. for example:
  $ (dif y)/(dif z) = sum^infinity_(n=1) n a_n z^(n-1) 
  (dif^2 y)/(dif z^2) = sum^infinity_(n=2) n(n-1) a_n z^(n-2) $
  and substitute them into the ODE. Then solve by rearranging indices as necessary to obtain a recurrence relation. Apply the initial conditions and then guess the closed-form solution of the recurrence relation. Change back to the original variables if required.

  If $x_0$ is an ordinary point @definitions of the differential equation
  $ y^('') + p(x)y^' + q(x)y = 0 $
  then the general solution in a neighbourhood $| x - x_0 | < R$ may be represented as a power series.

  === method of frobenius
  Theorem:
  If $x_0 = 0$ is a regular singular point of the differential equation
  $ y^('') + p(x)y^' + q(x)y = 0 $
  then there exists at least one series solution of the form
  $ y(x) = x^r sum^infinity_(n=0) c_n x^n
  = sum^infinity_(n=0) c_n x^(n+r), c_0 eq.not 0$
  for some constant $r$ (index).

  == n order

  === power series expansion (not sure if it works for n order)

  === reduction of order

  == partial differential equations

  == separable

  == change of variables


= systems / dynamical systems

equilibrium point
stability
  - stable node
  - unstable bicritical node ("star")
  - stable centre
  - unstable saddle point
  - unstable focus
real canonical form

= functions


== wronskian

== power series, taylor series and maclaurin series expansions
#import "@preview/cetz:0.0.1": *

cetz.diagram(
  size: (20cm, 12cm),
  [
    ellipse[
      center: (10cm, 6cm),
      radius: (8cm, 4.5cm),
      fill: blue.lighten(4),
      stroke: blue,
      label: [top, "Power Series"],
    ],
    text[
      at: (10cm, 9.5cm),
      content: $sum_(n=0)^(infinity) a_n (x - a)^n$,
    ],

    ellipse[
      center: (10cm, 6cm),
      radius: (5.5cm, 3.2cm),
      fill: green.lighten(4),
      stroke: green,
      label: [top, "Taylor Series"],
    ],
    text[
      at: (10cm, 7.8cm),
      content: $sum_(n=0)^(infinity) (f^((n))(a))/(n!) (x - a)^n$,
    ],

    ellipse[
      center: (10cm, 6cm),
      radius: (3cm, 1.8cm),
      fill: orange.lighten(4),
      stroke: orange,
      label: [top, "Maclaurin Series"],
    ],
    text[
      at: (10cm, 6.8cm),
      content: $sum_(n=0)^(infinity) (f^((n))(0))/(n!) x^n$,
    ],
  ]
)

== orthogonality <orthogonal>
A set of functions ${phi_n}_(n=1,2,3,dots)$ is said to be orthogonal on the interval $[a,b]$ with respect to the inner product defined by
$ (f, g)_w = integral^b_a w(x)f(x)g(x) dif x $
with weight function $w(x) > 0$, if $(phi_n,phi_m)_w =0$ for $m eq.not n$.

== orthonormality <orthonormal>
a set ${phi_n}_(n=1,2,3,dots)$ is _orthonormal_ when in addition to being @orthogonal, $(phi_n,phi_n) = 1$, for $n = 1,2,3,dots.h$.

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

== laguerre's equation
<laguerre>
$ x y^('') + (1-x)y^' +n y = 0 $

== hermite's equation
<hermite>
$ y^('') - 2 x y^' + 2 n y = 0 $

== sturm-liouville form
$ (p y^')^' + (q + lambda r ) y = 0 $

note that @bessel, @laguerre, @hermite and @legendre equations can all be written in this form.

== wave equation (pde)

$ (partial^2 u) / (partial x^2) = 1/c^2 (partial^2 u)/(partial t^2) $

== laplace's equation

$ (partial^2 u)/ (partial x^2) + (partial^2 u) / (partial y^2) = 0 $

= wheretoput
reduction of order
fourier series
  - sine, cosine
parseval's identity'

cauchy-euler
