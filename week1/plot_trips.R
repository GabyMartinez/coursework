########################################
# load libraries
########################################

# load some packages that we'll need
library(tidyverse)
library(scales)

# be picky about white backgrounds on our plots
theme_set(theme_bw())

# load RData file output by load_trips.R
load('trips.RData')


########################################
# plot trip data
########################################

# plot the distribution of trip times across all rides (compare a histogram vs. a density plot)
trips %>% filter(tripduration < 5e3) %>% 
  ggplot(aes(tripduration)) + 
  geom_histogram()

trips %>% filter(tripduration < 5e3) %>% 
  ggplot(aes(tripduration)) + 
  geom_density(fill="grey")

# plot the distribution of trip times by rider type indicated using color and fill (compare a histogram vs. a density plot)
trips %>% filter(tripduration < 5e3) %>% 
  ggplot(aes(tripduration, color = usertype, fill = usertype)) + 
  geom_density()

trips %>% filter(tripduration < 5e3) %>% 
  ggplot(aes(tripduration, color = usertype, fill = usertype)) + 
  geom_histogram(position = "identity", alpha = .25)

# plot the total number of trips on each day in the dataset
trips %>% mutate(date = as.Date(starttime)) %>% 
  ggplot(aes(y=date)) + 
  geom_bar()


# plot the total number of trips (on the y axis) by age (on the x axis) and gender (indicated with color)
trips %>% mutate(age = 2014 - birth_year) %>% 
  ggplot(aes( x = age, fill = gender )) + 
  geom_bar(position = "identity", alpha = .5)

# plot the ratio of male to female trips (on the y axis) by age (on the x axis)
# hint: use the spread() function to reshape things to make it easier to compute this ratio
# (you can skip this and come back to it tomorrow if we haven't covered spread() yet)

  trips %>% select(gender,age) %>% 
    group_by(gender,age) %>% 
    summarise(count=n()) %>% 
    pivot_wider(names_from = gender, values_from = count) %>% 
    mutate(ratio = Male/Female) %>% 
    ggplot(aes(age, ratio)) + 
    geom_point()

########################################
# plot weather data
########################################
# plot the minimum temperature (on the y axis) over each day (on the x axis)
weather %>% ggplot(aes(x = date, y = tmin)) + geom_point()

# plot the minimum temperature and maximum temperature (on the y axis, with different colors) over each day (on the x axis)
# hint: try using the gather() function for this to reshape things before plotting
# (you can skip this and come back to it tomorrow if we haven't covered gather() yet)
  
  weather %>% 
    select(ymd, tmax, tmin) %>% 
    pivot_longer(names_to = "max_min", values_to = "temp", 2:3) %>% 
    ggplot(aes(x=ymd, y=temp, color = max_min)) + geom_point()
  
  
########################################
# plot trip and weather data
########################################

# join trips and weather
  trips_with_weather <- left_join(trips, weather, by="ymd")

# plot the number of trips as a function of the minimum temperature, where each point represents a day
# you'll need to summarize the trips and join to the weather data to do this

  #trips_with_weather %>% group_by(tmin) %>% summarize(count=n()) -> temp
  #ggplot(temp, aes(x=tmin, y=count)) + geom_point()
  
  trips_with_weather %>% group_by(ymd) %>% summarise(count=n()) -> temp
  trips_days <- left_join(temp, weather, by="ymd")
  ggplot(trips_days, aes(x=tmin, y=count)) + geom_point()
  

# repeat this, splitting results by whether there was substantial precipitation or not
# you'll need to decide what constitutes "substantial precipitation" and create a new T/F column to indicate this

  trips_with_weather %>% 
    mutate(s_prcp = ifelse(prcp > 1.5, T, F)) %>% View()
  
  
  #    if(prcp > 1.5){
  #      substantial_prcp = TRUE}
  #    else
  #      substantial_prcp = FALSE
  #      ) -> trips_with_weather
  
    ggplot(aes(x=tmin, color=substantial_prcp)) +
    geom_histogram()
  
# add a smoothed fit on top of the previous plot, using geom_smooth

# compute the average number of trips and standard deviation in number of trips by hour of the day
# hint: use the hour() function from the lubridate package

# plot the above

# repeat this, but now split the results by day of the week (Monday, Tuesday, ...) or weekday vs. weekend days
# hint: use the wday() function from the lubridate package
