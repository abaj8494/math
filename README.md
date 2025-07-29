# I have snapped

Years of mathematical study, only to forget the ansatz for a non-homogenous second order Differential Equation.

What's the point?

# Typst

Anyways, TeX has outlived it's [welcome](https://github.com/abaj8494/LaTeX) and I am going to try produce my math notes with [Typst](https://typst.app/)

Herein, lies its beauty:

![Pascal](./tutorial/pascal.svg)

Compiled with the code
```typst
#set page(
  width: auto,
  height: auto
)

#let pascal_triangle(n, width:28pt, height:16pt) = {
  set text(weight: "bold")
  let row = ()
  let rows = ()
  for r in range(0, n+1) {
    // step the row
    for i in range(row.len() - 1, 0, step: -1) {
      row.at(i) = row.at(i) + row.at(i - 1)
    }
    row.push(1)
    // save the row
    rows.push(
      grid(
        columns: row.len() * (width,),
        rows: height,
        align: center + horizon,
        stroke : 0.2pt,
        ..row.map(str)
      )
    )
  }
  grid(align: center, ..rows)
}
// this is exactly what you want to be writing!
#pascal_triangle(8)
```

# Topics for Notes

- [ ] Logic
  - [ ] Set Theory
- [ ] Graph Theory
- [ ] Number Theory
- [ ] Combinatorics
- [ ] Calculus
  - [ ] Single Variable
  - [ ] Multivariable
  - [X] Differential Equations
- [ ] Linear Algebra
- [X] Optimisation
- [ ] Probability
- [ ] Real Analysis
- [ ] Complex Analysis
- [ ] Measure Theory
- [ ] Time Series
- [ ] Bayesian Inference


# other goodies

this repo contains other mathematical adventures of mine; 
- the \(e=\sum_{n=0}^\infty \tfrac1{n!}\) business card
- `r` code
- `tikz` drawings
- tattoos
- etc.

# tip

https://qwinsi.github.io/tex2typst-webapp/
