## Loading the data

# clean all
rm(list=ls())

### N.B. The data file must be unzipped to a './data' folder, resulting in 
###      the file './data/household_power_consumption.txt'.


# Required library (for easy string to date conversion).
library(lubridate)
# Required library (for fast reading and subsetting).
library(data.table)


# (fast) Read in the data file.
dat <- fread("./data/household_power_consumption.txt" 
             , colClasses = "character"     #read all columns in as char (due to NA-bug)
             , na.strings = "?")            #set to read '?' as NA. 

dat <- as.data.frame(dat) #convert to standard data frame


# First do the Date column type conversion and
# subset the data, to prevent further unnecessary processing.
dat$Date <- dmy(dat$Date) #column Date in format dd/mm/yyyy
dat <- dat[dat$Date >= ymd("2007-02-01") # subset the data on date 1-feb-2007 to 2-feb-2007
           & dat$Date <= ymd("2007-02-02") 
           , ]

# Now do the rest of the column conversions 
dat$Time <- hms(dat$Time)     #column Time in format hh:mm:ss 
dat[,3:9] <- sapply (dat[,3:9], as.numeric) #and the other columns

# Serialize the subset for use in plotN.r scripts.
saveRDS (dat, "./dat.rds")

# clean all
rm(list=ls())
