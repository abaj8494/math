import heapq
import itertools
import numpy as np
from collections import deque
import matplotlib.pyplot as plt

def generate_grid_points(N):
    return {(x, y) for x in range(N) for y in range(N)}

def generate_directions():
    return [(dx, dy) for dx in range(-1, 2) for dy in range(-1, 2) if (dx, dy) != (0, 0)]

def extend_line(start, direction, limit=10):
    x, y = start
    dx, dy = direction
    for i in range(1, limit):
        yield (x + dx * i, y + dy * i)

def is_colinear(p1, p2, p):
    (x0, y0), (x1, y1), (x, y) = p1, p2, p
    return (x1 - x0)*(y - y0) == (y1 - y0)*(x - x0)

def is_between(p1, p2, p):
    x0, y0 = p1
    x1, y1 = p2
    x, y = p
    return min(x0, x1) <= x <= max(x0, x1) and min(y0, y1) <= y <= max(y0, y1)

def points_on_segment(p1, p2, grid):
    result = set()
    for pt in grid:
        if is_colinear(p1, p2, pt) and is_between(p1, p2, pt):
            result.add(pt)
    return result

def count_clusters(points):
    """Counts number of connected groups in the uncovered points."""
    points = set(points)
    if not points:
        return 0

    visited = set()
    clusters = 0
    dirs = generate_directions()

    for pt in points:
        if pt in visited:
            continue
        clusters += 1
        queue = deque([pt])
        visited.add(pt)
        while queue:
            curr = queue.popleft()
            for dx, dy in dirs:
                neighbor = (curr[0] + dx, curr[1] + dy)
                if neighbor in points and neighbor not in visited:
                    visited.add(neighbor)
                    queue.append(neighbor)
    return clusters

def solve_dot_puzzle_astar(N):
    grid = generate_grid_points(N)
    max_lines = 2 * N - 2
    directions = generate_directions()
    limit = N + 3  # how far outside the grid lines can go

    for start in grid:
        initial_state = (start, 0, frozenset({start}))
        heap = []
        heapq.heappush(heap, (0, initial_state, []))

        visited_states = set()

        while heap:
            f_score, (pos, lines_used, covered), path = heapq.heappop(heap)

            if len(covered) == N * N and lines_used <= max_lines:
                return path

            if (pos, covered) in visited_states:
                continue
            visited_states.add((pos, covered))

            if lines_used >= max_lines:
                continue

            for direction in directions:
                for new_end in extend_line(pos, direction, limit):
                    if new_end == pos:
                        continue
                    segment_points = points_on_segment(pos, new_end, grid)
                    new_covered = set(covered) | segment_points

                    if frozenset(new_covered) == frozenset(covered):
                        continue  # no new dots covered

                    h = count_clusters(grid - new_covered)
                    g = lines_used + 1
                    f = g + h
                    new_state = (new_end, g, frozenset(new_covered))
                    heapq.heappush(heap, (f, new_state, path + [(pos, new_end)]))
    return None

def plot_solution(N, path):
    plt.figure(figsize=(6, 6))
    for x in range(N):
        for y in range(N):
            plt.plot(x, y, 'ko')
    for (x0, y0), (x1, y1) in path:
        plt.plot([x0, x1], [y0, y1], 'r-', linewidth=2)
    plt.title(f'{N}x{N} Puzzle Solved with {len(path)} lines')
    plt.gca().set_aspect('equal')
    plt.axis('off')
    plt.show()

N = 4
solution = solve_dot_puzzle_astar(N)
if solution:
    print(f"Solved with {len(solution)} lines")
    for seg in solution:
        print(seg)
    plot_solution(N, solution)
else:
    print("No solution found.")

