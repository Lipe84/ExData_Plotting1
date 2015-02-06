# sourcing code to load data
source("./explo_project1.R")

# As descripted in the forum, it is usefull change language: in my case from italian to english
user_lang <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

# setting current Working Directory
setwd("./explo_project1/")

# opening graph device: as requested "Construct the plot 
# and save it to a PNG file with a width of 480 pixels and a height of 480 pixels."
# setting 2*2 lattice to contain 4 graph with "mfrow": in this way, sequence is:
# top-left, top-right, bottom-left, bottom-right
png(filename = "./plot4.png", width=480, height=480, units='px', bg = "transparent")
par(mfrow=c(2,2))

# creating plot top-left
plot(data$Date_Time, data$Global_active_power, ylab="Global Active Power", xlab="", type="l")

# creating plot top-right
plot(data$Date_Time, data$Voltage, ylab="Voltage", xlab="datetime", type="l")

# creating plot bottom-left
colors <- c("black", "red", "blue")
plot(data$Date_Time, data$Sub_metering_1, type="l", col=colors[1], xlab="", ylab = "Energy sub metering")
lines(data$Date_Time, data$Sub_metering_2, col=colors[2])
lines(data$Date_Time, data$Sub_metering_3, col=colors[3])
legend("topright", bty = "n", col=colors, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

# creating plot bottom-right
plot(data$Date_Time, data$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")

# always close graph device!
dev.off()

# restore language
Sys.setlocale("LC_TIME", user_lang)

# reset standard working directory
setwd(wd)