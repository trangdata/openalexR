% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oa2bibliometrix.R
\name{oa2bibliometrix}
\alias{oa2bibliometrix}
\title{Convert OpenAlex collection from data frame to bibliometrix object}
\usage{
oa2bibliometrix(df)
}
\arguments{
\item{df}{is bibliographic collection of works donwloaded from OpenALex.}
}
\value{
a data.frame with class "bibliometrix".
}
\description{
It converts bibliographic collections gathered from OpenAlex database \href{https://openalex.org/}{https://openalex.org/} into a
bibliometrix data frame (\href{https://bibliometrix.org/}{https://bibliometrix.org/})
}
\examples{
\dontrun{

# Query to search all works citing the article:
#  Aria, M., & Cuccurullo, C. (2017). bibliometrix:
#   An R-tool for comprehensive science mapping analysis.
#   Journal of informetrics, 11(4), 959-975.

#  published in 2021.
#  The paper is associated to the OpenAlex id W2755950973.

#  Results have to be sorted by relevance score in a descending order.

query <- oaQueryBuild(
  identifier = NULL,
  entity = "works",
  filter = "cites:W2755950973",
  date_from = "2021-01-01",
  date_to = "2021-12-31",
  search = NULL,
  endpoint = "https://api.openalex.org/"
)

res <- oaApiRequest(
  query_url = query,
  total.count = FALSE,
  verbose = FALSE
)

df <- oa2df(res, entity = "works")

M <- oa2bibliometrix(df)
}

}
