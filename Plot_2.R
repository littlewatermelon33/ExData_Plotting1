##Load the data
png("Plot_2.png", height=480,width=480)
data_set <- read.table(file ="household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
my_data <- subset(data_set, Date %in% c("1/2/2007","2/2/2007"))
##Change the class of Date
my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y")
my_data <- cbind(my_data, "DateTime" = as.POSIXct(paste(my_data$Date,my_data$Time)))
## Plot the graph
plot(my_data$Global_active_power~my_data$DateTime,type="l")
dev.off()

