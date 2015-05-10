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

#Plot2:
png("plot2.png",width=480,height=480,units="px")
data_subset$day<-as.factor(weekdays(data_subset$Date))
date_and_time<-as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S")
data_subset$date_and_time<-date_and_time
with(data_subset,plot(date_and_time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()