% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lc.R
\name{listen}
\alias{listen}
\title{Listen to the server}
\usage{
listen(time = Inf, activeSessions = NULL, condition = NULL)
}
\arguments{
\item{time}{Time (in seconds), during which the R session should listen to the server. By default, the function runs until
it is not interrupted (\code{time = Inf}).}

\item{activeSessions}{The function runs, until there is at least one active session in the provided app. If there is only
one active app, this argument can be set to \code{TRUE} for the same effect.}

\item{condition}{Custom condition. This argument must be a function that returns \code{TRUE} or \code{FALSE}. R session will
listen to the server, while the condition function returns \code{TRUE}.}
}
\description{
When R session is not interactive, messages from the server are not processed automatically. In this case, one needs to
keep this function running.
This function, is a wrapper around \code{\link[jrc]{listen}}.
}
