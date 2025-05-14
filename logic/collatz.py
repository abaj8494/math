#!/opt/anaconda3/bin/python
"""collatz.py
takes in a positive integer `n` as an argument and calculates the shortest collatz sequence

the collatz sequence is given by two choices at each node, one guaranteed, the other conditional:
1. given `n`, you may always double it.
2. if `n=3k+1` you may set `n = k`

we will perform a breadth first search to find the shortest route.
"""

import argparse

class Queue:
  def __init__(self, capacity):
    self.data = [0 for _ in range(capacity)]
    self.front = 0
    self.rear = -1
    self.size = 0

  def enqueue(self, value):
    """
    inserts element at rear of queue
    """
    if self.is_full():
      raise Exception("Queue is full")
    self.rear = (self.rear + 1) % len(self.data)
    self.data[self.rear] = value
    self.size += 1

  def dequeue(self):
    """
    removes the element from the front of queue
    return: popped element
    """
    if self.is_empty():
      raise Exception("Queue is empty")
    value = self.data[self.front]
    self.front = (self.front + 1) % len(self.data)
    self.size -= 1
    return value

  def peek(self):
    pass

  def is_empty(self):
    """
    checks if queue is is empty
    """
    return self.size == 0

  def is_full(self):
    """
    checks if queue is full
    """
    return self.size == len(self.data)

def collatz(n, c=False):
  start = 1
  current = start
  end = n
  q = Queue(1000)
  while (current != end):
    q.enqueue(2*current)
    k = (current-1) / 3
    if (k.is_integer()):
      q.enqueue(k)
    current = q.dequeue()
  return current

if __name__ == "__main__":
  parser = argparse.ArgumentParser("query")
  parser.add_argument("-n", type=int, help="positive integer n >= 1 to generate collatz sequence for")
  parser.add_argument("-c", type=bool, default=False, help="optional. indicates whether you want all sequences up to `n`")

  args = parser.parse_args()
  print(collatz(args.n, args.c))



