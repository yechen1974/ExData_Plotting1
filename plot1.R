# this function is used to plot the first figure
# which is the hist of the Global Active Power  
# for assignment #1 in Exploratory Data Analysis


plot1<- function ()
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
  # need to use as.numeric function
  # use the hist()
  #set the layout to 1 in case it is changed
  par(mfrow=c(1,1))
  hist(as.numeric(dat$Global_active_power),xlab="Global Active Power(kilowatts)",col=2,main="Global Active Power")
  
  #output to plot1.png , put into the current folder
  dev.copy(png,file="./plot1.png")
  dev.off()  # close it
}