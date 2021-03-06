% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/command.R
\name{[.command}
\alias{[.command}
\title{Use a command with commandline parameters.}
\usage{
\method{[}{command}(cmd, ..., as.character = FALSE, input = NULL)
}
\arguments{
\item{cmd}{a command object}

\item{...}{commandline parameters.
Quote by backticks if a parameter contains such a character
that is handled specially by R (e.g. white-space)}

\item{as.character}{set \code{TRUE} if the parameters are given as character vectors}

\item{input}{input of command}
}
\value{
result of the command
}
\description{
Use a command with commandline parameters.
}

