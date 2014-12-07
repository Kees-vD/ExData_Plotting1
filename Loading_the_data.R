# Step 'Loading the data

library(lubridate)
library(pryr)


# Estimate memory usage
#create a list of the first row
li <- list("16/12/2006", "17:24:00", "124.216", "123.418", "234.840", "180.401", "100.001", "121.001", "117.001")

#dmy("16/12/2006")
#hms("17:24:00")

li[[1]] <- dmy(li[[1]])
li[[2]] <- hms(li[[2]])
li[3:9]<-as.numeric(li[3:9])

# get size
si <- object_size(li)

# there are 2075259 row
print(si * 2075259)

# 2.68 GB (?!) one row of test data probably not very representative.. 

# try loading data.table using fread
te <- fread("household_power_consumption.txt", colClasses="character")

#OK!

#check size
object_size(te)

# 75.1 MB w00t!

# to do handle the ?'s (NA's)
#options 
#  na.strings = "?" option
#  set colClasses ?
#  data.table = T
