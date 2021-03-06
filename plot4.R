# Getting data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep=';',na.strings="?",header=TRUE)
unlink(temp)


#converting Date to a type Date
library(lubridate)
data$Date<-dmy(data$Date)

# subsetting on dates
date1<-ymd('2007-02-01')
date2<-ymd('2007-02-02')
date_vector<-c(date1,date2)
data_subset<-data[data$Date %in% date_vector,]

#Plot 4:
png("plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
#subplot1
with(data_subset,plot(date_and_time,Global_active_power,type="l",ylab="Global Active Power",xlab=""))
#subplot2
with(data_subset,plot(date_and_time,Voltage,type="l",ylab="Voltage",xlab="datetime"))
#subplot3
with(data_subset,plot(date_and_time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(data_subset,points(date_and_time,Sub_metering_2,type="l",col="red"))
with(data_subset,points(date_and_time,Sub_metering_3,type="l",col="blue"))
legend("topright",pch="_",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#subplot4
with(data_subset,plot(date_and_time,Global_reactive_power,type="l",xlab="datetime"))
dev.off()