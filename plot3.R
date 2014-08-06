##NOTES:
##This code will create a png file called "plot3.png" to your working directory.
##The following code assumes that you have the data file 
##"household_power_consumption.txt" unzipped to your working directory.
##Download the data here: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

data<-read.csv2("household_power_consumption.txt",header=T,na.strings="?",nrow=70000,stringsAsFactors=F)
data<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
data$DTTM<-paste(data[,"Date"],data[,"Time"])
data$DTTM<-strptime(data$DTTM,format="%d/%m/%Y %H:%M:%S")
data$Global_active_power<-as.numeric(data$Global_active_power)
png("plot3.png",width=480,height=480, units="px")
plot(data$DTTM,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
points(data$DTTM,data$Sub_metering_2,col="red", type="l")
points(data$DTTM,data$Sub_metering_3,col="blue", type="l")
legend("topright",col=c("black","red","blue"),lty=c(1,1,1) ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()