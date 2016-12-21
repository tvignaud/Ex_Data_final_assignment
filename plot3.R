## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
## Which have seen increases in emissions from 1999-2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

## Read the data
setwd("/Users/4065601/Desktop/Exploratory3/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")




# open the png device
png("plot1.png",width = 512,height=512)

# make a barplot showing the sum of Emissions sorted by year (using tapply for the calculation of the sum each year)
with(NEI,barplot(tapply(Emissions/10^6,year,sum),main="Evolution of total PM2.5 emissions in USA",xlab="",ylab="Total PM2.5 emissions in USA (Millions of tons)"))

# closing png device
dev.off()