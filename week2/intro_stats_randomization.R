# Intro to Stat with Randomization and Simulation (ISRS) 
# Chapter 2
#exercises 2.2 and 2.5

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
    
    
    