"""plots.py
a corresponding python program for the `Catalogue of Scalar Valued Functions`.

we use matplotlib and numpy to produce the plots of elementary, non-elementary and discontinous functions discussed in the catalogue

each function produces its own figure
"""

def polynomial(filename):
  """plots a 2 by 4 subplot ranging from 0th degree to 7th degree polynomials
  saves the figure in the given filename"""
  pass

def rational(filename):
  """plots 1 by 2 subplot of rational functions"""
  pass

def power_plot(filename):
  """plots 7 rational power plots on the same figure. curves labelled"""
  pass

def exp(filename):
  """plots: e^x and a^x in a subplot"""
  pass

def sigmoid(filename):
  """plots the sigmoid function: 1/(1+e^(-x))"""
  pass

def log(filename):
  """three plots: log_10(x); log_2(x); log_e(x)"""

def exp_log_inv(filename):
  """plots the natural logarithm and natural exponential on each side of `y=x`"""

def basic_trig(filename):
  """1 row by 3 col subplot of the sin, cos, tan from -pi to pi"""
  pass

def inv_basic_trig(filename):
  """inverse trigs: arcsin, arccos, arctan. 1x3 subplot"""
  pass

def recip_b_trig(filename):
  """reciprocal trigs: cosec, sec, cot. 1x3 subplot"""
  pass

def hype_trig(filename):
  """"""
  pass

def inv_hyp_trig(filename):
  """"""
  pass

def recip_hyp_trig(filename):
  """"""
  pass

def elem_fac(filename):
  """"""
  pass

def gamma(filename):
  """"""
  pass

def beta(filename):
  """"""
  pass

def zeta(filename):
  """"""
  pass

def err(filename):
  """"""
  pass

def tetration(filename):
  """"""
  pass

def elliptic(filename):
  """"""
  pass

def trig_int(filename):
  """"""
  pass

def fresnel(filename):
  """"""
  pass

def bessel(filename):
  """"""
  pass

def hypergeo(filename):
  """"""
  pass

def absolutev(filename):
  """"""
  pass

def step(filename):
  """"""
  pass

def heaviside(filename):
  """"""
  pass

def floor_plot(filename):
  """"""
  pass

def ceil_plot(filename):
  """"""
  pass

def square_wave(filename):
  """"""
  pass

if __name__ == "__main__":
  polynomial("poly-sp.svg")
  rational("rational-sp.svg")
  power_plot("rational-powers.svg")
  exp("exponential.svg")
  sigmoid("sigmoid.svg")
  log("logarithm.svg")
  exp_log_inv("exp_log_inv.svg")
  basic_trig("basic_trig.svg")
  inv_basic_trig("inv_basic_trig.svg")
  recip_b_trig("rec_basic_trig.svg")
  hype_trig("hype_trig.svg")
  inv_hyp_trig("inv_hype_trig.svg")
  recip_hyp_trig("recip_hyp_trig.svg")
  elem_fac("elem_fac.svg")
  gamma("gamma.svg")
  beta("beta.svg")
  zeta("zeta.svg")
  err("err.svg")
  tetration("tetration.svg")
  elliptic("elliptic.svg")
  trig_int("trig_int.svg")
  fresnel("fresnel.svg")
  bessel("bessel.svg")
  hypergeo("hypergeo.svg")
  absolutev("abs_v.svg")
  step("step.svg")
  heaviside("heaviside.svg")
  floor_plot("floor.svg")
  ceil_plot("ceiling.svg")
  square_wave("square_wave.svg")





