install.packages("Rcpp")

ibm_url <- "http://real-chart.finance.yahoo.com/table.csv?s=IBM&a=07&b=24&c=2010&d=07&e=24&f=2015&g=d&ignore=.csv"
lnkd_url <- "http://real-chart.finance.yahoo.com/table.csv?s=LNKD&a=07&b=24&c=2010&d=07&e=24&f=2015&g=d&ignore=.csv"

yahoo.read <- function(url){
  dat <- read.table(url,header=TRUE,sep=",")
  return(dat)
}

data = yahoo.read(ibm_url)

adjclose = data[[7]]

vol <- sqrt(252) * sd(diff(log(adjclose))) * 100
print(vol)