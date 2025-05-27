import matplotlib.pyplot as plt

# Classic 3x3 dot coordinates
dots = [(x, y) for y in range(2, -1, -1) for x in range(3)]

# The solution path: list of (x, y) points forming 4 lines
# Note: Lines go outside the grid!
solution = [
    (-0.5, 2.5),   # Start well outside top-left
    (3, -0.5),     # Line 1: through top and middle-right
    (1.5, -1),     # Line 2: down and slightly left
    (-1, 1.5),     # Line 3: up diagonally left
    (3.5, 3.5),    # Line 4: final sweep through top-right
]

def plot_solution(dots, path):
    plt.figure(figsize=(6, 6))
    
    # Plot dots
    for (x, y) in dots:
        plt.plot(x, y, 'ko', markersize=10)
    
    # Plot path
    x_vals, y_vals = zip(*path)
    plt.plot(x_vals, y_vals, 'r-', linewidth=2)

    # Styling
    plt.gca().set_aspect('equal')
    plt.xlim(-2, 5)
    plt.ylim(-2, 5)
    plt.axis('off')
    plt.title("Classic 3x3 Nine Dots Puzzle Solution")
    plt.show()

plot_solution(dots, solution)

