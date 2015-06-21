plot5 <- function()
{
  library(reshape2)
  library(ggplot2)
  
  ## Read RDS files
  
  ## currect directory is Getting and Cleaning Data. Files are in Course Project 2 in the current working directory
  
  NEI <- readRDS("./Course Project 2/summarySCC_PM25.rds")
  
  #Subsetting the data as per assignment
  baltimore_data <- subset(NEI, fips == 24510 & type == 'ON-ROAD')
  
  # Rolled up data for Baltimore
  baltimore_data_frame <- aggregate(baltimore_data[, 'Emissions'], by = list(baltimore_data$year), sum)
  colnames(baltimore_data_frame) <- c('year', 'Emissions')
  
  ## Plotting and file saving 
  png(filename = "./Course Project 2/plot5.png", height = 600, width = 700)
  ggplot(data = baltimore_data_frame, aes(x = year, y = Emissions)) + geom_bar(aes(fill = year), stat = "identity") + guides(fill = F) + ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position = 'none') + geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = 2))
  dev.off()
  
}
