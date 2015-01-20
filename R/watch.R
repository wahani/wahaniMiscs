#' @export
watch <- function(path = ".", nodosfilewarning = TRUE) {

  if(nodosfilewarning) Sys.setenv(CYGWIN="nodosfilewarning")
  path <- normalizePath(path, winslash = "/")

  while(TRUE) {

    makeCall <- suppressWarnings(
      system2(command = "make", args = c(paste0("--directory='", path, "'"), "-q"))
      )

    if(makeCall) {
      system2(command = "make", args = c(paste0("--directory='", path, "'")))
    } else {
      Sys.sleep(time = 3)
    }

  }
}
