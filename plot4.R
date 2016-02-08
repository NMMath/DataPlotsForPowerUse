
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

png("plot4.png", width=480, height=480)
par(mar=c(1,2,1,2))
par(mfrow=c(2,2))
plot(ND$DateTime,ND$Global_active_power,typ="line",ylab="Global Active Power")
plot(ND$DateTime,ND$Voltage, typ="line",ylab="Voltage")
plot(ND$DateTime,ND$Sub_metering_1,col="black",typ="line",ylab="Energy sub metering")
points(ND$DateTime,ND$Sub_metering_2,col="red",typ="line")
points(ND$DateTime,ND$Sub_metering_3,col="blue",typ="line")
legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"), lwd=2, cex=1, horiz = FALSE)
plot(ND$DateTime,ND$Global_reactive_power,typ="line",ylab="Global Reactive Power")
dev.off()
