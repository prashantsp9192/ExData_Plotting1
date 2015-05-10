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

#Plot1:
png("plot1.png",width=480,height=480,units="px")
hist(data_subset$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()