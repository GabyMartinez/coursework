#!/bin/bash
#
# add your solution after each of the 10 comments below
#

echo count the number of unique stations
    cut -d, -f5 201402-citibike-tripdata.csv | sort | uniq | wc -l    

    #330
    #subtract 1 because it counts the header as a unique "station" 
    #329

echo count the number of unique bikes
    cut -d, -f12 201402-citibike-tripdata.csv | sort | uniq | wc -l

    #5700
    #based on bikeID

echo count the number of trips per day
    cut -d, -f2 201402-citibike-tripdata.csv | sort | cut -c -11 | uniq -c


echo find the day with the most rides
    cut -d, -f2 201402-citibike-tripdata.csv | sort | cut -c -11 | uniq -c | sort
    
    #13816 2014-02-02
    
echo find the day with the fewest rides
    cut -d, -f2 201402-citibike-tripdata.csv | sort | cut -c -11 | uniq -c | sort

    # 876 2014-02-13

echo find the id of the bike with the most rides
    cut -d, -f12 201402-citibike-tripdata.csv | sort | uniq -c |sort

   # 130 "20837"    

echo count the number of rides by gender and birth year
    cut -d, -f14-15 201402-citibike-tripdata.csv | sort | uniq -c

echo count the number of trips that start on cross streets that both contain numbers (e.g., "1 Ave & E 15 St", "E 39 St & 2 Ave", ...)
    cut -d, -f5 201402-citibike-tripdata.csv | grep '[0-9].* & .*[0-9]' | sort | uniq -c | awk '{s+=$1}END{print s}'
    
    #90549

echo compute the average trip duration
    cut -d, -f1 201402-citibike-tripdata.csv | tr -d '"' | awk '{s+=$1}END{print s/224736}'

    #874.52


