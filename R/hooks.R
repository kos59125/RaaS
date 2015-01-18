#' @export
.onLoad <- function(libname, pkgname) {
   path <- Sys.getenv("PATH")
   path <- unlist(strsplit(path, .Platform$path.sep))
   for (dir in rev(path)) {
      # loadCommand(dir, asNamespace(pkgname))
      loadCommand(dir, .GlobalEnv)
   }
}
