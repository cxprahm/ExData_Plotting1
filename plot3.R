plot3 <- function()
{
  # Loads RDS
  require(ggplot2)
  
  ## currect directory is Getting and Cleaning Data. Files are in Course Project 2 folder in the current working directory
  NEI <- readRDS("./Course Project 2/summarySCC_PM25.rds")
  
  #Subsetting the data as per assignment
  baltimore_data <- subset(NEI, fips == 24510)
  baltimore_data$year <- factor(baltimore_data$year, levels = c('1999', '2002', '2005', '2008'))
  
  png(filename = "./Course Project 2/plot3.png", height = 600, width = 1000)
  ggplot(data = baltimore_data, aes(x = year, y = log(Emissions))) + facet_grid(. ~ type) + guides(fill = F) + geom_boxplot(aes(fill = type)) + stat_boxplot(geom = 'errorbar') + ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + ggtitle('Emissions per Type in Baltimore City, Maryland') + geom_jitter(alpha = 0.10)
  dev.off()
}
