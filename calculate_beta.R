install.packages("quantmod")
install.packages("PortfolioAnalytics")
install.packages("PerformanceAnalytics")


library('quantmod')
library('PortfolioAnalytics')
library('PerformanceAnalytics')


start_date <- "2013-08-30"


stock  <- getSymbols("AMZN", from = start_date, auto.assign = FALSE)
index  <- getSymbols("NDAQ",  from = start_date, auto.assign = FALSE)

r <- function ( x ) {m<-to.monthly(x[,6])[,4];diff(m)/lag(m)}

coef(lm(r(stock)[2:37]~r(index)[2:37]))