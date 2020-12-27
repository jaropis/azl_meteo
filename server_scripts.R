#* @param hours if provided, certain numbers of hours is returned
#* @get /hourData
function(hours = 48) {
  hours <- as.numeric(hours)
  data <- readRDS('/home/jaropis/projects/azl_meteo/meteo.RDS')
  #pressure <- list(x = data$now, y = data$pressure)
  #jsonlite::toJSON(pressure)
  #jsonlite::write_json(pressure, "pressure.json")
  data <- data[(nrow(data) - hours):nrow(data), ]
  list(time = data$now,
       pressure = data$pressure,
       temperature = data$temperature,
       inside_humidity = data$inside_humidity,
       outside_humidity = data$outside_humidity,
       rain = data$rain)
}

#* @filter cors
cors <- function(res) {
    res$setHeader("Access-Control-Allow-Origin", "*")
    plumber::forward()
}
