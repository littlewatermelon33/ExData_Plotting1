##Load the data
png("Plot_3.png", height=480,width=480)
data_set <- read.table(file ="household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
my_data <- subset(data_set, Date %in% c("1/2/2007","2/2/2007"))
my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y")
my_data <- cbind(my_data, "DateTime" = as.POSIXct(paste(my_data$Date,my_data$Time)))
##Plot the graph
with(my_data, plot(DateTime,Sub_metering_1, xlab="", ylab="Energy sub metering",col="black", type="l" ))
lines(my_data$DateTime, my_data$Sub_metering_2, col="red")
lines(my_data$DateTime, my_data$Sub_metering_3, col="blue")
##Add legend
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()

