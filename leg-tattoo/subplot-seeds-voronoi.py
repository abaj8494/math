"""
Nine 1-NN Voronoi diagrams in one go
------------------------------------
• 9 seeds (0‥8) → 9 subplots
• 9 random points per subplot (unit square)
• Greyscale shading = printer-friendly
"""
import numpy as np
import matplotlib.pyplot as plt

def voronoi_1nn(points, resolution=400):
    xs = np.linspace(0, 1, resolution)
    ys = np.linspace(0, 1, resolution)
    gx, gy = np.meshgrid(xs, ys)  # (res, res)

    dists = np.sqrt(
        (gx[None] - points[:, 0][:, None, None])**2 +
        (gy[None] - points[:, 1][:, None, None])**2
    )
    return np.argmin(dists, axis=0)     # label = nearest seed

# ---------- parameters ----------
n_points   = 9
resolution = 400
seeds      = range(9)   # 0‥8

fig, axes = plt.subplots(3, 3, figsize=(9, 9), sharex=True, sharey=True)

for ax, seed in zip(axes.flat, seeds):
    np.random.seed(seed)
    pts = np.random.rand(n_points, 2)           # 9 seed points
    regions = voronoi_1nn(pts, resolution)

    ax.imshow(regions,
              extent=(0, 1, 0, 1),
              origin="lower",
              interpolation="nearest",
              cmap="gray")                      # grayscale palette
    ax.scatter(pts[:, 0], pts[:, 1], c="black", s=12)
    ax.set_title(f"seed {seed}", fontsize=8)
    ax.set_xticks([]); ax.set_yticks([])

plt.tight_layout()
plt.show()

