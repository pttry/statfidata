#' Title
#'
#' @param table_code
#'
#' @return
#' @export
#'
#' @examples
get_labels <- function(table_code) {

  url <- table_code_to_url(table_code)
  m <- pxweb::pxweb_get(url)

  purrr::map(rlang::set_names(m$variables,
                              sapply(m$variables, "[[", "code")),
             ~rlang::set_names(.x$valueTexts, .x$values))

}
