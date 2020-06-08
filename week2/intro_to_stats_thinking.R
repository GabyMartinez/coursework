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
#If all tosses end up “Head” then the player wins
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
    1 - pnorm(650,560,57)

#2. P(x>650kg) given 9ppl
    # pnorm(compare, mean, sd)
    1 - pnorm(650, 630, 61)

#3. What is the central region that contains 80% of distribution of the total weight of 8 people?
    #interval from 10% percentile to 90% percentile
    # qnorm(%, mean, sd)
    qnorm(0.1,560,57)
    qnorm(0.9,560,57)

#4. What is the central region that contains 80% of distribution of the total weight of 9 people?
    #interval from 10% percentile to 90% percentile
    # qnorm(%, mean, sd)
    qnorm(.1, 630, 61)
    qnorm(.9, 630, 61)


