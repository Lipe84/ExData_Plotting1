# sourcing code to load data
source("./explo_project1.R")

# As descripted in the forum, it is usefull change language: in my case from italian to english
user_lang <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

# setting current Working Directory
setwd("./explo_project1/")

# opening graph device: as requested "Construct the plot 
# and save it to a PNG file with a width of 480 pixels and a height of 480 pixels."
png(filename = "./plot1.png", width=480, height=480, units='px', bg = "transparent")

# creating histogram plot1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# always close graph device!
dev.off()

# restore language
Sys.setlocale("LC_TIME", user_lang)

# reset standard working directory
setwd(wd)