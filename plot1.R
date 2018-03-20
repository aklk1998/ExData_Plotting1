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
## Open Plot1 png file
##
urlpng<-"C:\\Data Files\\Coursea\\Exploratory Data Analysis with R\\plot1.png"
png(urlpng, width = 480, height = 480)

##
## Create a histogram of Global Active Power
##
hist(as.numeric(as.character(hpc2$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",
     ,main="Global Active Power",ylim=c(0,1200))


dev.off()
