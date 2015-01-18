#' Invokes a command object as an OS command.
#' @param cmd
#'    a command object
#' @return
#'    result of the command
#' @export
print.command <- system

#' Prints nothing.
#' This function is used for a comman that takes parameters
#' @export
print.dev.null <- function(...) {}

#' Use a command with commandline parameters.
#' @param cmd
#'    a command object
#' @param ...
#'    commandline parameters
#' @param input
#'    input of command
#' @return
#'    result of the command
#' @export
`[.command` <- function(cmd, ..., input=NULL) {
   args <- sapply(list(...), shQuote)
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
