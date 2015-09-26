## Exploratory Data Analysis
## Project Assignment 02

## plot3.R

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
baltimore <- subset (NEI, fips == "24510")                        ## subsets Baltimore
baltimore$ThOfTons <- baltimore$Emissions/1000                    ## transforms into Thousands of tons
baltimorePM25perYrType <- ddply(baltimore,                        ## summarises the data
                                .(year, type), 
                                function(x) {sum(x$ThOfTons)})
colnames(baltimorePM25perYrType)[3] <- "Emission"                 ## renames the col: Emissions

###############################################################################

## Graph Plotting
png("plot3.png") 
qplot(year, Emission, data=baltimorePM25perYrType, color=type, geom ="line") +
        ggtitle("Baltimore City - " ~ PM [2.5] ~ "Emission (by source / type / year)") +
        xlab("year") + 
        ylab("Total" ~ PM[2.5] ~ "Emission (tons x 1000)")
dev.off()
