  ## Read the ; deliminated text file and save in a dtaa frame
  df_all <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",stringsAsFactors=FALSE)
  
  ## Date type format
  df_all$Date <- as.Date(df_all$Date, format="%d/%m/%Y")
  
  ## Only data for 2007-02-01 and 2007-02-02 required.
  data_sub <- subset(df_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  
  ## Plot the historgram and display to the screen. 
  hist(data_sub$Global_active_power, col = "RED", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
  
  ## Png file saved to default working directory
  
  png(file="plot1.png", height=480, width=480)
  hist(data_sub$Global_active_power, col = "RED", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
  dev.off()
