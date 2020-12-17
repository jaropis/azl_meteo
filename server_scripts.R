#* @get /
prepare_weather <- function() {
  data <- readRDS('meteo.RDS')
  #pressure <- list(x = data$now, y = data$pressure)
  #jsonlite::toJSON(pressure)
  #jsonlite::write_json(pressure, "pressure.json")
  list(x = data$now, y = data$pressure)
}
