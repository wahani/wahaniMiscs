#' Add R/Latex Project structure for article/thesis
#'
#' Adds a couple of files/folders which are helpful for reproducible articles with RMarkdown/Latex/R
#'
#' @param dir character
#'
#' @details This structure expects \code{pandoc}, \code{make} and \code{latex} to be installed. In Windows should add those programs to your \code{PATH} variable plus \code{RScript}.
#'
#' @export
init_thesis <- function(dir = ".") {
  root <- Directory(dir)
  packageDir <- Directory(system.file(package = "wahaniMiscs"))

  root + packageDir/c("Makefile", "build.R", "highlighting.tex")
  lapply(c("R", "Rmd", "figs", "tex"), function(dirName) Directory(root/dirName))

  root
}
