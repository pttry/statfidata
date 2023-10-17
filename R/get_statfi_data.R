get_statfi_data <- function(url, query){

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
