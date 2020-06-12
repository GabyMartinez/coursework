# Intro to Stat with Randomization and Simulation (ISRS) 
#Day 3 - week 2
#   Chapter 2
#   exercises 2.2 and 2.5

# 99%, extends −2.58 to 2.58 zcrit
# 95%, extends −1.96 to 1.96 zcrit
# Z = (phat-p0)/se

#2.2 
#   (a) Since more patients on pioglitazone had cardiovascular problems (5,386 vs. 2,593), we can
#   conclude that the rate of cardiovascular problems for those on a pioglitazone treatment is
#   higher.

    #FALSE
    (2593/67593)*100    # Rosiglitazone = 3.836196% <- higher percent/rate of cardio problems
    (5386/159978)*100   # Pioglitazone = 3.366713%
    
    
#   (b) The data suggest that diabetic patients who are taking rosiglitazone are more likely to have
#   cardiovascular problems since the rate of incidence was (2,593 / 67,593 = 0.038) 3.8% for
#   patients on this treatment, while it was only (5,386 / 159,978 = 0.034) 3.4% for patients on
#   pioglitazone.
    
    #Perhaps. It doesn't say anything conclusive yet. Fistly, the dataset for the rosiglitazone trials
    #are quite a bit smaller than the pioglitazone trials. We can't rule that out of the anaylsis. 
    #Also, 3.4% and 3.8% are close, it maybe the case that this trial shows a difference in the effect of the drugs
    #that would not normally be there. We'd have to perform a hypothesis test to be sure.
    
#   (c) The fact that the rate of incidence is higher for the rosiglitazone group proves that rosiglitazone
#   causes serious cardiovascular problems.   
    #False
    #It doesn't *prove* anything. For the rosiglitazone group, patients in this trial are more likely to
    #have cardio problems than the pioglitazone group but that could be for any number of other reasons. The
    #effect of rosiglitazone has yet to be tested - at least, it can't be determined from the table.
    
#   (d) Based on the information provided so far, we cannot tell if the difference between the rates of
#   incidences is due to a relationship between the two variables or due to chance.
    #TRUE, you need a hypothesis test in order to know that
    
#2.5
    #(a) What are the hypotheses? For the purposes of this exercise, you may assume that each
    #observed person at the restaurant behaved independently, though we would want to evaluate
    #this assumption more rigorously if we were reporting these results.
    
    # H0: The difference seen between the rates of interference for the two scenarios is from chance alone
    # HA: The difference seen between the rates of interference for the two scenarios is nor from chance alone,
    #     rather there is some bias in the choice to interfer or not.
    
    #(b) Calculate the observed difference between the rates of intervention under the provocative and
    #conservative scenarios: ^ppr ??? p^con.
    
    ppr = (5/20)*100 #25%
    pcon = (15/25)*100 #60%
    ppr-pcon #-35% or |-35| = 35% difference
    
    #(c) Estimate the p-value using the figure above and determine the conclusion of the hypothesis
    #test.
    #Assuming the y value of the chart is the pvalue, given that -.35 lies at the far end of the chart,
    #far under the .05, the sum of everything left of that point would still be less than .05. 
    #Thus, because the p-value is less than 0.05 (alpha), we reject the notion that the differences we see
    #are due to chance alone. There is likely some bias going on in people's decision to intervene or not.
    
    
#Day 4 - week 2
#Chapter 5
#exercises 5.20 and 5.29

#5.20
#The mean shoulder girth is 108.20 cm with a standard deviation
#of 10.37 cm. The mean height is 171.14 cm with a standard deviation of 9.41 cm.
#The correlation between height and shoulder girth is 0.67.

    #(a) Write the equation of the regression line for predicting height.
            #height = b0 + b1(shoulder)
            
            xbar = 108.2 #shoulders
            sdx = 10.37
            
            ybar = 171.14 #height
            sdy = 9.41
            R = 0.67

            b1 = (sdy/sdx)*R #0.6079749
            b0 = ybar - (b1*xbar) #105.3571

            #yhat = 105.3571 + 0.6079x
            
    #(b) Interpret the slope and the intercept in this context.
            
            #When the shoulder girth is 0, the minimum predicted height is about 105cm.
            #For every additional cm of shoulder girth, the predicted height increases by about .61cm.

    #(c) Calculate R2 of the regression line for predicting height from shoulder girth, and interpret it
    #    in the context of the application.
            
            R^2 #0.4489

    #(d) A randomly selected student from your class has a shoulder girth of 100 cm. Predict the height
    #    of this student using the model.
            
            yhat = 105.3571 + (0.6079*100)
            #166.1471

    #(e) The student from part (d) is 160 cm tall. Calculate the residual, and explain what this residual means.
            
            160 - yhat #= -6.1471
            
            #at this point, the predicted outcome is off by approx. 6cm. 
            #The point would sit 6 units below the line.

    #(f) A one year old has a shoulder girth of 56 cm. Would it be appropriate to use this linear model
    #    to predict the height of this child?
            
            yhat = 105.3571 + (0.6079*56) #= 139.3995 = 4ft5
        
            #given that the model says that a new born would be 105 cm in height and a 1yr old would be 139cm
            #or 4ft 5in, this model would not be appropriate to predicting the height of a 1yr old.
            
#5.9

    #(a) Describe the relationship between height and weight.

        #A linear relationshhip, positively trending

    #(b) Write the equation of the regression line. Interpret the slope and intercept in context.

        #yhat = -105.0113 + 1.0176(height)
        #For every extra cm of height gained, 1.0176 kg is predicted to be gained in weight.
        #when the height is 0, a person's weight is -105.0113
        
    #(c) Do the data provide strong evidence that an increase in height is associated with an increase
    #    in weight? State the null and alternative hypotheses, report the p-value, and state your
    #    conclusion.

        #pvalue = 0.00
        #H0: The height has not effect on the weight of a person
        #HA: The height does have an effect on the weight of a person

        #pvalue < 0.05, reject H0

    #(d) The correlation coefficient for height and weight is 0.72. Calculate R2 and interpret it in
    #    context.
        R = .72
        R^2 # = 0.5184
    
            
            
    