library(tinyverse)

#Chapter 4

#4.1
#1. what is the value of p?
    # the sum of all probabilities over the entire sample = 1
    # 1 = p + 2p + 3p + 4p + 5p + 6p = 21p
    # 1 = 21p
    # 1/21 = p

#2. P(Y<3) = P(Y = 2) + P(Y=1) + P(Y=0)
    #      = 3(1/21) + 2(1/21) + 1/21
    #      = 6/21

#3. P(Y = odd) = P(Y=1) + P(Y=3) + P(Y=5)
    #          = 2(1/21) + 4(1/21) + 6(1/21)
    #          = 12/21

#4. P(1 =< Y < 4) = P(Y=1) + P(Y=2) + P(Y=3)
    #             = 2(1/21) + 3(1/21) + 4(1/21)
    #             = 9/21

#5. P(|Y-3|<1.5)
    # 0: 3<1.5
    # 1: 2<1.5
    # 2: 1<1.5 T
    # 3: 0<1.5 T
    # 4: 1<1.5 T
    # 5: 2<1.5

    # = P(Y=2) + P(Y=3) + P(Y=4)
    # = 3(1/21) + 4(1/21) + 5(1/21) = 12/21

#6. E(Y) = SUM(value * probability)
    Y.val <- c(0,1,2,3,4,5)     #set of Y values
    P.val <- c(1,2,3,4,5,6)/21  #set of probability for Y
    E <- sum(Y.val*P.val)       #Expected value
    E

#7. VAR(Y) = SUM((Y - E(Y))^2 * P(Y))
    Var <- sum((Y.val-E)^2*P.val)

#8. SD(Y) = sqrt(VAR(Y))
    SD <- sqrt(Var)


#4.2
#One invests $2 to participate in a game of chance. 
#In this game a coin is tossed three times. 
#If all tosses end up Heads then the player wins
#$10. Otherwise, the player losses the investment.

#1. What is the probability of winning the game?
    # 8 combinations of 3 flips
    # HHH, THH, HTH, TTH, HHT, THT, HTT, TTT
    # only 1 combiniation is a winning combitation
    # 1/8 = p(winning)

#2. What is the probability of loosing the game?
    # 1- 1/8 = 7/8

#3. What is the expected gain for the player that plays this game? (Notice
#   that the expectation can obtain a negative value.)
    # spends 2 to win 10 = gain of $8
    # x * p(x) = E(x)
    # $8 * 1/8 = E(winning) = 1

    #spends 2 and wins nothing if looses = loss of -$2
    #-$2 * 7/8 = 1.75 = E(losing)

    #1 - 1.75 = -.75

#Chapter 6
#6.1
# 8 people, SD(8) = 57kg, mean(8) = 560kg
# 9 ppl , SD(9) = 61kg, mean(9) = 630kg

#1. P(x>650kg) given 8 ppl
    #pnorm(650) = p(x<=650)
    #1-p(x<=650) = p(x>650)
    1 - pnorm(650,560,57) 

#2. P(x>650kg) given 9ppl
    # pnorm(compare, mean, sd)
    1 - pnorm(650, 630, 61)

#3. What is the central region that contains 80% of distribution of the total weight of 8 people?
    #interval from 10% percentile to 90% percentile
    # qnorm(%, mean, sd)
    qnorm(0.1,560,57)
    #^ 10% to the left
    qnorm(0.9,560,57)
    #^ 90% to the left

#4. What is the central region that contains 80% of distribution of the total weight of 9 people?
    #interval from 10% percentile to 90% percentile
    # qnorm(%, mean, sd)
    qnorm(.1, 630, 61)
    qnorm(.9, 630, 61)


#Chapter 7
#7.1

pop.2 <- read.csv("pop2.csv")

#1. Compute the population average of the variable bmi.

    #mean(df$col)
    mean(pop.2$bmi)
    select(pop.2,bmi) %>% summarize(mean(bmi))

#2. Compute the population standard deviation of the variable bmi.
    
    sd(pop.2$bmi)

#3. Compute the expectation of the sampling distribution for the sample average of the variable.
    
    #take a sample n=150
    X.bar <- rep(0,10^5)
    for(i in 1:10^5){ #repeat 10^5 = 1mil
        X.samp <- sample(pop.2$bmi,150) #x.samp = sample
        X.bar[i] <- mean(X.samp) #x.bar = mean for each sample taken
    }
    mean(X.bar) #mean of all sample means

#4. Compute the standard deviation of the sampling distribution for the sample average of the variable.
    
    #standard error = standard deviation/sqrt(n)
    #we have a sample distribution so just take the sd of that
    
    sd(X.bar)
    

#5. Identify, using simulations, the central region that contains 80% of the
#   sampling distribution of the sample average.
    
    quantile(X.bar,c(0.1,0.9)) #use on a sample
    #10%      90% 
    #24.54491 25.42006 

#6. Identify, using the Central Limit Theorem, an approximation of the central region that contains 80% of the sampling distribution of the sample
#   average.
    #use qnorm for use on a normal distribution
    qnorm(.9, 24.98281, 0.341563) #25.42054
    qnorm(.1, 24.98281, 0.341563) #24.54508
    #see that the numbers are slightly different
    

#Chapter 9
#9.1

#1. What is the sample average of the change in score between the patient’s
#   rating before the application of the device and the rating after the application?
    summary(magnets)
#   change is the difference b/ the patient's rating

#2. Is the variable “active” a factor or a numeric variable?
    summary(magnets)
    #active
    #"1":29
    #"2":21

#3. Compute the average value of the variable “change” for the patients that
#   received and active magnet and average value for those that received an
#   inactive placebo.
    mean(magnets$change[1:29])
    mean(magnets$change[30:50])
    #mean(df$col[interval])

#4. Compute the sample standard deviation of the variable “change” for the
#   patients that received and active magnet and the sample standard deviation for those that received an inactive placebo.
    sd(magnets$change[1:29])
    #ditto from the mean question
    #sd() = standard devation

#5. Produce a boxplot of the variable “change” for the patients that received
#   and active magnet and for patients that received an inactive placebo.
#   What is the number of outliers in each subsequence?
    boxplot(magnets$change[1:29]) #<- would this be a geom
    boxplot(magnets$change[30:50])

#    ggplot(magnets) + geom_boxplot() <- would have to filter first I think


#Chapter 10
#10.1
#The goal of this exercise is to repeat the analysis, but this time compare the average to the
#median as estimators of the expectation in symmetric distributions.
    #1. Simulate the sampling distribution of average and the median of a sample
    #   of size n = 100 from the Normal(3, 2) distribution. Compute the expectation and the variance of the sample average and of the sample median.
    #   Which of the two estimators has a smaller mean square error?
    
    mu = 3
    sd = sqrt(2)
    x.bar <- rep(0,10^5)
    x.med <- rep(0,10^5)
    
    for(i in 1:10^5)
        {
            X <- rnorm(100,mu,sd)
            x.bar[i] <- mean(X)
            x.med[i] <- median(X)
    }
    mean(x.bar) #2.999497
    median(x.med) #2.999149
    #minimize var
    var(x.bar) #0.01991833 <- mean is closest to mu
    var(x.med) #0.0308587
    
    
    


  