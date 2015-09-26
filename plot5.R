## Exploratory Data Analysis
## Project Assignment 02

## plot5.R

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
baltVehiclesPM25perYr <- ddply(baltimoreVehicles, .(year),                  ## summarises data
                               function(x) sum(x$Emissions))
colnames(baltVehiclesPM25perYr)[2] <- "Emissions"                           ## renames stats column


###############################################################################

## Graph Plotting
png("plot5.png")
qplot(year, Emissions, data=baltVehiclesPM25perYr, geom="line") + 
        ggtitle(expression("Baltimore City - " ~ PM[2.5] ~ "Motor Vehicle Emission")) + 
        xlab("year") + 
        ylab(expression("Total" ~ PM[2.5] ~ "Emission (tons)"))
dev.off()