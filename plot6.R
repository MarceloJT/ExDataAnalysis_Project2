## Exploratory Data Analysis
## Project Assignment 02

## plot6.R

###############################################################################

## Environment Preparation

# free up memory for the download of the data sets
rm(list=ls())

# set working directory
setwd("~/Cursos/Data Science/04 Exploratory Data Analysis/Projetos/Project Assignment 02")

# libraries to open
library(ggplot2)
library(plyr)

###############################################################################

## Data Preparation

# import data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# prepare data for the graph
motorVehicles <- unique(grep("Vehicles", SCC$EI.Sector,                     ## subsets Motor Vehicles 
                             ignore.case = TRUE, value = TRUE))
subsetmv <- SCC[SCC$EI.Sector %in% motorVehicles, ]["SCC"]
baltimoreVehicles <- NEI[NEI$SCC %in% subsetmv$SCC & NEI$fips == "24510",]  ## subsets Baltimore
LAVehicles <- NEI[NEI$SCC %in% subsetmv$SCC & NEI$fips == "06037", ]        ## subsets Los Angeles
combinedCities <- rbind(baltimoreVehicles, LAVehicles)                      ## sums up the 2 cities
totalVehiclesperYr <- aggregate (Emissions ~ fips * year, data =combinedCities, FUN = sum )   ## stats
totalVehiclesperYr$City <- ifelse(totalVehiclesperYr$fips == "06037", "Los Angeles", "Baltimore") ## adds column City

###############################################################################

## Graph Plotting
png("plot6.png", width=750)
qplot(year, Emissions, data=totalVehiclesperYr, geom="line", color=City) + 
        ggtitle(expression("Motor Vehicle " ~ PM[2.5] ~ " Emission (Los Angeles and Baltimore)")) + 
        xlab("year") + 
        ylab(expression("Total " ~ PM[2.5] ~ " Emission"))
dev.off()
