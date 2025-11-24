#' Title
#'
#' @param url
#'
#' @return
#' @export
#'
#' @examples
get_full_query <- function(url) {

  url <- statfi_parse_url(url)
  meta <- pxweb::pxweb_get(url)
  codes <- sapply(meta$variables, "[[", "code")
  query_list <- as.list(rep("*", times = length(codes)))
  names(query_list) <- codes

  pxq <- pxweb::pxweb_query(query_list)

  full_query <- pxweb:::pxweb_add_metadata_to_query(pxq, meta)

  pxweb:::pxweb_query_as_rcode(full_query)
}
