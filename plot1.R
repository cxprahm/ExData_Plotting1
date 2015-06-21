plot1 <- function()
{
  ## Read RDS files
  
  ## currect directory is Getting and Cleaning Data. Files are in Course Project 2 folder in the current working directory
  
  NEI <- readRDS("./Course Project 2/summarySCC_PM25.rds")
  SCC <- readRDS("./Course Project 2/Source_Classification_Code.rds")
  
  
  # Sum the emission by year -- this might about a minute.
  
  total_emissions_by_year <- aggregate(NEI$Emissions, by = list(NEI$year), FUN = sum)
  
  total_emissions_by_year
  total_emissions_by_year_mill <- round(total_emissions_by_year[, 2] / 1000000, 2)
  
  ## Plotting and file saving 
  png(filename = "./Course Project 2/plot1.png", height = 600, width = 700)
  
  par(mar=c(5,5,5,0))
  
  barplot(total_emissions_by_year_mill, names.arg = total_emissions_by_year$Group.1,
          main = "Annual amount of PM2.5 emitted in the USA", xlab = "Year", ylab = "Amount of PM2.5 emitted, in millio tons", col = "purple", cex.lab= 1.15)
  dev.off()
}
