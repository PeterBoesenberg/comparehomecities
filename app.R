library(data.table)
library(modules)


load <- modules::use("load.R")
chart <- modules::use("chart.R")

show <- function(dt) {
  fig <- plot_ly(dt, x =  dt[station==2014,datefrom], y = dt[station==2014,temperature], type = 'scatter', mode = 'lines', name="Hannover")
  fig <- fig %>% add_trace(y = dt[station==3379,temperature], name = 'München',mode = 'lines')
  fig
}

weather_munich <- load$load_weather_munich()
weather_hannover <- load$load_weather_hannover()

weather_munich <- weather_munich[,.(STATIONS_ID,MESS_DATUM_BEGINN,MESS_DATUM_ENDE,MO_TT )]
weather_hannover <- weather_hannover[,.(STATIONS_ID,MESS_DATUM_BEGINN,MESS_DATUM_ENDE,MO_TT )]

weather <- rbind(weather_hannover, weather_munich)
setnames(weather, c("station", "datefrom", "dateto", "temperature"))

weather[,datefrom:=as.Date(as.character(datefrom), "%Y%m%d")]
weather[,dateto:=as.Date(as.character(dateto), "%Y%m%d")]

# head(weather_munich)
# head(weather_hannover)

show(weather)