pdf_memo <- function() {
  template <- find_resource("wMemo", "template.tex")
  rmarkdown::pdf_document(
    template = template,
    keep_tex = FALSE,
    fig_width = 6.5,
    fig_height = 3.5
  )
}
