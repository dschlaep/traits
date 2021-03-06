% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/betydb.R
\name{betydb}
\alias{betydb}
\alias{betydb_citation}
\alias{betydb_search}
\alias{betydb_site}
\alias{betydb_specie}
\alias{betydb_trait}
\title{Search for traits from BETYdb}
\usage{
betydb_search(query = "Maple SLA", betyurl = "https://www.betydb.org/",
  fmt = "json", key = NULL, user = NULL, pwd = NULL, ...)

betydb_trait(id, genus = NULL, species = NULL,
  betyurl = "https://www.betydb.org/", fmt = "json", key = NULL,
  user = NULL, pwd = NULL, ...)

betydb_specie(id, genus = NULL, species = NULL,
  betyurl = "https://www.betydb.org/", fmt = "json", key = NULL,
  user = NULL, pwd = NULL, ...)

betydb_citation(id, genus = NULL, species = NULL,
  betyurl = "https://www.betydb.org/", fmt = "json", key = NULL,
  user = NULL, pwd = NULL, ...)

betydb_site(id, betyurl = "https://www.betydb.org/", fmt = "json",
  key = NULL, user = NULL, pwd = NULL, ...)
}
\arguments{
\item{query}{Query terms}

\item{betyurl}{(string) url to target instance of betydb. Default is betydb.org}

\item{fmt}{(character) Format to return data in, one of json, xml, csv. Only json
currently supported.}

\item{key}{(character) An API key. Use this or user/pwd combo. Save in your
\code{.Rprofile} file as \code{betydb_key}. Optional}

\item{user, pwd}{(character) A user name and password. Use a user/pwd combo or an API key.
Save in your \code{.Rprofile} file as \code{betydb_user} and \code{betydb_pwd}. Optional}

\item{...}{Curl options passed on to \code{\link[httr]{GET}}. Optional}

\item{id}{(integer) One or more ids for a species, site, variable, etc.}

\item{genus}{(character) A genus name. Optional}

\item{species}{(character) A specific epithet. Optional}
}
\description{
Search for traits from BETYdb
}
\details{
Details:
BETYdb includes a primary home page (betydb.org) focused on bioenergy crops as well as a network of harmonized
databases that support and share data among more focused research programs.

For a list of publicly accessible instances of BETYdb and the urls that can be queried,
see \url{https://pecan.gitbooks.io/betydb-documentation/content/distributed_betydb.html}

This package queries plant traits, phenotypes, biomass yields, and ecosystem functions.
It does not currently interface with the workflow and provenance data that support PEcAn Project (pecanproject.org) and TERRA REF (terraref.org) software.
}
\section{Authentication}{

Defers to use API key first since it's simpler, but if you don't have
an API key, you can supply a username and password.
}

\section{Functions}{

Singular functions like \code{betydb_trait} accept an id and additional parameters,
and return a list of variable outputs depending on the inputs.

However, plural functions like \code{betydb_traits} accept query parameters, but not
ids, and always return a single data.frame.
}
\examples{
\dontrun{
# General Search
out <- betydb_search(query = "Switchgrass Yield")
library("dplyr")
out \%>\%
 group_by(id) \%>\%
 summarise(mean_result = mean(as.numeric(mean), na.rm = TRUE)) \%>\%
 arrange(desc(mean_result))
# Get by ID
## Traits
betydb_trait(id = 10)
## Species
betydb_specie(id = 1)
## Citations
betydb_citation(id = 1)
## Site information
betydb_site(id = 795)
}
}
\references{
API documentation \url{https://pecan.gitbooks.io/betydb-data-access/content/API.html}
}

