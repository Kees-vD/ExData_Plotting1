## Clean all data.
rm(list=ls())

## Clear all plots.
graphics.off()

## Load serialized source data.
## See script 'serialize subset.R', generate the data object file using this
## script or download the .rds object file directly to your working dir.  
dat <- readRDS("./dat.rds")

####....

## Plotting straight to PNG device, because dev.copy produces a lesser result..
png("./plot4.png", width=480, height=480, units="px")

par(mfrow = c(2,2))

#### PLOT 1
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


#### PLOT 2 
plot(x=dat$Date+dat$Time, y=dat$Voltage
     , type="l", main="", ylab="Voltage"
     , xlab = "datetime"
     , xaxt = "n" #suppressing default x axis tick marks.
     , yaxt = "n" #suppressing default y axis tick marks.
)

# Set the x axis tick marks.
atvals = c(dmy_hms("01-02-2007 00:00:00")   # the values at which the custom
           , dmy_hms("02-02-2007 00:00:00") # tick marks should be set.
           , dmy_hms("03-02-2007 00:00:00"))
axis(label=c("Thu","Fri","Sat"), side=1,at=atvals)

# Set the y axis tick marks.
atvals = seq(234, 246, by=2) # producing 7 tick marks
labels = c("234", "", "238", "", "242", "", "246") # 4 tick mark non-empty labels
axis(label=labels, side=2,at=atvals) # side = left


#### PLOT 3
dattime <- dat$Date+dat$Time # for reusing the x axis values.

# NB line colour for Sub_metering_1 is default black. 
plot(x=dattime, y=dat$Sub_metering_1
     , type="l", main="", ylab="Energy sub metering"
     , xlab = ""
     , xaxt='n' #suppressing default x axis tick marks.
)

## Set the custom x axis tick marks.
atvals = c(dmy_hms("01-02-2007 00:00:00")   # the values at which the custom
           , dmy_hms("02-02-2007 00:00:00") # tick marks should be set.
           , dmy_hms("03-02-2007 00:00:00"))

axis(label=c("Thu","Fri","Sat") # custom tick mark labels
     , side=1 # bottom side
     ,at=atvals)

## Add the red Sub_metering_2 line.
lines(x=dattime, y=dat$Sub_metering_2, col="red")

## Add the blue Sub_metering_3 line.
lines(x=dattime, y=dat$Sub_metering_3, col="blue")

## Add the legend.
legend (x="topright" # position of the legend (by keyword)
        , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        , lty = c(1,1,1) # set type = line
        , col = c("black", "red", "blue")
        , bty = "n" # no box line
)


#### PLOT 4
plot(x=dat$Date+dat$Time, y=dat$Global_reactive_power
     , type="l", main="", ylab="Global_reactive_power"
     , xlab = "datetime"
     , xaxt = "n" #suppressing default x axis tick marks.
     #, yaxt = "n" #suppressing default y axis tick marks.
)

# Set the x axis tick marks.
atvals = c(dmy_hms("01-02-2007 00:00:00")   # the values at which the custom
           , dmy_hms("02-02-2007 00:00:00") # tick marks should be set.
           , dmy_hms("03-02-2007 00:00:00"))
axis(label=c("Thu","Fri","Sat"), side=1,at=atvals)

# Leave y axis tick marks at defaults..

## close PNG device
dev.off()