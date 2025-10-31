# Gratsch

## Usage

```typ
#import "@preview/gratsch:0.0.1": config, prob

#show: config.with(
  course-name: "Course name",
  subtitle: "Assignment nr x",
  date-str: datetime( year: 2025, month: 10, day: 30).display(),
  author-info: [
    First name last name
  ],
  author-names: "First name last name",
  title-style: "simple",
  theme-name: "sketch",
  heading-numberings: ("1.", none, "(1)", "a."),
)

#set text(lang: "en")

#prob[
  Calculate the 25th number in the Fibonacci sequence using Typst
][
  #let f(n) = {
    if n <= 2 {
      return 1
    }
    return f(n - 1) + f(n - 2)
  }
  #f(25)
]
```
