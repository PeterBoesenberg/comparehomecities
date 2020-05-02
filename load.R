import(data.table)
export("load_weather_munich", "load_weather_hannover")

load_weather_munich <- function() {
  dt <- fread("data/weather/climate_munich.txt")
  dt
}
load_weather_hannover <- function() {
  dt <- fread("data/weather/climate_hannover.txt")
  dt
}