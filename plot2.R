## Clean all data.
rm(list=ls())

## Clear all plots.
graphics.off()

## Load serialized source data.
## See script 'serialize subset.R', generate the data object file using this
## script or download the .rds object file directly to your working dir.  
dat <- readRDS("./dat.rds")

## The plot to duplicate is a line plot: plot(..., type="l") 
## .. of the variable 'dat$Global_active_power' (y) versus dat$Date+dat$Time (x).
## The Title is empty: main="".
## The x-axis tick marks are "Thu", "Fri", "Sat": see axis function call (1).
## The y-axis tick marks are 0,2,4,6 (default). 
## The y-axis label is 'Global Active Power (kilowatts)': ylab="Global Active Power (kilowatts)".
## The x-axis label is empty: xlab="".
## (1) Note: the x-axis tick marks on my system are in Dutch, but this
## must be locale setting related; *but* all letters are lower case,
## contrary to example plot -> so going with custom tick marks..


## Plotting straight to PNG device, because dev.copy produces a lesser result..
png("./plot2.png", width=480, height=480, units="px")


plot(x=dat$Date+dat$Time, y=dat$Global_active_power
     , type="l", main="", ylab="Global Active Power (kilowatts)"
     , xlab = ""
     , xaxt='n' #suppressing default x axis tick marks.
     )

# set the x axis tick marks.
atvals = c(dmy_hms("01-02-2007 00:00:00")   # the values at which the custom
           , dmy_hms("02-02-2007 00:00:00") # tick marks should be set.
           , dmy_hms("03-02-2007 00:00:00"))
axis(label=c("Thu","Fri","Sat"), side=1,at=atvals)

## close PNG device
dev.off()