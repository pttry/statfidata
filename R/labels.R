#' Title
#'
#' @param table_code
#'
#' @return
#' @export
#'
#' @examples
get_labels <- function(table_code, label = NULL) {

  url <- table_code_to_url(table_code)
  m <- pxweb::pxweb_get(url)

  out <- purrr::map(rlang::set_names(m$variables,
                              sapply(m$variables, "[[", "code")),
             ~rlang::set_names(.x$valueTexts, .x$values)) |>
    statfitools::clean_names()

  if(!is.null(label)) {
    label <- statfitools::make_names(label)
    out <- out[[label]]
  }
  out

}
