library(cronR)
cmd <- cron_rscript("zg_meteo.R")
cron_add(command = cmd, frequency = 'hourly', 
         id = 'azl_meteo', description = 'azl_meteo', tags = c('lab', 'xyz'))