#reading the file to file name mydata
mydata<- "./household_power_consumption.txt"

#reading/converting the file into readable format
data <- read.table(mydata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#reading only the required observations in variable "gapdate"
gapdate <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#removing the null values from the required table
gap <- as.numeric(gapdate$Global_active_power)

#creating png plot
png("plot1.png", width=480, height=480)
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#closing png plot
dev.off()
