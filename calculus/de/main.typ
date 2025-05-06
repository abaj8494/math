#import "custom.typ": mgrid, veq

#set heading(numbering:"1.")
#set math.equation(numbering: "(1)")
= Definitions

order = the power the differential is raised to.
linear = differentials are not being multiplied by other differentials. this includes the zeroth power:
$ mgrid(gutter: #1em,
    underbrace((dif ^2 y / dif t))
      & underbrace(cos(x) (dif y)/(dif x)) \
      & underbrace((dif y) / (dif t) (dif ^3 y) / (dif t^3)) \
      & underbrace(y (dif y)/(dif x)) \

    veq && veq && veq && veq \
  
    "linear" & "linear" & "non-linear" & "non-linear" \
)$

autonomous = independent variable does not appear in the equation
non-autonomous = independent variable _does_ appear in the equation

ansatz
indicial equation

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





  == Second Order

  === standard form

  === constant coefficients

  === homogenous
  solve the characteristic equation. cases:

  === inhomogenous -> method of undetermined coefficients
  y(x) = y_h(x) + y_p(x)
  guesses for y_p(x):



  === variation of parameters

  === power series expansion (not sure if it works for n order)

  === method of frobenius

  == n order

  === power series expansion (not sure if it works for n order)

  === reduction of order

  == partial differential equations

  == separable

  == change of variables

  == 

= systems / dynamical systems

equilibrium point
stability
  - stable node
  - unstable bicritical node ("star")
  - stable centre
  - unstable saddle point
  - unstable focus
real canonical form

= Theory

ordinary point
regular singular point
irregular singular point

= functions

== wronskian

== power series expansions

== orthogonality
<orthogonal>
A set of functions ${phi_n}_(n=1,2,3,dots)$ is said to be orthogonal on the interval $[a,b]$ with respect to the inner product defined by
$ (f, g)_w = integral^b_a w(x)f(x)g(x) dif x $
with weight function $w(x) > 0$, if $(phi_n,phi_m)_w =0$ for $m eq.not n$.

== orthonormality
a set ${phi_n}_(n=1,2,3,dots)$ is _orthonormal_ when in addition to being @orthogonal, $(phi_n,phi_n) = 1$, for $n = 1,2,3,dots.h$.

== legendre 
<legendre>
legendre's (differential) equation
$ ( 1 - x^2 )y^('') - 2x y^' + n(n+1)y = 0 $
legendre's polynomials

== bessel
<bessel>
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
