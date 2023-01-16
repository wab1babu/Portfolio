# Problem 1

# Simulate $N=10^5$ realizations of the respective Markov Chain where the rat begins in room $1$ and wonders around the maze until finding the way out from room 4. Each Markov chain trajectory should be simulated until the rate escapes (so you do not actually have to run it for many steps).
# Let us suppose that the rooms contain snacks and the rat gets $k$ snacks each time when in room $k$. So for example every time (including at the very beginning) that the rat is in room 1, it gets 1 snack. We want to compute the total number of snacks it will get on average before getting out of the maze.
# Use Monte Carlo to estimate the mean and variance of the total snacks the rat will get based on the above $10^5$ simulated trajectories.

import numpy as np
from numpy import linalg 
import scipy.linalg

# We assume get-out state is 5. Thus S={1,2,3,4,5}, and the according P is:
p=np.array([[0,0.5,0.5,0,0],[0.5,0,0,0.5,0],[0.5,0,0,0.5,0],[0,1/3,1/3,0,1/3],[0,0,0,0,1]])
print(p)

initState = 1
np.random.seed(160)
totalSnacks= []

for i in range(10**5):
    index=np.random.choice(range(1,6),1,p=p[0])
    tS=1
    while (index[0]!=5):
        tS=tS+(index[0])
        index=np.random.choice(range(1,6),1,p=p[index[0]-1])
        # we have to minus 1 for p[] since for example the probability distribution to go from room 1 is p[0]
    totalSnacks.append(tS)

# Finally estimate the mean and variance of totalSnack
print("the estimated mean of totalSnack is ",np.mean(totalSnacks))
print("the estimated variance of totalSnack is ",np.var(totalSnacks))


# Problem 2
# 
# You start with five dice. Roll all the dice and put aside those dice that come up 6. Then, roll the remaining dice, putting aside those dice that come up 6. And so on, until no dice are left.
# Using $10^5$ experiments, estimate the probability that it will take *more than 10 rounds* to end this game.

N = 10**5
track=[]
prob=[1/6,1/6,1/6,1/6,1/6,1/6]

#Roll() is the function that we roll and clear all sixes.
def Roll(n):
    count=0
    for i in range(n):
        dieRoll=1+np.random.choice(a = range(6))
        if (dieRoll!=6):
            count=count+1
    return count

for i in range (N):
    x=5
    for i in range (10):
        if (x!=0):
            x=Roll(x)
    #we run Roll() 10 times to see whether there are any remaining dice
    if (x>0):
        track.append(1)
    else:
        track.append(0)
# print the probability that it will take more than 10 rounds to end this game.
print (np.mean(track))
