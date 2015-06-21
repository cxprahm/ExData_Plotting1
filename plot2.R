plot2 <- function()
{
  library(reshape2)
  library(ggplot2)
  
  ## Read RDS files
  
  ## currect directory is Getting and Cleaning Data. Files are in Course Project 2 in the current working directory
  
  NEI <- readRDS("./Course Project 2/summarySCC_PM25.rds")
  
  ## Only the data for Maryland needed for plotting
  
  NEI <- subset(NEI, fips == '24510')
  
  # Sum the emission by year -- this might about a minute.
  
  total_emissions_by_year <- aggregate(NEI$Emissions, by = list(NEI$year), FUN = sum)
  
  total_emissions_by_year
  
  ## Plotting and file saving 
  
  png(filename = "./Course Project 2/plot2.png")
  
  total_emissions_by_year_thou <- round(total_emissions_by_year[, 2] / 1000, 2)
  
  barplot(total_emissions_by_year_thou, names.arg = total_emissions_by_year$Group.1,main = "Annual amount of PM2.5 emitted in  Baltimore City, Maryland", xlab = "Year", ylab = "Amount of PM2.5 emitted, in thousand tons", col = "purple")
  
  dev.off()
  
}
