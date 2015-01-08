# read the data
library(data.table)
data <- fread("household_power_consumption.txt",na = "?")

# subset the data
data_sub <- subset(data, data$Date == "1/2/2007"| data$Date == "2/2/2007") 

#convert time
m_date <- as.Date(data_sub$Date, format = "%d/%m/%Y")

data_sub$datetime <- as.POSIXct(paste(m_date,data_sub$Time))

#plot
plot(as.numeric(data_sub$Global_active_power)~data_sub$datetime, 
             ylab="Global Active Power (kilowatts)", xlab="", type="l")

#save the file
dev.copy(png, "plot2.png", height=480, width=48, units = "px")
dev.off()