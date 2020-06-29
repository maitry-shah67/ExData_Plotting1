#reading the dataset
plot2 = read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE,dec = ".")

#subsetting the dataset for the required dates
plot2 = subset(plot2,Date == "1/2/2007" | Date == "2/2/2007")
#converting dates to date class
datetime = as.POSIXct(paste(plot2$Date,plot2$Time,sep = " "),"%d/%m/%Y %H:%M:%S",tz = "India")

#converting the column to numeric class for plotting
global_active_power = as.numeric(plot2$Global_active_power)

#opening png file device for plotting
png("plot2.png",width = 480,height = 480)

#plot
plot(datetime,global_active_power,type = "l",xlab = "",ylab = "Global Active Power (killowatts)",)

#closing the file device
dev.off()