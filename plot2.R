# sourcing code to load data
source("./explo_project1.R")

# As described in the forum, it is usefull change language: in my case from italian to english
user_lang <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

# setting current Working Directory
setwd("./explo_project1/")

# opening graph device: as requested "Construct the plot 
# and save it to a PNG file with a width of 480 pixels and a height of 480 pixels."
png(filename = "./plot2.png", width=480, height=480, units='px', bg = "transparent")

# creating histogram plot2 using "plot": "type = "l"" means line
plot(data$Date_Time, data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")

# always close graph device!
dev.off()

# restore language
Sys.setlocale("LC_TIME", user_lang)

# reset standard working directory
setwd(wd)