from matplotlib import colors
import numpy as np
import matplotlib.pyplot as plt

n_points = 9
np.random.seed(0)
points = np.random.rand(n_points, 2)

resolution = 1200
xs = np.linspace(0, 1, resolution)
ys = np.linspace(0, 1, resolution)
grid_x, grid_y = np.meshgrid(xs, ys)   # shapes (res, res)

# distance from every grid pixel to every seed (broadcasting magic)
dists = np.sqrt(
    (grid_x[None] - points[:, 0, None, None])**2 +
    (grid_y[None] - points[:, 1, None, None])**2
)                                     # shape (10, res, res)

regions = np.argmin(dists, axis=0)    # 1-nearest-neighbor label per pixel

plt.figure(figsize=(6, 6))
levels = np.arange(10*n_points) + 0.5
plt.contour(xs, ys, regions, levels=levels,  # xs, ys come from np.linspace earlier
           colors="black", linewidths=0.6)
#plt.imshow(regions, extent=(0, 1, 0, 1), origin="lower", interpolation="nearest")
#plt.scatter(points[:, 0], points[:, 1], marker="o", c="black")  # overlay seeds
plt.xlabel("x"); plt.ylabel("y")
plt.tight_layout()
plt.savefig("v-bw.svg", format="svg")
plt.show()

