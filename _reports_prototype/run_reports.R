# script source: https://rfortherestofus.com/2024/06/parameterized-reporting-quarto

library(quarto)
library(tidyverse)

inst <- c("Duke University",
          "Furman University",
          "University of Michigan-Ann Arbor",
          "University of North Carolina at Chapel Hill")
year <- c(2023)

reports <-
  tibble(
    input = "report_template.qmd",
    output_file = str_glue("{inst} {year} annual sports equity report.pdf"),
    execute_params = map2(inst, year, ~ list(inst = .x, year = .y))
  )

pwalk(reports, quarto_render)