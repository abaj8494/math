#!/opt/anaconda3/bin/python
"""collatz.py
takes in a positive integer `n` as an argument and applies the collatz rules:

1. if `n` is even, half it
2. else set `n=k` where `n=3k+1`

"""

import argparse

def is_even(n):
  return n % 2 == 0

def collatz(n):
  current = n
  path = [n]
  while current != 1:
    if is_even(current):
      current = current // 2
    else:
      current = (current * 3) + 1
    path += [current]
  return path, len(path)


if __name__ == "__main__":
  parser = argparse.ArgumentParser("query")
  parser.add_argument("-n", type=int, help="positive integer n >= 1 to generate collatz sequence for")

  args = parser.parse_args()
  t = collatz(args.n)
  print(f"Sequence: {t[0]}\nLength: {t[1]}")



