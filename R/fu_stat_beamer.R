fu_stat_beamer <- function(...) {
  template <- find_resource("fuStatBeamer", "template.tex")
  rmarkdown::beamer_presentation(
    template = template,
    fig_width = 6.5,
    fig_height = 5,
    ...
  )
}
