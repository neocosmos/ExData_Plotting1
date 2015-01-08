# read the data
library(data.table)
data <- fread("household_power_consumption.txt",na = "?")

# subset the data
data_sub <- subset(data, data$Date == "1/2/2007"| data$Date == "2/2/2007") 

#convert time
m_date <- as.Date(data_sub$Date, format = "%d/%m/%Y")

data_sub$datetime <- as.POSIXct(paste(m_date,data_sub$Time))

#file to save
png(filename = "plot4.png", width = 480, height = 480, units = "px")

#plot and draw the legend
with(data_sub,{
  plot(Sub_metering_1~datetime, ylab="Energy sub metering", xlab="", type="l")
               lines(Sub_metering_2~datetime, col ="Red")
               lines(Sub_metering_3~datetime, col ="Blue")
               legend("topright", col=c("black", "red", "blue"),lwd=1,
                      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
               })

dev.off()