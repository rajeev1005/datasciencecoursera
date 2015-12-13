#reading the file to file name mydata
mydata<- "./household_power_consumption.txt"

#reading/converting the file into readable format
data <- read.table(mydata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#reading only the required observations in variable "gapdate"
gapdate <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Taking out the date/time for using it in the plot x axis
myday<- strptime(paste(gapdate$Date, gapdate$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap<-as.numeric(gapdate$Global_active_power)
grp<-as.numeric(gapdate$Global_reactive_power)
volt<-as.numeric(gapdate$Voltage)
subMetering1<- as.numeric(subSetData$Sub_metering_1)
subMetering2<- as.numeric(subSetData$Sub_metering_2)
subMetering3<- as.numeric(subSetData$Sub_metering_3)

#plotting png
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(myday, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(myday, volt, type="l", xlab="DateTime", ylab="Voltage")
plot(myday, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(myday, subMetering2, type="l", col="red")
lines(myday, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.0, col=c("black", "red", "blue"), bty="o")
plot(myday, grp, type="l", xlab="datetime", ylab="Global Reactive Power")
dev.off()
#closing png
