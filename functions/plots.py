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

if __name__ == "__main__":
  polynomial("poly-sp.svg")
  rational("rational-sp.svg")
  power_plot("rational-powers.svg")
  exp("exponential.svg")
  sigmoid("sigmoid.svg")
  log("logarithm.svg")





