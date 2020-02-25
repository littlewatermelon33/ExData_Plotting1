##Load the data
png("Plot_1.png", height=480,width=480)
data_set <- read.table(file ="household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
my_data <- subset(data_set, Date %in% c("1/2/2007","2/2/2007"))
##Plot the graph 
hist(as.numeric(my_data$Global_active_power), col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency" )
dev.off()