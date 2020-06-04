library(tidyverse)

#dataset
mpg <- ggplot2::mpg

#Chapter 3
#3.3.1 Exercises
  #1. What’s gone wrong with this code? Why are the points not blue?
    #ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
    
      ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
      #color should be outside the aes() function.
      
  #2. Which variables in mpg are categorical? Which variables are continuous? (Hint: type ?mpg to read the documentation for the dataset). How can you see this information when you run mpg?
      
      summary(mpg)
      #manufacturer, model, trans, fl, class, drv 
      
  #3. Map a continuous variable to color, size, and shape. How do these aesthetics behave differently for categorical vs. continuous variables?

      ggplot(mpg, aes(displ,hwy, color = trans)) + geom_point()
      ggplot(mpg, aes(displ,hwy, size = trans)) + geom_point()
      ggplot(mpg, aes(displ,hwy, shape = trans)) + geom_point()
      
      #for size, it is kind of arbitrary what gets the big v. little circles.
      #for color, you get a key. and it seems to be the most clear way of showing whats going on
      #for shape, you are limited to 6 categories.
      
#3.5.1 Exercises
  #1.What happens if you facet on a continuous variable?
      
      ggplot(mpg, aes(displ,hwy, color = model)) + geom_point() + facet_wrap(~cty)
      #you get a bunch of separate graphs from the minimum to the maximum of the variable
      
  #4.Take the first faceted plot in this section:
  #  ggplot(data = mpg) + 
  #    geom_point(mapping = aes(x = displ, y = hwy)) + 
  #    facet_wrap(~ class, nrow = 2)
  # What are the advantages to using faceting instead of the colour aesthetic? 
  # What are the disadvantages? 
  # How might the balance change if you had a larger dataset?
      
      #Advantage: you see much more clearly what is going on in the data when looking at each class
      #disadvantage: its harder to directly compare two classes. Say you wanted to know what classes have exactly 20 or less hwy.
      #you'd have to follow that line across 7 different graphs to know.
      #If you had a larger dataset with more classes, no one wants to look through 20 different graphs. 
        
      
#3.6.1 Exercises
    #5.Will these two graphs look different? Why/why not?
      
      ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
        geom_point() + 
        geom_smooth()
      
      ggplot() + 
        geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
        geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
      
      #They look the same.
      #In the first, the aes is set at global for the whole graph.
      #In the second, the aes is set to local but they haven't changed for either layer.
      #Thus you get the same result. If the smooth layer had been different from the point layer,
      # then you would have gotten a different graph from the first.
    
    #6.Recreate the R code necessary to generate the following graphs.
      
      #a.
      ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
        geom_point() + 
        geom_smooth(se=FALSE)
      
      #b.
      ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
        geom_point() + 
        geom_smooth(data = filter(mpg, drv==4), se=FALSE) + 
        geom_smooth(data = filter(mpg, drv=="f"),se=FALSE) +
        geom_smooth(data = filter(mpg, drv=="r"), se=FALSE)
      
      #c.
      ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color=drv)) + 
        geom_point() + 
        geom_smooth(data = filter(mpg, drv==4), se=FALSE) + 
        geom_smooth(data = filter(mpg, drv=="f"),se=FALSE) +
        geom_smooth(data = filter(mpg, drv=="r"), se=FALSE)
      
      ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color=drv)) + 
        geom_point() + 
        geom_smooth(se=FALSE)
      
      #d.
      ggplot() + 
        geom_point(data = mpg, mapping = aes(x = displ, y = hwy, color=drv)) + 
        geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy), se=FALSE)
      
      #e.
      ggplot() + 
        geom_point(data = mpg, mapping = aes(x = displ, y = hwy, color=drv)) + 
        geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy, linetype = drv), se=FALSE)
      
      #f.
      ggplot(mpg, aes(x = displ, y = hwy)) + 
        geom_point(size = 4, color = "white") + 
        geom_point(aes(colour = drv))
      
#3.8.1 Exercises
  #1. What is the problem with this plot? How could you improve it?
      ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
        geom_point()   
      
      #It's hard to tell where most of the data lies when so many points overlap
      #Adding "jitter" gives a much more meaningful graph
      
      ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
        geom_point(position = "jitter")
      
  #2. What parameters to geom_jitter() control the amount of jittering?
      
      #width and height parameters. By default they are set to "40% of the resolution of the data"
      
      
      
      