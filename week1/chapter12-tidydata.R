#12.2.1 Exercises
  #2. Compute the rate for table2, and table4a + table4b. You will need to perform four operations:
      #a. table2

        select(table2a, -type) %>% 
          inner_join(select(table2b, -type), by=c("country", "year")) -> table2c
        table2c %>% mutate(rate= (count.x / count.y)*1000)

      #b. table4a , table4b
        full_join(table4a, table4b, by=c("country")) -> table4
        names(table4) <- gsub('2000.x', '2000_cases', names(table4))
        names(table4) <- gsub('2000.y', '2000_pop', names(table4))
        names(table4) <- gsub('1999.y', '1999_pop', names(table4))
        table4 <- mutate(table4, rate1999 = (`1999_cases`/`1999_pop`)*1000)
        table4 <- mutate(table4, rate2000 = (`2000_cases`/`2000_pop`)*1000)

#12.3.3 Exercises
  #1. Why are pivot_longer() and pivot_wider() not perfectly symmetrical?
    # Carefully consider the following example:

      stocks <- tibble(
        year   = c(2015, 2015, 2016, 2016),
        half  = c(   1,    2,     1,    2),
        return = c(1.88, 0.59, 0.92, 0.17)
      )
      stocks %>% 
        pivot_wider(names_from = year, values_from = return) %>% 
        pivot_longer(`2015`:`2016`, names_to = "year", values_to = "return")

     # So the year column is a char now and when u pivot_wider, half becomes the leftmost column.
      
  #3.    
      people <- tribble(
        ~name,             ~names,  ~values,
        #-----------------|--------|------
        "Phillip Woods",   "age",       45,
        "Phillip Woods",   "height",   186,
        "Phillip Woods",   "age",       50,
        "Jessica Cordero", "age",       37,
        "Jessica Cordero", "height",   156
      )

      group_by(people, names, name) %>% mutate(num = 1:n()) -> people1
      people1 %>% pivot_wider(names_from = names, values_from = values)
