  ## Read the ; deliminated text file and save in a dtaa frame
  df_all <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",stringsAsFactors=FALSE)
  
  df_all$Date <- as.Date(df_all$Date, format="%d/%m/%Y")
  
  ## Only data for 2007-02-01 and 2007-02-02 required.
  
  data_sub <- subset(df_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  
  ## Converting dates
  datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
  data_sub$Datetime <- as.POSIXct(datetime)
  

  ## Plot to the screen 
  plot(data_sub$Global_active_power~data_sub$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="", col = "navyblue")
  
  # Also save png image of the plot to working directory.
  png(file="plot2.png", height=480, width=480)
  
  plot(data_sub$Global_active_power~data_sub$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="", col = "navyblue")
  
  ## Close the graphics
  dev.off()
