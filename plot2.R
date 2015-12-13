#reading the file to file name mydata
mydata<- "./household_power_consumption.txt"

#reading/converting the file into readable format
data <- read.table(mydata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#reading only the required observations in variable "gapdate"
gapdate <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Taking out the date/time for using it in the plot
myday<- strptime(paste(gapdate$Date, gapdate$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap<-as.numeric(gapdate$Global_active_power)

#plotting png
png("plot2.png", width=480, height=480)
plot(myday, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
#closing png
