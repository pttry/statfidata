#' Import pxweb data as data.frame
#'
#' @param url
#' @param query
#'
#' @return
#' @export
#'
#' @examples
get_statfi_data.default <- function(url, query){

  px_data <- pxweb::pxweb_get(url = url, query = query)
  as.data.frame(px_data,
                        column.name.type = "code",
                        variable.value.type = "code") |>
    statfitools::clean_times2() |>
    dplyr::select(-all_of(names(query)[query == "SSS"])) |>
    tidyr::pivot_longer(where(is.numeric)) |>
    dplyr::rename(tiedot = name) |>
    statfitools::clean_names()
}


# get_statfi_data.data.frame(df, save = NULL, ...) {
#
#   data_list <- list()
#
#   for(i in 1:dim(df)[1]) {
#
#     url <- statfidata::statfi_parse_url(df$table_location[i])
#     query <- df$query[i][[1]]
#     data <- statfidata::get_statfi_data(url = url, query = query)
#
#     data_name <- statfidata::get_table_code(url)
#
#     if(is.null(save)) {
#       data_list[[i]] <- data
#       names(data_list)[i] <- data_name
#      } else {
#       assign(data_name, data)
#       do.call(save, list(as.name(data_name), ...))
#     }
#   }
#
# }
