if(!file.exists(".\\Data")){dir.create(".\\Data")}
fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = ".\\Data\\cameras.csv")
cameraData <- read.csv(".\\Data\\cameras.csv")
names(cameraData)

#tolower , toupper
tolower(names(cameraData))

#strsplit()
splitNames = strsplit(names(cameraData),"\\.")
splitNames[[5]]
splitNames[[6]]

#lists
mylist <- list(letters = c("A", "b", "c"), numbers = 1:3, matrix(1:25,ncol = 5))
head(mylist)

mylist[1]
mylist$letters
mylist[[1]]

#sapply()
splitNames[[6]][1]
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)


#peer review data
if(!file.exists(".\\Data")){dir.create(".\\Data")}
fileURL1 = "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/reviews.csv"
fileURL2 = "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/solutions.csv"
download.file(fileURL1,destfile = ".\\Data\\reviews.csv")
download.file(fileURL2,destfile = ".\\Data\\solutions.csv")
reviews <- read.csv(".\\Data\\reviews.csv")
solutions <- read.csv(".\\Data\\solutions.csv")
head(reviews,2)
head(solutions,2)

#fixing character vectors
names(reviews)

sub("_", "", names(reviews),)

testName <- "this_is_a_test"
sub("_", "", testName)
gsub("_", "", testName)

#finding values
grep("Alameda", cameraData$intersection)

table(grepl("Alameda",cameraData$intersection))

cameraData2 <- cameraData[!grepl("Alameda",cameraData$intersection),]

grep("Alameda", cameraData$intersection, value = TRUE)

grep("JeffStreet", cameraData$intersection)

length(grep("JeffStreet", cameraData$intersection))

library(stringr)
nchar("Jeffery Leek")

substr("Jeffery Leek", 1, 7)

paste("Jeffery","Leek")

paste0("Jeffery","Leek")

str_trim("Jeff       ")
