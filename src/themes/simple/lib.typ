#let theme(meta) = {
  return (
    title: (
      whole-page: [
        #v(40pt)
        #align(center)[
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

          #text(size: 12pt, font: "STFangsong")[
            #meta.author-info
          ]
        ]

        #pagebreak(weak: true)
      ],
      simple: [
        #v(10pt)
        #align(center)[
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

          #text(size: 12pt, font: "STFangsong")[
            #meta.author-info
          ]
        ]
      ],
    ),
    page-setting: (
      header: [],
      footer: {
        let cur = context counter(page).get().at(0)
        let tot = context counter(page).final().at(0)
        align(center)[
          #cur / #tot
        ]
      },
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