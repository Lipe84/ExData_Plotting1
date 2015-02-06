# sourcing code to load data
source("./explo_project1.R")

# As described in the forum, it is usefull change language: in my case from italian to english
user_lang <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

# setting current Working Directory
setwd("./explo_project1/")

# opening graph device: as requested "Construct the plot 
# and save it to a PNG file with a width of 480 pixels and a height of 480 pixels."
png(filename = "./plot3.png", width=480, height=480, units='px', bg = "transparent")

# creating histogram plot3 using "plot": "type = "l"" means line
# to create multiple plot on the same graph, use "lines"
colors <- c("black", "red", "blue")
plot(data$Date_Time, data$Sub_metering_1, type="l", col=colors[1], xlab="", ylab = "Energy sub metering")
lines(data$Date_Time, data$Sub_metering_2, col=colors[2])
lines(data$Date_Time, data$Sub_metering_3, col=colors[3])

# adding legend
legend("topright", col=colors, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

# always close graph device!
dev.off()

# restore language
Sys.setlocale("LC_TIME", user_lang)

# reset standard working directory
setwd(wd)