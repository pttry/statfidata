#' Title
#'
#' @param table_code
#'
#' @return
#' @export
#'
#' @examples
table_code_to_url <- function(table_code) {

  statfi_parse_url(taulut$table_location[taulut$table_code == table_code])

}


