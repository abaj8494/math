import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl

# ------------------------------------------------------------------
# Tell Matplotlib to run real LaTeX and load the packages you need
mpl.rcParams.update({
    "text.usetex": True,
    "font.family": "serif",
    "text.latex.preamble": r"\usepackage{amsmath,amssymb,bm}"
})

# … your Voronoi code (omitted here for brevity) …


# ---------- 0. seeds & grid --------------------------------------------------
n_points   = 9
resolution = 1200

np.random.seed(0)
points = np.random.rand(n_points, 2)

xs = np.linspace(0, 1, resolution)
ys = np.linspace(0, 1, resolution)
grid_x, grid_y = np.meshgrid(xs, ys)

# ---------- 1. 1-NN label for every pixel ------------------------------------
dists = np.sqrt(
    (grid_x[None] - points[:, 0, None, None])**2 +
    (grid_y[None] - points[:, 1, None, None])**2
)
regions = np.argmin(dists, axis=0)           # shape (res, res), values 0‥8

# ---------- 2. draw only the borders -----------------------------------------
plt.figure(figsize=(6, 6))
levels = np.arange(n_points) + 0.5           # one level between labels
plt.contour(xs, ys, regions,
            levels=levels, colours="black", linewidths=0.6)

# ---------- 3. centroid of each region ---------------------------------------
centroids = []
for i in range(n_points):
    ys_idx, xs_idx = np.where(regions == i)
    cx = xs[xs_idx].mean()
    cy = ys[ys_idx].mean()
    centroids.append((cx, cy))

# ---------- 4. LaTeX expressions ---------------------------------------------
exprs = [
    r"$\boldsymbol{\vdash}$",
    r"$\boldsymbol{\sum i^{n} / n!}$",
    r"$\boldsymbol{\cup}$",
    r"$\boldsymbol{\varnothing \stackrel{\nabla}{\leadsto}\,\circ}$",   # TikZ-free
    r"$\boldsymbol{\exists}$",
    r"$\displaystyle \int \boldsymbol{\partial_{\theta}\mathcal{L}}$",
    r"$\boldsymbol{\in}$",
    r"$\boldsymbol{\forall}$",
    r"$\boldsymbol{|\,\mathbb{Z}\,| < \aleph}$",
]

# ---------- 5. place text -----------------------------------------------------
for (cx, cy), label in zip(centroids, exprs):
    plt.text(cx, cy, label, ha="center", va="center", fontsize=30)

plt.savefig("v-bw.pdf")          # PDF/SVG keeps the vectors
plt.show()
