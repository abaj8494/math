import itertools
import matplotlib.pyplot as plt
import math

def generate_grid_points(N):
    return {(x, y) for x in range(N) for y in range(N)}

def generate_directions():
    # All 8 cardinal and diagonal directions
    return [(dx, dy) for dx in range(-1, 2) for dy in range(-1, 2)
            if not (dx == 0 and dy == 0)]

def extend_line(start, direction, limit=10):
    """Yield points along a direction, extending out to a limit in both directions."""
    x, y = start
    dx, dy = direction
    for length in range(1, limit):
        yield (x + dx * length, y + dy * length)

def points_on_segment(p1, p2, grid):
    """Return grid points on the segment from p1 to p2."""
    x0, y0 = p1
    x1, y1 = p2
    result = set()
    for px, py in grid:
        if is_colinear(p1, p2, (px, py)) and is_between(p1, p2, (px, py)):
            result.add((px, py))
    return result

def is_colinear(p1, p2, p):
    """Check if point p is on line p1-p2."""
    (x0, y0), (x1, y1), (x, y) = p1, p2, p
    return (x1 - x0)*(y - y0) == (y1 - y0)*(x - x0)

def is_between(p1, p2, p):
    """Check if p is between p1 and p2 (inclusive)."""
    x0, y0 = p1
    x1, y1 = p2
    x, y = p
    return min(x0, x1) <= x <= max(x0, x1) and min(y0, y1) <= y <= max(y0, y1)

def backtrack(N, current, lines_used, max_lines, covered, path, grid):
    if covered == grid:
        return True, path
    if lines_used >= max_lines:
        return False, None

    for direction in generate_directions():
        for new_end in extend_line(current, direction, limit=N+3):
            if new_end == current:
                continue
            pts = points_on_segment(current, new_end, grid)
            if pts - covered:  # Only proceed if new points are added
                new_covered = covered | pts
                success, full_path = backtrack(
                    N,
                    new_end,
                    lines_used + 1,
                    max_lines,
                    new_covered,
                    path + [(current, new_end)],
                    grid
                )
                if success:
                    return True, full_path
    return False, None

def solve_dot_puzzle(N):
    grid = generate_grid_points(N)
    max_lines = 2 * N - 2
    for start in grid:
        success, path = backtrack(N, start, 0, max_lines, set(), [], grid)
        if success:
            return path
    return None

def plot_solution(N, path):
    plt.figure(figsize=(6, 6))
    for x in range(N):
        for y in range(N):
            plt.plot(x, y, 'ko')
    plt.axis('equal')
    plt.axis('off')
    plt.show()

# Run
N = 3
solution = solve_dot_puzzle(N)
if solution:
    print(f"Solved with {len(solution)} lines:")
    for seg in solution:
        print(seg)
    plot_solution(N, solution)
else:
    print("No solution found.")

