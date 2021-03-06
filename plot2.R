
NewData_3<-read.table("C:/Users/Nathan/Documents/Coursera/Data Science/Exploratory Data Analysis/household_power_consumption.txt",sep=";", header=TRUE)
NewData_3$Date<-as.Date(NewData_3$Date,format="%d/%m/%Y")
ND<-NewData_3[which(NewData_3$Date=="2007-02-01"| NewData_3$Date=="2007-02-02" ),]
ND$Global_active_power<-as.numeric(as.character(ND$Global_active_power))
ND$Global_reactive_power<-as.numeric(as.character(ND$Global_reactive_power))
ND$Voltage<-as.numeric(as.character(ND$Voltage))
ND$Global_intensity<-as.numeric(as.character(ND$Global_intensity))
ND$Sub_metering_1<-as.numeric(as.character(ND$Sub_metering_1))
ND$Sub_metering_2<-as.numeric(as.character(ND$Sub_metering_2))
ND$Sub_metering_3<-as.numeric(as.character(ND$Sub_metering_3))
ND$DateTime<-as.POSIXct(paste(ND$Date, ND$Time), format="%Y-%m-%d %H:%M:%S")


png("plot2.png", width=480, height=480)
plot(ND$DateTime,ND$Global_active_power,  typ='l', ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
