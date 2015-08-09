# this function is used to plot the third figure
# which is the line curve of submeterring  (three curves)
# for assignment #1 in Exploratory Data Analysis


plot3<- function ()
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
  
  #set the layout to 1 in case it is changed
  par(mfrow=c(1,1))
  par(mar=c(4,6,4,4))
  par(cex.axis=1.2, cex.lab=1.2)
  
  # use plot function to create an empty canvas
  plot(x,(as.numeric(dat$Sub_metering_1)),type="n",xlab="",ylab="Energy sub metering")
  # use points function to add three curves
  
  points(x,as.numeric(dat$Sub_metering_1),type="l")
  points(x,as.numeric(dat$Sub_metering_2),type="l",col=2)
  points(x,as.numeric(dat$Sub_metering_3),type="l",col=4)
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"), cex=1.2 )
  
  #output to plot1.png , put into the current folder
  dev.copy(png,file="./plot3.png",res=40)
  dev.off()  # close it
  
}