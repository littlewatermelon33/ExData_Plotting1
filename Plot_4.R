png("Plot_4.png", height=480,width=480)
##Load the data
data_set <- read.table(file ="household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
my_data <- subset(data_set, Date %in% c("1/2/2007","2/2/2007"))
my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y")
my_data <- cbind(my_data, "DateTime" = as.POSIXct(paste(my_data$Date,my_data$Time)))
## Set the format
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
##Plot the graph
plot(my_data$Global_active_power~my_data$DateTime,xlab="", type="l")
plot(my_data$DateTime, my_data$Voltage, xlab="Datetime", type="l")
with(my_data, plot(DateTime,Sub_metering_1, xlab="", ylab="Energy sub metering",col="black", type="l" ))
lines(my_data$DateTime, my_data$Sub_metering_2, col="red")
lines(my_data$DateTime, my_data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
with(my_data$DateTime)
plot(my_data$DateTime, my_data$Global_reactive_power, xlab="Datetime", type="l")
dev.off()
