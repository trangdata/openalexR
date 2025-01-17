#' Convert OpenAlex collection from list to data frame
#'
#' It converts bibliographic collections gathered from OpenAlex database \href{https://openalex.org/}{https://openalex.org/} into data frame.
#' The function converts a collection of records about works, authors, institutions, venues or concepts obtained using \code{oaApiRequest} into a data frame/tibble.
#'
#' @param data is a list. data is the output of the function \code{oaApiRequest}.
#' @param entity is a character. It indicates the scholarly entity of the search. The argument can be equal to
#' entity = c("works", "authors", "venues", "institutions", "concepts"). The default value is entity = works".
#' @param verbose is a logical. If TRUE, information about the querying process will be plotted on screen. Default is \code{verbose=TRUE}.
#' @return a data.frame.
#'
#' For more extensive information about OpenAlex API, please visit: \href{https://docs.openalex.org/api}{https://docs.openalex.org/api}
#'
#'
#' @examples
#' \dontrun{
#'
#' # Query to search all works citing the article:
#' #  Aria, M., & Cuccurullo, C. (2017). bibliometrix:
#' #   An R-tool for comprehensive science mapping analysis.
#' #   Journal of informetrics, 11(4), 959-975.
#'
#' #  published in 2021.
#' #  The paper is associated to the OpenAlex id W2755950973.
#'
#' #  Results have to be sorted by relevance score in a descending order.
#'
#' query <- oaQueryBuild(
#'   identifier = NULL,
#'   entity = "works",
#'   filter = "cites:W2755950973",
#'   date_from = "2021-01-01",
#'   date_to = "2021-12-31",
#'   search = NULL,
#'   endpoint = "https://api.openalex.org/"
#' )
#'
#' res <- oaApiRequest(
#'   query_url = query,
#'   total.count = FALSE,
#'   verbose = FALSE
#' )
#'
#' df <- oa2df(res, entity = "works")
#'
#' df
#' }
#'
#' @export
oa2df <- function(data, entity = c("works", "authors", "venues", "institutions", "concepts"), verbose = TRUE) {
  entity <- match.arg(entity)

  switch(entity,
    works = oaWorks2df(data, verbose),
    authors = oaAuthors2df(data, verbose),
    institutions = oaInstitutions2df(data, verbose),
    venues = oaVenues2df(data, verbose),
    concepts = oaConcepts2df(data, verbose)
  )
}
