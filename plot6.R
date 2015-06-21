plot6 <- function()
{
  library(reshape2)
  library(ggplot2)
  ## Read RDS files
  
  ## currect directory is Getting and Cleaning Data. Files are in Course Project 2 folder in the current working directory
  
  NEI <- readRDS("./Course Project 2/summarySCC_PM25.rds")
  SCC <- readRDS("./Course Project 2/Source_Classification_Code.rds")
  NEI$year <- factor(NEI$year, levels = c('1999', '2002', '2005', '2008'))
  
  #Subsetting the data as per assignment
  baltimore_data <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
  lasangles_data <- subset(NEI, fips == '06037' & type == 'ON-ROAD')
  
  # Rolled up data for Baltimore
  baltimore_data_frame <- aggregate(baltimore_data[, 'Emissions'], by = list(baltimore_data$year), sum)
  colnames(baltimore_data_frame) <- c('year', 'Emissions')
  baltimore_data_frame$City <- paste(rep('MD', 4))
  
  #Rolled up data for Las Angles
  
  lasangles_data_frame <- aggregate(lasangles_data[, 'Emissions'], by = list(lasangles_data$year), sum)
  colnames(lasangles_data_frame) <- c('year', 'Emissions')
  lasangles_data_frame$City <- paste(rep('CA', 4))
  
  combined_data_frame <- as.data.frame(rbind(baltimore_data_frame, lasangles_data_frame))
  
  ## Plotting and file saving 
  
  png(filename = "./Course Project 2/plot6.png", height = 600, width = 700)
  ggplot(data = combined_data_frame, aes(x = year, y = Emissions)) + geom_bar(aes(fill = year),stat = "identity") + guides(fill = F) + ggtitle('Total Emissions of Motor Vehicle Sources\nLos Angeles County, California vs. Baltimore City, Maryland') + ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position = 'none') + facet_grid(. ~ City) + geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = -1))
  dev.off()
  
  
}
