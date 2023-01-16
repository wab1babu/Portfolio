# __Background:__ Markov chains could be used to model a plethora of phenomena that happen in our world. The only assumption that we would have to accept is the fact that what we are trying to model depends only on the last step, and not on all previous steps (the whole history).

import numpy as np 
from numpy import linalg 
import scipy.linalg
import matplotlib.pyplot as plt


P=np.array([[0.756,0.113,0.129,0.002,0,0,0],
            [0.174,0.821,0.004,0.001,0,0,0],
            [0.141,0.001,0.776,0.082,0,0,0],
            [0.003,0,0.192,0.753,0.052,0,0],
            [0,0,0.002,0.227,0.735,0.036,0],
            [0,0,0,0.007,0.367,0.604,0.022],
            [0,0,0,0,0.053,0.158,0.789]])
#Getting the eigenvectors and eigenvalues
eigenval,eigenvec = scipy.linalg.eig(P.T)
#Getting the unnormalized stationary distribution
temp = eigenvec[:,np.isclose(eigenval, 1)][:,0]
#normalizing it
pi = (temp/temp.sum()).real
print(pi)

#USE scipy.linalg.eig(..) AND CHECK THE DOCUMENTATION
[eigenval,eigenvect] = linalg.eig(np.transpose(P))
print(eigenval)
print(eigenvect)

# When wind speed is greater than 30 M/Hr, the state is greater than 3, so 4, 5, or 6.
totalSum=0
for i in range(4,7):
    totalSum=totalSum+pi[i]
totalSum


# 2
initState = 0

N = 10**5
returnTime = []
rT=0

for i in range(N):
    #For each realization, since we know X0=0 for always, so we can simply start the simulation from X1 and setting rT to start from 1
    #since it at least takes 1 step to finish the realization (from X0=0 to X1=0)
    state=np.random.choice(range(7),1,p=P[initState])
    probability=P[state[0]]
    rT=1
    while (state[0]!=0):
        state=np.random.choice(range(7),1,p=probability)
        probability=P[state[0]]
        rT=rT+1 
    returnTime.append(rT)


# Finally estimate the mean of returnTime
print(np.mean(returnTime))
print(1/pi[0])


# Problem 2

# By observing P, we find out that {3} and {4} are closed communication groups, which means once the state enters 3 or 4,
# it will foreverly be 3 or 4. What is more, {1,2,3} is an open coomunication group with all transient states. Thus, when 
# n approaches to infinity in the long run, Xn would be either 3 or 4, and E0 has a finite mean since 0 is a transient state.

P2=np.array([[0.2,0.6,0,0,0.2],
             [0.4,0,0.4,0,0.2],
             [0,0.7,0.2,0.1,0],
             [0,0,0,1,0],
             [0,0,0,0,1]])
print(np.linalg.matrix_power(P2,10))
print(np.linalg.matrix_power(P2,25))
print(np.linalg.matrix_power(P2,100))


# 2.
initState = 0

N = 1000
visitsToZero = []

for i in range(N):  
    #path is each trajectory, starting from X0=0
    path=[0]
    #state is the newest state in each path
    state=0
    for i in range (100):
        prob=P2[state]
        state=np.random.choice(range(5),1,p=prob)[0]
        path.append(state) 
    #vtZ is the number of 0 in each trajectory
    vtZ=path.count(0)-1#need to minus the total count by one since X0 should not be counted
    visitsToZero.append(vtZ)

#showing the average
print(np.mean(visitsToZero))

#showing the plot
plt.hist(visitsToZero)
plt.show()

plt.hist(visitsToZero,range=(min(visitsToZero), max(visitsToZero)),bins=range(max(visitsToZero)+1),histtype = 'barstacked')
