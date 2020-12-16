library(rvest)
azl_meteo <- xml2::read_html("https://azl.pl/meteo/")

pressure <- azl_meteo %>% 
  rvest::html_node(".barometer .labelTop .value") %>% 
  rvest::html_text() %>% 
  as.numeric()

temperature <- azl_meteo %>% 
  rvest::html_node(".temperature .labelTop .value") %>% 
  rvest::html_text() %>% 
  as.numeric()

table_values <- azl_meteo %>% 
  rvest::html_nodes("td") %>% 
  html_text()

inside_humidity <- table_values[which(table_values  %in% "inside Humidity") + 1] %>% 
  as.numeric()

outside_humidity <- table_values[which(table_values  %in% "outside Humidity") + 1] %>% 
  as.numeric()

rain <- table_values[which(table_values  %in% "storm Rain") + 1] %>% 
  as.numeric()

now <- Sys.time()

meteo <- readRDS("/root/azl_meteo/meteo.RDS")
current_meteo <- data.frame(now, 
                            pressure, 
                            temperature, 
                            inside_humidity, 
                            outside_humidity, 
                            rain)
meteo <- rbind(meteo, current_meteo)
saveRDS(meteo, file = "/root/azl_meteo/meteo.RDS")