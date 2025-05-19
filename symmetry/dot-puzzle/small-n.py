import itertools
import matplotlib.pyplot as plt

def generate_grid(N):
    return {(x, y) for x in range(N) for y in range(N)}

def generate_candidates(N, margin=2):
    return list(itertools.product(range(-margin, N + margin), repeat=2))

def is_on_segment(a, b, p):
    # Check if p lies on line segment from a to b
    (x0, y0), (x1, y1), (x, y) = a, b, p
    cross = (x - x0)*(y1 - y0) - (y - y0)*(x1 - x0)
    if cross != 0:
        return False
    dot = (x - x0)*(x1 - x0) + (y - y0)*(y1 - y0)
    if dot < 0:
        return False
    squared_len = (x1 - x0)**2 + (y1 - y0)**2
    return dot <= squared_len

def covered_dots(a, b, grid):
    return {pt for pt in grid if is_on_segment(a, b, pt)}

def find_path(N):
    grid = generate_grid(N)
    points = generate_candidates(N, margin=2)
    grid_dots = generate_grid(N)
    min_lines = 2 * N - 2

    # Try all possible sequences of line segments
    for combo in itertools.combinations(itertools.combinations(points, 2), min_lines):
        path = list(combo)
        total_covered = set()
        for a, b in path:
            total_covered |= covered_dots(a, b, grid)
        if total_covered == grid:
            return path
    return None

def plot_solution(N, path):
    plt.figure(figsize=(6, 6))
    # Plot grid dots
    for x in range(N):
        for y in range(N):
            plt.plot(x, y, 'ko', markersize=6)
    # Plot lines
    for (x0, y0), (x1, y1) in path:
        plt.plot([x0, x1], [y0, y1], 'r-', linewidth=2)
    plt.gca().set_aspect('equal')
    plt.grid(True)
    plt.title(f'{N}x{N} Grid — {len(path)} Line Solution')
    plt.show()

# Example for N = 3
N = 3
solution = find_path(N)
if solution:
    print(f"Solution with {len(solution)} lines:")
    for seg in solution:
        print(seg)
    plot_solution(N, solution)
else:
    print("No solution found.")

