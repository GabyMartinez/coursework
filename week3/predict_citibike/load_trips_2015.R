library(dplyr)
library(readr)

# define a function to turn strings into datetimes
parse_datetime <- function(s, format="%Y-%m-%d %H:%M:%S") {
  as.POSIXct(as.character(s), format=format)
}

########################################
# load and clean trip data
########################################

# load each month of the trip data into one big data frame
csvs <- Sys.glob('*-tripdata.csv')
trips <- data.frame()
for (csv in csvs) {
  print(csv)
  tmp <- read_csv(csv, na='\\N')

  # the date format changed to something ugly in 2014-09 which read_csv doesn't recognize as a datetime,
  # so manually convert the date from a string to a datetime
  if (typeof(tmp$starttime) == "character")
    tmp <- mutate(tmp,
                  starttime=parse_datetime(starttime, "%m/%d/%Y %H:%M"),
                  stoptime=parse_datetime(stoptime, "%m/%d/%Y %H:%M"))

  trips <- rbind(trips, tmp)
}

# replace spaces in column names with underscores
names(trips) <- gsub(' ', '_', names(trips))

# add a column for year/month/day (without time of day)
trips <- mutate(trips, ymd=as.Date(starttime))

# recode gender as a factor 0->"Unknown", 1->"Male", 2->"Female"
trips <- mutate(trips, gender=factor(gender, levels=c(0,1,2), labels=c("Unknown","Male","Female")))

########################################
# load and clean weather data
########################################

# load weather data from belvedere tower in central park
# https://www.ncei.noaa.gov/orders/cdo/762757.csv
# ordered from
# http://www.ncdc.noaa.gov/cdo-web/datasets/GHCND/stations/GHCND:USW00094728/detail

weather2015 <- read.table('weather_2015.csv', header=T, sep=',')

# extract just a few columns, lowercase column names, and parse dates
weather2015 <- select(weather2015, DATE, PRCP, SNWD, SNOW, TMAX, TMIN)
names(weather2015) <- tolower(names(weather2015))
weather2015 <- mutate(weather2015,
                  ymd = as.Date(date))
weather2015 <- tbl_df(weather2015)


#creating trips_per_day2015 data

trips %>% 
  group_by(ymd) %>%
  summarise(num_trips = n()) -> trips_per_day2015

trips_per_day2015 %>%
  left_join(weather2015, by=c("ymd"="ymd")) -> trips_per_day2015


# save data frame for easy loading in the future
save(trips_per_day2015, file='trips2015.RData')

