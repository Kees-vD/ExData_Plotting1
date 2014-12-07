## Clean all data.
rm(list=ls())

## Clear all plots.
graphics.off()

## Load serialized source data.
## See script 'serialize subset.R', generate the data object file using this
## script or download the .rds object file directly to your working dir.  
dat <- readRDS("./dat.rds")

## The plot to duplicate is a frequency distribution diagram: a Histogram 
## .. of the variable 'dat$Global_active_power';freq=T (default).
## It (appears) to have 12 Bins: breaks=12.
## The Title is 'Global Active Power': main="Global Active Power".
## The Bar Colour is red: col="red".
## The x-axis label is 'Global Active Power (kilowatts)': xlab="Global Active Power (kilowatts)".
## The y-axis label is 'Frequency': ylab='Frequency' (default).

## Plotting straight to PNG device, because dev.copy produces a lesser result..
png("./plot1.png", width=480, height=480, units="px")

hist(dat$Global_active_power, breaks=11
     , main="Global Active Power"
     , xlab="Global Active Power (kilowatts)"
     , col="red")

## close PNG device
dev.off()