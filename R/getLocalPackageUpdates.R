#' Function to report differences in NEWS file between CRAN Verion and local version of a package.
#'
#' @param package as character
#' @export
getLocalPackageUpdates <- function(package) {
  ps <- summary(packageStatus())
  cranVersion <- ps$avail[rownames(ps$avail) == package, "Version"]
  localVersion <- ps$inst[rownames(ps$inst) == package, "Version"]
  cat("Version on CRAN:", cranVersion, "\n")
  cat("Development Version:", localVersion, "\n\n")
  cat("Updates in package NEWS-file since last release to CRAN:\n\n")
  print(do.call(news, list(query = quote(Version > cranVersion), package = package)))
  invisible(NULL)
}
