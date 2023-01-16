
#Problem 1
#Background:
#A stochastic model for a car insurance company's total cost of damages from traffic accidents goes back to the work by Van der Lann and Louter, "A statistical model for the costs of passenger car traffic accidents", Journal of the Royal Statistical Society (1986).
# For every $k=1,2,3\ldots$ we denote by the random variable $X_k$ the US dollar amount of a damage from a policy holder's traffic accident which will occur during the year 2020.
# We assume that $X_1$, $X_2$,... is an i.i.d. sequence of exponential distributed random variables with an average claim size of \$1,500 USD.
# The (random) total number of accidents $N$ in 2020 is expected to be Poisson distributed with 25 claims on average.
# It is assumed that the number of accidents is independent of the US dollar amount of damages for each accident. That is, the random variable $N$ is independent of the random variables $X_1$, $X_2$,...
# The total costs for the insurance company by the end of 2020 will thus be given by the __random sum__ $S_N$ defined as
# $$S_N = X_1 + X_2 + \dots + X_N = \sum_{k = 1}^{N} X_k.$$
# Note again that the total number $N$ of accidents is random
# The goal of the current exercise is to approximate the expected total costs $$\mathbb{E}[S_N]$$ for the insurance company in 2020 via simulations.
# As usual, we start with loading some packages:

import numpy as np

def randomSum(averageClaimSize, averageNumberOfClaims):
    #randomTotalNumber is a random poisson distribution, N
    randomTotalNumber=np.random.poisson(averageNumberOfClaims,size=1)
    randomTotalNumber=int(randomTotalNumber)
    
    sampleRandomSum=0
    for i in range(randomTotalNumber):
        sampleRandomSum=sampleRandomSum+np.random.exponential(averageClaimSize,size=1)
        
    return sampleRandomSum

## TEST YOUR FUNCTION HERE
randomSum(1500,25)

def simulator(averageClaimSize, averageNumberOfClaims, M):
    #create an array with length M and filled with zeros
    samples=np.zeros(M)
    for i in range(M):
        samples[i]=randomSum(averageClaimSize, averageNumberOfClaims)
    
    
    return samples

## TEST YOUR FUNCTION HERE
simulator(1500,25,10)

def MCsimulation(averageClaimSize, averageNumberOfClaims, M): # 2 points

    new_samples=simulator(averageClaimSize, averageNumberOfClaims, M)
    empiricalMean=np.sum(new_samples)/M
     
    return empiricalMean


## TEST YOUR FUNCTION HERE
MCsimulation(1500, 25, 1)

## Compute the absolute error
print(np.absolute(MCsimulation(1500, 25, 10)-37500))
print(np.absolute(MCsimulation(1500, 25, 100)-37500))
print(np.absolute(MCsimulation(1500, 25, 1000)-37500))
print(np.absolute(MCsimulation(1500, 25, 10000)-37500))
print(np.absolute(MCsimulation(1500, 25, 50000)-37500))


# ## Problem2
# 
# A health insurance will pay for a medical expense subject to a USD 100 deductible. Assume that the amount of the expense is __Gamma__ distributed with scale parameter 100 and shape parameter 2 (the mean is 100*2 dollars). This can be simulated using np.random.gamma(shape, scale, n)
# 
# Compute the empirical _mean_ and empirical _standard deviation_ of the payout by the insurance company by using 100,000 samples.

medicalTotalExpense=np.random.gamma(2,100,100000)

insuranceExpense=np.zeros(100000)

for i in range(100000):
    if medicalTotalExpense[i] > 100:
        insuranceExpense[i]=medicalTotalExpense[i]-100
        
empirical_mean=np.sum(insuranceExpense)/100000

partVariance=np.zeros(100000)
for i in range(100000):
    partVariance[i] = (insuranceExpense[i]-empirical_mean)**2

empirical_variance=np.sum(partVariance)/(100000-1)
empirical_sd=np.sqrt(empirical_variance)

print(empirical_mean)
print(empirical_sd)

# ## Problem 3
# 
# Since the beginning of Spring quarter Mike goes every day to Woodstock Pizza, orders a slice of pizza, and picks a topping - pepper, pepperoni, pineapple, or prosciutto - unifromly at random. 

# 1. Implement a simulator which uniformly samples from one topping:
topping=np.random.uniform(0,4,size=1)
if topping>=0 and topping<1:
    print("pepper")
elif topping>=1 and topping<2:
    print("pepperoni")
elif topping>=2 and topping<3:
    print("pineapple")
elif topping>=3 and topping<4:
    print("prosciutto")
 
# 2. On the day that Mike first picks pineapple, find the empricial _mean_ and empirical _standard deviation_ of the number of prior days in which he picked pepperoni by running 100,000 simulations. [As you might realize, this is very similar to the question about rolling 5's before the first '6' appears that we did in class -- now we solve it/verify the answer by simulation]
numberDay=np.zeros(100000)
sumOfDay=0
mean=0
#for loops: 100,000 simulation
for i in range(100000):
    topping=np.random.uniform(0,4,size=1)
    while topping<2 or topping>=3:#while Mike does not pick pineapple
        if topping>=1 and topping<2:#if Mike picks pepperoni
            numberDay[i]=numberDay[i]+1
        topping=np.random.uniform(0,4,size=1)
    sumOfDay=sumOfDay+numberDay[i]

#mean
mean=sumOfDay/100000
print(mean)

#variance&sd
partVariance=np.zeros(100000)
for i in range(100000):
    partVariance[i]=(numberDay[i]-mean)**2
variance=np.sum(partVariance)/(100000-1)
sd=np.sqrt(variance)
print(sd)
