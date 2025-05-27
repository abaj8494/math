from itertools import combinations, product
import matplotlib.pyplot as plt
import math

def all_dots(N):
    return {(x, y) for x in range(N) for y in range(N)}

def on_line(p1, p2, p):
    # Check if point p lies on line segment p1->p2
    (x0, y0), (x1, y1), (x, y) = p1, p2, p
    cross = (x - x0) * (y1 - y0) - (y - y0) * (x1 - x0)
    if cross != 0:
        return False
    dotprod = (x - x0) * (x1 - x0) + (y - y0) * (y1 - y0)
    if dotprod < 0:
        return False
    squaredlength = (x1 - x0)**2 + (y1 - y0)**2
    if dotprod > squaredlength:
        return False
    return True

def covered_points(p1, p2, grid_points):
    return {p for p in grid_points if on_line(p1, p2, p)}

def distance(p1, p2):
    return math.hypot(p2[0] - p1[0], p2[1] - p1[1])

def generate_extended_points(N, margin=3):
    return list(product(range(-margin, N + margin), repeat=2))

def search_path(N, max_lines):
    grid = all_dots(N)
    extended_points = generate_extended_points(N)
    
    def backtrack(path, covered):
        if len(path) == max_lines:
            return covered == grid, path
        for p2 in extended_points:
            if not path:
                p1 = p2
            else:
                p1 = path[-1][1]
            if p1 == p2:
                continue
            seg = (p1, p2)
            new_covered = covered | covered_points(p1, p2, grid)
            valid, final_path = backtrack(path + [seg], new_covered)
            if valid:
                return True, final_path
        return False, None

    valid, solution = backtrack([], set())
    return solution

def plot_solution(N, solution):
    plt.figure(figsize=(6, 6))
    for x in range(N):
        for y in range(N):
            plt.plot(x, y, 'ko')
    for (x0, y0), (x1, y1) in solution:
        plt.plot([x0, x1], [y0, y1], 'r-')
    plt.gca().set_aspect('equal')
    plt.grid(True)
    plt.title(f'Solution on {N}x{N} Grid with {len(solution)} lines')
    plt.show()

# Run for N = 3 (classic)
N = 3
solution = search_path(N, 4)
if solution:
    print(f"Found solution with {len(solution)} lines:")
    for seg in solution:
        print(seg)
    plot_solution(N, solution)
else:
    print("No solution found.")

