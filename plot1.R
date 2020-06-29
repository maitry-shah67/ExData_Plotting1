#reading the dataset
plot1 = read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE,dec = ".")
#converting dates to date class
plot1 = subset(plot1,Date == "1/2/2007" | Date == "2/2/2007")

#converting the column to numeric class for plotting
global_active_power = as.numeric(plot1$Global_active_power)

#opening png file device for plotting
png("plot1.png",width = 480,height = 480)

#histogram
hist(global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (killowatts)")

#closing the file device
dev.off()