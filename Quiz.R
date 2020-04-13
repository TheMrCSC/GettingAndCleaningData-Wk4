#Question 1
Q1url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(Q1url, ".\\Data\\acs.csv")
acs <- read.csv(".\\Data\\acs.csv")
strsplit(names(acs),"wgtp")[123]

#Question 2
Q2url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(Q2url, ".\\Data\\gdp.csv")
gdp <- read.csv(".\\Data\\gdp.csv")
gdp <- gdp[gdp$X != "", c(1, 2, 4, 5, 6)]
colnames(gdp) <- c("CountryCode", "Ranking", "Country", "GDP")
gdp$intgdp <- gsub(",", "", gdp$GDP)
mean(as.integer(as.character(gdp[gdp$Ranking != "", "intgdp"])), na.rm = TRUE)

#Question 3
colnames(gdp) <- c("CountryCode", "Ranking", "countryNames", "GDP")
grep("^United",gdp$countryNames)

#Quesion 4
Q4url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(Q4url1, ".\\Data\\gdp4-1.csv")
gdp <- read.csv(".\\Data\\gdp4-1.csv")
gdp <- gdp[gdp$X != "", c(1, 2, 4, 5, 6)]
colnames(gdp) <- c("CountryCode", "Ranking", "countryNames", "GDP")

Q4url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(Q4url2, ".\\Data\\edu.csv")
edu <- read.csv(".\\Data\\edu.csv")

comb <- merge(gdp, edu, by.x = "CountryCode", by.y = "CountryCode", all = FALSE)
nrow(comb[grepl("^Fiscal year end: June ",comb$Special.Notes),])

#Question 5
install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

sum(year(ymd(sampleTimes)) == "2012")
sum(wday(ymd(sampleTimes[year(ymd(sampleTimes)) == "2012"])) == "2")

