#import "@local/gratsch:0.0.1": config, prob

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
  lang: "en",
  heading-numberings: ("1.", "1.a)", none, none),
)

#prob(title: "Warm-up")[
  First question
][
  Answer
]
