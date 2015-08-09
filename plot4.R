# this function is used to plot the forth figure
# which includes four plots  
# for assignment #1 in Exploratory Data Analysis

plot4<- function ()
{
  # first read the file, assume the household_power_consumption.txt
  # is under the current directory
  
  # read the entire file, try to figure out the better way only to do selected rows
  # use fread() for fast speed.  need to load the data.table package
  require(data.table)
  # also suppress warning
  data<-suppressWarnings(fread("household_power_consumption.txt",sep=";"))
  # subset the data to get only the data for 1/2/2007 and 2/2/2007
  dat<-subset(data,(Date=="1/2/2007")|(Date=="2/2/2007"))
  # first to get the date and time 
  # use the strptime to convert to Date/Time classes, note that the format is day/month/Y (4 digits)
  
  x<-strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")
  
  # set 2x2 plot layout
  par(mfrow=c(2,2))
   par(mar=c(4,5,3,3))
  par(cex.axis=1.4, cex.lab=1.6)
  # first plot:  global active power
  plot(x,(as.numeric(dat$Global_active_power)),xlab="",ylab="Global Active Power",type = "l")
  #second plot  Voltage
  plot(x,(as.numeric(dat$Voltage)),xlab="datetime",ylab="Voltage",type = "l")
  
  # third, the submetering plot
  # use plot function to create an empty canvas
  plot(x,(as.numeric(dat$Sub_metering_1)),type="n",xlab="",ylab="Energy sub metering")
  # use points function to add three curves
  points(x,as.numeric(dat$Sub_metering_1),type="l")
  points(x,as.numeric(dat$Sub_metering_2),type="l",col=2)
  points(x,as.numeric(dat$Sub_metering_3),type="l",col=4)
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"),cex=1.1 )
  
  # forth plot global reactive power
  plot(x,(as.numeric(dat$Global_reactive_power)),xlab="datetime",ylab="Global reactive Power",type = "l")
  
  #output to plot1.png , put into the current folder
  dev.copy(png,file="./plot4.png",res=40)
  dev.off()  # close it
}