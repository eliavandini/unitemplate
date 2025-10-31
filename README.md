# ichigo - 苺

Homework Template - 作业模板

## Usage - 使用方法

```typ
#import "@preview/ichigo:0.2.0": config, prob

#show: config.with(
  course-name: "Typst 使用小练习",
  subtitle: "第 1 次作业",
  date-str: "第 1 次作业",
  author-info: [
    sjfhsjfh from PKU-Typst
  ],
  author-names: "sjfhsjfh",
)

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