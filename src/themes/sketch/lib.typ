#let logo_path = "./res/UniBZ-Logo.svg"
// #let logo_str = read(logo_path).replace("920f14", "cccccc")

#let whole-page-title(meta, logo) = {
  set page(margin: 0pt, header: none, footer: none)

  // Logo
  place(
    center + top,
    dx: 40%,
    dy: 10pt,
  )[
    #set image(width: 100%)
    #logo
  ]

  // Info panel
  place(
    bottom + left,
    dx: 0pt,
    dy: -20%,
    rect(fill: rgb("cccccc"), width: 100%, height: 10pt),
  )
  place(
    bottom + left,
    dx: 24pt,
    dy: -20%,
    text(
      meta.course-name,
      size: 36pt,
      font: ("Libertinus Serif"),
      baseline: -0.6em,
    ),
  )
  place(
    bottom + left,
    dx: 24pt,
    dy: -20%,
    box([
      #set text(
        size: 20pt,
        font: ("Libertinus Serif"),
        baseline: 1em,
      )
      #set align(horizon)
      #meta.author-info
    ]),
  )
}

#let simple-title(meta, logo) = {
  set align(horizon)
  stack(
    dir: ltr,
    spacing: 8pt,
    {
      set image(width: 30%)
      logo
    },
    context line(
      length: 20% * page.width,
      angle: 90deg,
      stroke: (
        thickness: 0.8pt,
        paint: gray.lighten(60%),
      ),
    ),
    {
      set align(left)
      block[
        #set text(font: (
          "New Computer Modern",
          "Libertinus Serif",
        ))

        #text(size: 28pt, weight: "bold")[
          #meta.course-name
        ]

        #text(size: 18pt)[
          #meta.subtitle
        ]

        #text(size: 12pt, font: "New Computer Modern")[
          #meta.author-info
        ]
      ]
    },
  )
}

#let header = meta => {
  set text(size: 10.5pt, font: "Libertinus Serif")
  block(
    grid(
      columns: (1fr, 1fr),
      align(left + horizon, meta.course-name), align(right + horizon, meta.date-str),
    ),
  )
  place(line(length: 100%, stroke: 0.5pt), dy: 0.5em)
}

#let footer = meta => {
  let cur = context counter(page).get().at(0)
  let tot = context counter(page).final().at(0)
  return align(center)[
    #set text(size: 10.5pt)
    #cur / #tot
  ]
}

#let theme(meta) = {
  let logo = if "logo" in meta {
    meta.logo
  } else {
    image(logo_path)
  }
  return (
    title: (
      whole-page: {
        whole-page-title(meta, logo)
        pagebreak(weak: true)
      },
      simple: {
        set align(left)
        block(simple-title(meta, logo))
      },
    ),
    page-setting: (
      header: header(meta),
      footer: footer(meta),
    ),
    fonts: (
      heading: (
        "New Computer Modern",
        "Libertinus Serif",
      ),
      text: (
        "New Computer Modern",
        "Libertinus Serif",
      ),
      equation: (
        "New Computer Modern Math",
        "Libertinus Serif",
      ),
    ),
  )
}