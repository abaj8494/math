#set heading(numbering:"1.")
#set text(
  font: "New Computer Modern",
  // the fact that this works is fucking awesome to me:
  // size: 30pt
  size: 12pt
)

= Heading

this is a heading 1, is the below a heading 2?

== Another Heading <labelled>

_underscores_ i guess. --> nope, italics!

emph ---

+ a 
  - subshit (nesting matters!) @Manna2021
+ list. *is it wild* ? @Nath2021 @Singh2022
  - sublist @labelled
+ of
+ stuff. I guess I can label things and reference them with @glaciers

== Heading IMAGE

#figure(
  image("glacier.jpg", width: 70%),
  caption: [
    _Glaciers_ nibbaaaa
  ],
) <glaciers>

= methods
#bibliography("works.bib")

= mathematics

$ a^2 + b^2 = c^2 $

$ J = integral_0^(t_1) 1/2 u_1 dif t $


= logo

#show "ArtosFlow": name => box[
  #box(image(
    "logo.svg",
    height: 0.7em,
  ))
  #name
]

one of the best things is just the way that I can write the code in fucking line

ArtosFlow becomes ArtosFlow
