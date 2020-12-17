library(magrittr)
library(plumber)
pr("/root/azl_meteo/server_scripts.R") %>%
  pr_run(port=8000, host="0.0.0.0")