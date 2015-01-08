# read the data
library(data.table)
data <- fread("household_power_consumption.txt",na = "?")

# subset the data
data_sub <- subset(data, data$Date == "1/2/2007"| data$Date == "2/2/2007") 

#plot
hist(as.numeric(data_sub$Global_active_power), main="Global Active Power", 
             xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#save the file
dev.copy(png, "plot1.png", height=480, width=480, units = "px")
dev.off()