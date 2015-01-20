#' Use a command with commandline parameters.
#' @param cmd
#'    a command object
#' @param ...
#'    commandline parameters.
#'    Quote by backticks if a parameter contains such a character
#'    that is handled specially by R (e.g. white-space)
#' @param as.character
#'    set \code{TRUE} if the parameters are given as character vectors
#' @param input
#'    input of command
#' @return
#'    result of the command
#' @export
`[.command` <- function(cmd, ..., as.character=FALSE, input=NULL) {
   if (as.character) {
      args <- list(...)
   } else {
      args <- sapply(substitute(list(...))[-1L], deparse, backtick=FALSE)
   }
   args <- sapply(args, shQuote)
   cmd <- paste(c(cmd, args), collapse=" ")
   result <- system(cmd, input=input)
   class(result) <- "dev.null"
   result
}

#' Makes input as a commandline command.
#' @param cmd
#'    a command symbol, or a command string with \code{character.only = TRUE}
#' @param character.only
#'    assumes that \code{cmd} is given as a string
#' @param envir
#'    an environment that a command object to be assigned
#' @export
as.command <- function(cmd, character.only=FALSE, envir=as.environment(-1)) {
   if (!character.only) {
      cmd <- deparse(substitute(cmd))
   }

   # forces evaluation
   # `force` function is not available
   # because the environment will be evaluated in the function
   envir <- envir
   
   class(cmd) <- "command"
   assign(cmd, cmd, envir=envir)
}
