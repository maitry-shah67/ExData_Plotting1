#reading the dataset
plot3 = read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE,dec = ".")

#subsetting the dataset for the required dates
plot3 = subset(plot3,Date == "1/2/2007" | Date == "2/2/2007")
#converting dates to date class
datetime = as.POSIXct(paste(plot3$Date,plot3$Time,sep = " "),"%d/%m/%Y %H:%M:%S",tz = "India")

#converting the columns to numeric class for plotting
sub_metering_1 = as.numeric(plot3$Sub_metering_1)
sub_metering_2 = as.numeric(plot3$Sub_metering_2)
sub_metering_3 = as.numeric(plot3$Sub_metering_3)

##opening png file device for plotting
png("plot3.png",width = 480,height = 480)

#plot
plot(datetime,sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(datetime,sub_metering_2,type = "l",col = "red")
lines(datetime,sub_metering_3,type = "l",col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1,lwd = 1)

#closing the file device
dev.off()