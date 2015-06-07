  ## Read the ; deliminated text file and save in a dtaa frame
  df_all <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",stringsAsFactors=FALSE)
  
  df_all$Date <- as.Date(df_all$Date, format="%d/%m/%Y")
  
  ## Only data for 2007-02-01 and 2007-02-02 required.
  
  data_sub <- subset(df_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  
  ## Converting dates
  datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
  data_sub$Datetime <- as.POSIXct(datetime)
  
  
  png(file="plot3.png", height=480, width=480)
  
  ## Plot 3
  with(data_sub, {
    plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
  })
  
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
