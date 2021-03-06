## Exploratory Data Analysis
## Project Assignment 02

## plot1.R

###############################################################################

## Environment Preparation

# free up memory for the download of the data sets
rm(list=ls())

# set working directory
setwd("~/Cursos/Data Science/04 Exploratory Data Analysis/Projetos/Project Assignment 02")

###############################################################################

## Data Preparation

# import data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# prepare data for the graph
NEI$MiOfTons <- NEI$Emissions/1000000       ## creates a column for Millions of Tons
PM25perYr <- tapply(NEI$MiOfTons, NEI$year, sum)

###############################################################################

## Graph Plotting
png("plot1.png")
plot(names(PM25perYr), PM25perYr, type="l", 
                xlab = "Year", 
                ylab = expression ("Total" ~ PM[2.5] ~"Emission (millions of tons)"), 
                main = expression ("Total US" ~ PM[2.5] ~ "Emission"), 
                col="Blue")
dev.off()
