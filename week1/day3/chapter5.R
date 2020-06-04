install.packages("nycflights13")
library(nycflights13)

#5.2.4 Exercises
#1. Find all flights that
#   a. Had an arrival delay of two or more hours
        flights %>% filter(arr_delay>(60*2))

#   b. Flew to Houston (IAH or HOU)
        
        flights %>% filter(dest == 'IAH' | dest == 'HOU')
        
#   c. Were operated by United, American, or Delta
        
        flights %>% filter(carrier %in% c('UA', 'AA', 'DL'))
        
#   d. Departed in summer (July, August, and September)
        
        flights %>% filter(month %in% c(7, 8, 9))

#   e. Arrived more than two hours late, but didn’t leave late
        
        flights %>% filter(arr_delay>(60*2) & dep_delay <= 0)

#   f. Were delayed by at least an hour, but made up over 30 minutes in flight

        flights %>% filter(dep_delay>=60 & arr_delay > dep_delay - 30)

#   g. Departed between midnight and 6am (inclusive)

        flights %>% filter(dep_time <= 600)

#3. How many flights have a missing dep_time? What other variables are missing? What might these rows represent?
    
        flights %>% filter(is.na(dep_time)) %>% count()
        
        #8255 flights with a missing departure time
        #these flights are also missing a dep_delay, arrival time, arr_delay, and air time variables.
        #it is likely these flights were canceled since they never took off and thus never arrived.
        
#5.5.2 Exercises
#2. Compare air_time with arr_time - dep_time. What do you expect to see? What do you see? What do you need to do to fix it?
        #The results for arr_time - dep_time are not the same as the air_time, are significantly larger in fact. 
        #We would have to account for the time the plane spent taxiing before take off and after landing.
        
#3. What time of day should you fly if you want to avoid delays as much as possible?
        flights %>% 
          select(hour, dep_delay) %>% 
          group_by(hour) %>% 
          summarise(mean = mean(dep_delay, na.rm = TRUE)) %>% 
          arrange(mean)
        #5 am seems to be the time where there are the least departure delays
        #Though, the 1am flight was canceled so we can can't be sure.
