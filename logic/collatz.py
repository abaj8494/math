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
    self.data = [None] * capacity
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
  q = Queue(1000)
  q.enqueue((1, [1])) # now enqueuing a tuple so we can track path
  seen = {1}

  while not q.is_empty():
    current, path = q.dequeue()

    if current == n:
      return path
    
    doubled = current * 2
    """another way to compress the following would be to use:
    for nxt in (current * 2,
                (current - 1) // 3 if (current - 1) % 3 == 0 else None):
    """
    if doubled not in seen:
      seen.add(doubled)
      q.enqueue((doubled, path + [doubled]))

    if (current - 1) % 3 == 0:
      k = (current - 1) // 3
      if k not in seen:
        seen.add(k)
        q.enqueue((k, path + [k]))


if __name__ == "__main__":
  parser = argparse.ArgumentParser("query")
  parser.add_argument("-n", type=int, help="positive integer n >= 1 to generate collatz sequence for")
  parser.add_argument("-c", type=bool, default=False, help="optional. indicates whether you want all sequences up to `n`")

  args = parser.parse_args()
  print(collatz(args.n, args.c))



