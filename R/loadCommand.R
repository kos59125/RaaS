#' Loads executable files in the specified directory
#' @param path
#'    a directory to search executable files
#' @export
loadCommand <- function(path, envir, inherits=FALSE) {   
   fileNames <- list.files(path, include.dirs=FALSE)
   files <- file.path(path, fileNames)
   available <- file.access(files, 1L) == 0L
   for (exec in fileNames[available]) {
      if (exists(exec, envir=envir)) {
         warning(sprintf("%s is masked by command %s", exec, file.path(path, exec)))
      }
      as.command(exec, character.only=TRUE, envir=envir)
   }
}
