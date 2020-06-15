#Labs

#Intro to Statistical Learning
#Lab 3.6.2 Linear Regression

install.packages("ISLR")
library(MASS)
library(ISLR)

#Explore data set
names(Boston)
#help ?Boston

#lstat = % of households w low income

#lm(y~x,data) linear regression

lm.fit=lm(medv ∼ lstat , data=Boston)
summary(lm.fit)

#lm.fit=lm(medv∼lstat)
#attach(Boston)

names(lm.fit)
coef(lm.fit) #extract coefficient

confint() #confidence interval

predict (lm.fit ,data.frame(lstat=c(5,10 ,15)),
         interval ="confidence ") #states predicted value + confidence interval
predict (lm.fit ,data.frame(lstat=c(5,10 ,15)),
         interval ="prediction ") #states predicted value + prediction interval

plot(lstat ,medv) #plots

aabline(lm.fit) #makes a line from the regression abline(a,b)
abline (lm.fit ,lwd=3,col ="red") #lwd line width/stroke width

par(mfrow=c(2,2)) #divides data into panels for error terms
plot(lm.fit)

plot(predict (lm.fit), residuals (lm.fit)) #plot residuals against predicted values
plot(predict (lm.fit), rstudent (lm.fit)) #??

plot(hatvalues (lm.fit)) # Leverage values

#which.max() prints out max values
which.max(hatvalues (lm.fit)) 
#^ the observation has the largest leverage statistic


#ISRS
#Recreating table and plot in exercise 5.29
library(tidyverse)
body_data <- read.table("body.dat.txt", header = FALSE)
select(body_data, V23, V24) -> body_data
names(body_data) <- gsub('V23', 'weight', names(body_data))
names(body_data) <- gsub('V24', 'height', names(body_data))

model_weight_height = lm(weight ~ height, body_data)
summary(model_weight_height)
#coef(model_weight_height)
#model_weight_height$coefficients

body_data %>% group_by(height, weight) %>% summarise(count=n()) %>% ggplot(aes(x=height, y=weight, alpha = count)) + geom_point(color = "blue")
body_data %>% group_by(height, weight) %>% summarise(count=n()) %>% ggplot(aes(x=height, y=weight)) + geom_point(alpha = .3, color = "blue")

#recreating table and plot in exercises 6.1, 6.2, 6.3
#6.1

  baby_data <- read.table("babyweights.txt", header = T)
  model_baby = lm(weight ~ smoke, baby_data)
  summary(model_baby)

  #(a) Write the equation of the regression line.
  
      #yhat = 123.05 -8.94(smoke)

  #(b) Interpret the slope in this context, and calculate the predicted birth weight of babies born to
  #  smoker and non-smoker mothers.
  
      #If the mother is a non-smoker, the baby is predicted to weigh 123.05 oz.
      #If the mother is a smoker, the baby is predicted to weigh 8.94 less that a baby
      #who's mother is a non smoker. 

  #(c) Is there a statistically significant relationship between the average birth weight and smoking?
  
      #pvalue = 0.000 < 0.05
      #Yes, the pvalue is less than 0.05
  
#6.2
  #Another variable we consider is parity, which is 0 if the child is the first born, and 1 otherwise.
  #The summary table below shows the results of a linear regression model for predicting the average
  #birth weight of babies, measured in ounces, from parity.
  
  model_parity = lm(weight ~ parity, baby_data)
  summary(model_parity)
  
  #(a) Write the equation of the regression line.
  
      #weight = 129.7390 - 4.2953*(parity)
  
  #(b) Interpret the slope in this context, and calculate the predicted birth weight of first borns and
  #    others.
  
      #If the baby is the first born, the predicted weight would be 129.73 ounces.
      #If the baby is not the first born, it is predicted that they would weigh 4.29 oz less than a first born child.
  
  #(c) Is there a statistically significant relationship between the average birth weight and parity?
  
      #From my regression the pvalue is 0.00185 < 0.05 which would be statistically significant.
      #The book example pvalue is 0.1052 > 0.05 which would not be statistically significant. 
      #In that case, we cannot reject the possibility that there is no effect of parity on the weight of newborns.
  
  

  
  
  
  
  
  