#reading the dataset
plot4 = read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE,dec = ".")

#subsetting the dataset for the required dates
plot4 = subset(plot4,Date == "1/2/2007" | Date == "2/2/2007")
#converting dates to date class
datetime = as.POSIXct(paste(plot4$Date,plot4$Time,sep = " "),"%d/%m/%Y %H:%M:%S",tz = "India")

#converting the columns to numeric class for plotting
global_active_power = as.numeric(plot4$Global_active_power)
sub_metering_1 = as.numeric(plot4$Sub_metering_1)
sub_metering_2 = as.numeric(plot4$Sub_metering_2)
sub_metering_3 = as.numeric(plot4$Sub_metering_3)
Voltage = as.numeric(plot4$Voltage)
global_reactive_power = as.numeric(plot4$Global_reactive_power)

#opening png file device for plotting
png("plot4.png",width = 480,height = 480)

#changing format for multiple plots
par(mfrow = c(2,2))

#plot1
plot(datetime,global_active_power,type = "l",xlab = "",ylab = "Global Active Power")

#plot2
plot(datetime,Voltage,type = "l",xlab = "datetime",ylab = "Voltage")

#plot3
plot(datetime,sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(datetime,sub_metering_2,type = "l",col = "red")
lines(datetime,sub_metering_3,type = "l",col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1,lwd = 1)

#plot4
plot(datetime,global_reactive_power,type = "l",xlab = "datetime",ylab = "Global rective power")

#closing the file device
dev.off()