## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

## Read the data
setwd("/Users/4065601/Desktop/Exploratory3/")
NEI <- readRDS("summarySCC_PM25.rds")

## list rows containing data related to Baltimore City
baltimore_rows <- NEI$fips == "24510"

## Compute sum over the years using tapply, in Thousands of tons
NEI_baltimore_sum <- with(NEI[baltimore_rows,],tapply(Emissions/10^3,year,sum))
NEI_years <- unique(NEI$year)

## open the png device
png("plot2.png",width = 512,height=512)

## make a plot showing the sum of Emissions by year
plot(NEI_years,NEI_baltimore_sum,
     main="Evolution of total PM2.5 emissions in Baltimore City",
     xlab="Year",
     ylab="Total PM2.5 emissions in Baltimore City (Thousands of tons)",
     pch = 19,
     col = "blue")

## adding regression model line
abline(lm(NEI_baltimore_sum~NEI_years),lty=2)

## closing png device
dev.off()

## Yes the total emissions from PM2.5 have decreased in Baltimore City from 1999 to 2008.
## There is though a high variability around the regression line and we should be careful
## with this finding that could be due to random variations over the Years