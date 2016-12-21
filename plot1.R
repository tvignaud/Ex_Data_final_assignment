## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## Read the data
setwd("/Users/4065601/Desktop/Exploratory3/")
NEI <- readRDS("summarySCC_PM25.rds")

## Compute sum over the years using tapply, in Millions of tons
NEI_sum <- with(NEI,tapply(Emissions/10^6,year,sum))
NEI_years <- unique(NEI$year)

## open the png device
png("plot1.png",width = 512,height=512)

## make a plot showing the sum of Emissions by year
plot(NEI_years,NEI_sum,
     main="Evolution of total PM2.5 emissions in USA",
     xlab="Year",
     ylab="Total PM2.5 emissions in USA (Millions of tons)",
     pch = 19,
     col = "blue")

## adding regression model line
abline(lm(NEI_sum~NEI_years),lty=2)

## closing png device
dev.off()

## Yes the total emissions from PM2.5 have decreased in USA from 1999 to 2008