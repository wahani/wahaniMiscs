pdf_memo <- function(..., fig_width = 6.5, fig_height = 3.5) {
  template <- find_resource("wMemo", "template.tex")
  rmarkdown::pdf_document(
    template = template,
    fig_width = fig_width,
    fig_height = fig_height,
    ...
  )
}
