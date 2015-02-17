#' Class for working with directories
#'
#' @usage
#' instance <- Directory(name)
#' instance$getDirName()
#' instance$remove(...)
#'
#' @param ... arguments passed to init
#' @param name character of directory
#' @param object instance of Directory
#' @param e1 lhs
#' @param e2 rhs
#'
#' @aliases $,instance,init $,instance,remove

#'
#' @rdname Directory
#' @export
Directory <- defineClass("Directory", {

  dirName <- getwd()

  init <- function(name) {
    if(!missing(name)) {
      if(!file.exists(name)) {
        message("Creating new directory '", name, "' ...")
        dir.create(name)
      }
      self$dirName <- name
    }
  }

  getDirName <- public(function() dirName)

  remove <- public(function(...) {
    filesInDir <- list.files(path = dirName, ...)
    if(length(filesInDir)) self - filesInDir else message("No files in directory!")
    invisible(self)
  })

})

#' @export
#' @rdname Directory
setMethod("show", "Directory",
          function(object) {
            print(file.info(dir(object$getDirName(), full.names = TRUE))[c("size", "mtime")])
          })

#' @export
#' @rdname Directory
setMethod("/", c(e1 = "Directory", e2 = "character"),
          function(e1, e2) paste(e1$getDirName(), "/", e2, sep = ""))

#' @export
#' @rdname Directory
setMethod("-", c(e1 = "Directory", e2 = "character"),
          function(e1, e2) {
            file.remove(e1/e2)
            e1
          })

#' @export
#' @rdname Directory
setMethod("+", c(e1 = "Directory", e2 = "character"),
          function(e1, e2) {
            file.copy(e2, e1$getDirName())
            e1
          })

#' @export
#' @rdname Directory
setMethod("+", c(e1 = "character", e2 = "Directory"),
          function(e1, e2) {
            e2 + e1
            e2
          })

#' @export
#' @rdname Directory
setMethod("+", c(e1 = "Directory", e2 = "Directory"),
          function(e1, e2) {
            file.copy(e2$getDirName(), e1$getDirName(), recursive = TRUE)
            e1
          })
