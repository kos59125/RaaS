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
