## Exploratory Data Analysis
## Project Assignment 02

## plot4.R

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

NEIandSCC  <- merge(NEI, SCC, by="SCC")                              ## merges the two datasets 
coalMatch  <- grepl("coal", NEIandSCC$Short.Name, ignore.case=TRUE)  ## matches all NEIandSCC records with Short.Name "coal"
coalNEIandSCC <- NEIandSCC[coalMatch, ]
coalperYrType <- ddply(coalNEIandSCC,                                ## summarises the data
                             .(year, type), 
                             function(x) {sum(x$Emissions)})
colnames(coalperYrType)[3] <- "Emissions"                    ## renames the col: Emissions
coalperYrType$ThOfTons <- coalperYrType$Emissions/1000                ## transforms into Thousands of tons

###############################################################################

## Graph Plotting
png("plot4.png")
qplot(year, ThOfTons, data=coalperYrType, color=type, geom="line") +
      stat_summary(fun.y = "sum", color="black", geom="line", aes(label="total")) +
      ggtitle("Coal Combustion - " ~ PM[2.5] ~ "Emission (by Type)") +
      xlab("year") + 
      ylab("Total" ~ PM[2.5] ~ "Emission (tons x 1000)")   
dev.off()
