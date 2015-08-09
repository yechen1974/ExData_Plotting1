# this function is used to plot the second figure
# which is the line curve of Global active power  
# for assignment #1 in Exploratory Data Analysis


plot2<- function ()
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
  
  # use plot function
 plot(x,(as.numeric(dat$Global_active_power)),xlab="",ylab="Global Active Power(kilowatts)",type = "l")
 
  #output to plot1.png , put into the current folder
  dev.copy(png,file="./plot2.png")
  dev.off()  # close it
}