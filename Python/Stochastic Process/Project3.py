# __Background:__ explore some path properties of the simple symmetric random walk.

import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import arcsine

# ## Problem 1
def randomWalk(lengthOfRandomWalk):
    samplePath=np.zeros(lengthOfRandomWalk+1)
    randomWalk=np.random.choice([-1,1], lengthOfRandomWalk)
    
    for i in range(lengthOfRandomWalk):
        samplePath[i+1]=samplePath[i]+randomWalk[i]
    return samplePath

## TEST YOUR FUNCTION HERE
print(randomWalk(50))
# 2. Plot the trajectory of the random walk you simulated in 1.)
plt.figure(figsize=(10,5))
plt.plot(randomWalk(50))
plt.xlabel("rounds")
plt.ylabel("capital")
plt.title("trajectory of the random walk")
plt.show()

#Problem 2
def TimeOfLastVisitOfZero(path):
    result=np.where(path==0)
    lastVisit=np.max(result)
        
    return lastVisit  

## TEST YOUR FUNCTION HERE
path = randomWalk(20)
print(path)
TimeOfLastVisitOfZero(path)

## A PLOT OF THE ARCSINE DENSITY
x = np.linspace(arcsine.ppf(0.05), arcsine.ppf(0.95), 100)
plt.title("Density of the arcsine distribution")
plt.plot(x, arcsine.pdf(x), linewidth=2, color='b')
plt.show()

# COMPLETE/MODIFY THE PLOT COMMANDS ACCORDINGLY
N = 250
M = 10000

def sampleLastVisit(N,M):
    LastVisit=np.zeros(M)
    for i in range(M):
        LastVisit[i]=TimeOfLastVisitOfZero(randomWalk(2*N))
    return LastVisit
        
c= sampleLastVisit(N,M)
# This has to be replaced by the simulated values for L_2N !!!

plt.figure(figsize=(10,5))
plt.title("Normalized histogram for 10000 realisations of $L_{500}$")
plt.hist(c, bins='auto', density='True')
plt.show()

# Problem3
def timeHitMax(randomWalk):
    
    result=np.argmax(randomWalk)

    return result 

## TEST YOUR FUNCTION HERE
path = randomWalk(20)
print(path)
timeHitMax(path)

# COMPLETE/MODIFY THE PLOT COMMANDS ACCORDINGLY
N = 250
M = 10000

def sampleMaxTime(N,M):
    maxTime=np.zeros(M)
    for i in range(M):
        maxTime[i]=timeHitMax(randomWalk(2*N))
    return maxTime
        
c= sampleMaxTime(N,M)
# This has to be replaced by the simulated values for M_2N !!!

plt.figure(figsize=(10,5))
plt.title("Normalized histogram for 10000 realisations of $M_{500}$")
plt.hist(c, bins='auto', density='True')
plt.show()
