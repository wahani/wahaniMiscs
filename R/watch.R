#' Continously run make
#'
#' @param path character
#' @param nodosfilewarning logical
#'
#' @rdname makeAndFriends
#'
#' @export
watch <- function(path = ".", nodosfilewarning = TRUE) {

  if(nodosfilewarning) setNDFW()
  callMake <- Curry(make, path = path)

  while(TRUE) {

    if(callMake("-q")) {
      callMake()
    } else {
      Sys.sleep(time = 3)
    }

  }
}

#' Run make in a folder
#'
#' @param ... characters passed as arguments in \code{\link{system2}}
#'
#' @rdname makeAndFriends
#'
#' @export
make <- function(..., path = ".") {
  path <- normalizePath(as.character(path), winslash = "/")
  system2(
    command = "make",
    args = c(paste0("--directory='", path, "'"), ...)
    )
}

setNDFW <- function() {
  Sys.setenv(CYGWIN="nodosfilewarning")
}

#' @export
#' @rdname makeAndFriends
setPathVariable <- function(...) {
  args <- lapply(..., normalizePath)
  currentPath <- Sys.getenv("PATH")
  newPath <- do.call(paste, c(list(currentPath), args, sep = ";"))
  Sys.setenv(PATH = newPath)
}


#' @export
#' @rdname makeAndFriends
getPandocPath <- function() {
  dirname(rmarkdown:::pandoc())
}
