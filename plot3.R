library(dplyr)
url<-"C:\\Data Files\\Coursea\\Exploratory Data Analysis with R\\household_power_consumption.txt"

##
## Load Data
##
hpc<-read.table(url,sep =";",header=TRUE)

##
## Transform Date and Time columns 
##
hpc1<-data.frame(hpc,Date_Time=strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S"))
hpc1$Date<-as.Date(hpc1$Date,"%d/%m/%Y")

##
## Select only Feb 1 2007 to Feb 2 2007 Data
##
Date1<-as.Date("01/02/2007","%d/%m/%Y")
Date2<-as.Date("02/02/2007","%d/%m/%Y")
hpc2<-filter(hpc1,hpc1$Date>=Date1 & hpc1$Date<=Date2)

##
## Open Plot3 png file
##
urlpng<-"C:\\Data Files\\Coursea\\Exploratory Data Analysis with R\\plot3.png"
png(urlpng, width = 480, height = 480)

##
## Plot Date against Sub Meeting 1, Sub Meeting 2, Sub Meeting 3 
##
plot(x=(hpc2$Date_Time),y=(hpc2$Sub_metering_1),type="n",xlab="",
     ylab="Energy Sub meeting")
points(x=(hpc2$Date_Time),y=(hpc2$Sub_metering_1),type="l",col="black")
points(x=(hpc2$Date_Time),y=as.numeric(as.character(hpc2$Sub_metering_2)),
       type="l",col="red")
points(x=(hpc2$Date_Time),y=as.numeric(as.character(hpc2$Sub_metering_3)),
       type="l",col="blue")
legend("topright",pch=c(NA,NA,NA),col=c("black","red","blue"),legend=c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"),
       lwd=2,lty=c(1,1,1))

dev.off()
