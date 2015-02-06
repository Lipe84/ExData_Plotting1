library(lubridate)

# check if new directory already exists and change Working Directory with it
path <- "./explo_project1"
if(!file.exists(path)){dir.create(path)}
setwd("./explo_project1")

# check if the .zip file is already present: if not, download and unzip it
if(!file.exists("./household_power_consumption.zip")){
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url, destfile = "./household_power_consumption.zip")
    unzip("./household_power_consumption.zip", exdir = "./household_power_consumption", overwrite = TRUE)
    }
   
# Original data have "factor" as variable, so I change
# the class of the 9 variables as follow: character, character, numeric,... , numeric
# so I create a vector with this classes using "rep" function (that repeat the object)
var_classes <- c(rep("character", 2), 
                 rep("numeric", 7))

# Load the data into variable: project say that missing value are reported as "?"
# values are separeted by semi-colon
data <- read.table("./household_power_consumption/household_power_consumption.txt",
                   sep = ";", 
                   header = TRUE, 
                   na.strings = "?",
                   colClasses = var_classes)

# Just 2 days are requested in this project: 1/2/2007 and 2/2/2007.
# "Date" and "Time" must be converted, using "lubridate" package.
# I create a new variable "Date_Time" that is Date + Time, usefull for creating the plots.
# "x" is a temporary var
data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
x <- paste(data$Date, data$Time)
data$Date_Time <- strptime(x, "%d/%m/%Y %H:%M:%S")

# reset standard working directory
setwd("C:/R")