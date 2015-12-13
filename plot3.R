#reading the file to file name mydata
mydata<- "./household_power_consumption.txt"

#reading/converting the file into readable format
data <- read.table(mydata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#reading only the required observations in variable "gapdate"
gapdate <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Taking out the date/time for using it in the plot x axis
myday<- strptime(paste(gapdate$Date, gapdate$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap<-as.numeric(gapdate$Global_active_power)

#Taking out data for y axis
subMetering1<-as.numeric(gapdate$Sub_metering_1)
subMetering2<-as.numeric(gapdate$Sub_metering_2)
subMetering3<-as.numeric(gapdate$Sub_metering_3)

#plotting png
png("plot3.png", width=480, height=480)
plot(myday, subMetering1, type="l", ylab="Energy Submetering", xlab="") #plotting the black line for submeter 1
lines(myday, subMetering2, type="l", col="red")  #plotting the red lines for submeter 2
lines(myday, subMetering3, type="l", col="blue")  #plotting the blue lines for submeter 3

#creating the label box at top-right corner
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
#closing png

