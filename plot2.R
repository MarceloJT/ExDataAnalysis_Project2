## Exploratory Data Analysis
## Project Assignment 02

## plot2.R

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
baltimore <- subset (NEI, fips == "24510")                               ## subsets Baltimore
baltimore$ThOfTons <- baltimore$Emissions/1000                           ## transforms into Thousands of tons
baltimorePM25perYr <- tapply(baltimore$ThOfTons, baltimore$year, sum)    ## apply the sum function

###############################################################################

## Graph Plotting
png("plot2.png")
plot(names(baltimorePM25perYr), baltimorePM25perYr, type = "l", 
        xlab="Year", 
        ylab= expression("Total" ~ PM[2.5] ~ "Emission (tons x 1000)"), 
        main=expression("Baltimore City -" ~ PM[2.5] ~ "Total Emission"), 
        col = "blue")
dev.off()     
