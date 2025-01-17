% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oaConcepts2df.R
\name{oaConcepts2df}
\alias{oaConcepts2df}
\title{Convert OpenAlex collection of concepts' records from list format to data frame}
\usage{
oaConcepts2df(data, verbose = TRUE)
}
\arguments{
\item{data}{is a list. data is the output of the function \code{oaApiRequest}.}

\item{verbose}{is a logical. If TRUE, information about the querying process will be plotted on screen. Default is \code{verbose=TRUE}.}
}
\value{
a data.frame.

For more extensive information about OpenAlex API, please visit: \href{https://docs.openalex.org/api}{https://docs.openalex.org/api}
}
\description{
It converts bibliographic collection of concepts' records gathered from OpenAlex database \href{https://openalex.org/}{https://openalex.org/} into data frame.
The function converts a list of concepts' records obtained using \code{oaApiRequest} into a data frame/tibble.
}
\examples{
\dontrun{

# Query to search information about all Italian educational institutions


query_inst <- oaQueryBuild(
  entity = "institutions",
  filter = "country_code:it,type:education"
)

res <- oaApiRequest(
  query_url = query_inst,
  total.count = FALSE,
  verbose = FALSE
)

df <- oa2df(res, entity = "concepts")

df
}

# @export
}
