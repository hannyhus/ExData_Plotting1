# Getting and Cleaning Data
data <- read.table("./household_power_consumption.txt", header=T, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
newdata <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
newdata$Global_active_power <- as.numeric(as.character(newdata$Global_active_power))
newdata$Global_reactive_power <- as.numeric(as.character(newdata$Global_reactive_power))
newdata$Voltage <- as.numeric(as.character(newdata$Voltage))
newdata <- transform(newdata, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
newdata$Sub_metering_1 <- as.numeric(as.character(newdata$Sub_metering_1))
newdata$Sub_metering_2 <- as.numeric(as.character(newdata$Sub_metering_2))
newdaata$Sub_metering_3 <- as.numeric(as.character(newdata$Sub_metering_3))
#Plot 2
plot(newdata$timestamp,newdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png"width=480, height=480)
dev.off()
