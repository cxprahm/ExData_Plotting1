## Read the ; deliminated text file and save in a dtaa frame
  df_all <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",stringsAsFactors=FALSE)
  
  df_all$Date <- as.Date(df_all$Date, format="%d/%m/%Y")
  
  ## Only data for 2007-02-01 and 2007-02-02 required.
  
  data_sub <- subset(df_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  
  ## Date and time type/format conversion
  datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
  data_sub$Datetime <- as.POSIXct(datetime)
  
  png(file="plot4.png", height=480, width=480)
  
  
  ## Plot set up/configuration 
  par(mfrow=c(2,2))
  
  with(data_sub, {
    
    ## First plot 
    plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    
    ## Second plot
    plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
    
    ## Third plot
    plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='RED')
    lines(Sub_metering_3~Datetime,col='BLUE')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    #Fourth Plot 
    plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
  })
  
  dev.off()
