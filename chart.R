import(plotly)

export("show")

show <- function(dt) {
  fig <- plot_ly(dt, x = ~MESS_DATUM_BEGINN, y = ~MO_TT, type = 'scatter', mode = 'lines')
  fig <- fig %>% add_trace(y = ~trace_0, name = 'trace 0',mode = 'lines') 
  fig <- fig %>% add_trace(y = ~trace_0, name = 'trace 0',mode = 'lines') 
  fig
}