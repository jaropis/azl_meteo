library(magrittr)
library(plumber)
pr("/home/jaropis/projects/azl_meteo/server_scripts.R") %>%
  pr_run(port=8000, host="0.0.0.0")