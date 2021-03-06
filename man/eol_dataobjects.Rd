% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eol_dataobjects.R
\name{eol_dataobjects}
\alias{eol_dataobjects}
\title{Given the identifier for a data object, return all metadata about the object}
\usage{
eol_dataobjects(id, taxonomy = TRUE, usekey = TRUE, key = NULL,
  verbose = TRUE, ...)
}
\arguments{
\item{id}{(character) The EOL data object identifier}

\item{taxonomy}{(logical) Whether to return any taxonomy details from different
taxon hierarchy providers, in an array named \code{taxonconcepts}}

\item{usekey}{(logical) use your API key or not (\code{TRUE} or \code{FALSE})}

\item{key}{(character) Your EOL API key; can load from .Rprofile if not passed as a parameter}

\item{verbose}{(logical); If TRUE the actual taxon queried is printed on the
console.}

\item{...}{Curl options passed on to \code{\link[httr]{GET}}}
}
\value{
A list, optionally with a data.frame if \code{taxonomy=TRUE}
}
\description{
Given the identifier for a data object, return all metadata about the object
}
\details{
It's possible to return JSON or XML with the EOL API. However,
		this function only returns JSON for now.
}
\examples{
\dontrun{
eol_dataobjects(id = "d72801627bf4adf1a38d9c5f10cc767f")
eol_dataobjects(id = "21929584")

# curl options
library("httr")
eol_dataobjects(id = "21929584", config = verbose())
}
}
