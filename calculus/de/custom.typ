#let mgrid(..args) = context {
  // Extract named parameters or use defaults
  let kwargs = args.named()
  let align = kwargs.at("align", default: center)
  let gutter = kwargs.at("gutter", default: 1em)
  
  // Get positional arguments (the body/eq content)
  let eq = if args.pos().len() > 0 { args.pos().first() } else { [] }
  
  if eq.func() != [].func() {
    // Body is just a single element, so leave it as is.
    return eq
  }

  // Split body at linebreaks and alignment points.
  let lines = eq.children.split(linebreak()).map(line => line.split($&$.body).map(array.join))

  // Calculate width of each column.
  let widths = ()
  for line in lines {
    for (i, part) in line.enumerate() {
      let width = measure(math.equation(block: true, numbering: none, part)).width
      if i >= widths.len() {
        widths.push(width)
      } else {
        widths.at(i) = calc.max(widths.at(i), width)
      }
    }
  }

  // Resolve alignment for each column.
  let aligns = range(widths.len()).map(i => {
    if type(align) == alignment { align }
    else if type(align) == array { align.at(calc.rem(i, align.len())) }
    else { panic("expected alignment or array as 'align'") }
  })

  // Try to flatten sequence elements (to allow access to an underlying align
  // element for overriding the alignment of single parts).
  let flatten(seq) = {
    if type(seq) != content or seq.func() != [].func() {
      return seq
    }
    let children = seq.children.filter(c => c != [ ])
    if children.len() == 1 { children.first() } else { seq }
  }

  // Display parts centered in each column and add gutter.
  let layout-line(line) = {
    if line.len() < widths.len() {
      line += (none,) * (widths.len() - line.len())
    }
    
    line.zip(widths, aligns).map(((part, width, align)) => {
      let part = flatten(part)
      let part-width = measure(math.equation(block: true, numbering: none, part)).width
      let delta = width - part-width

      // Check if alignment is overridden.
      if type(part) == content and part.func() == std.align {
        align = part.alignment.x
      }
      
      let (start, end) = if align == center {( h(delta/2), h(delta/2) )}
                         else if align == left {( none, h(delta) )}
                         else if align == right {( h(delta), none )}

      start + part + end
    }).join(h(gutter))
  }

  lines.map(layout-line).join(linebreak())
}

#let vapprox = box(baseline: 50%, rotate(90deg, $ approx $))
#let veq = box(baseline: 50%, rotate(90deg, $ = $))
