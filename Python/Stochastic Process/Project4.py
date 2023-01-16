# __Background:__ Markov chains could be used to model a plethora of phenomena that happen in our world. The only assumption that we would have to accept is the fact that what we are trying to model depends only on the last step, and not on all previous steps (the whole history).

import numpy as np 
from numpy import linalg 
import scipy.linalg
import matplotlib.pyplot as plt


#implement the transition probability matrix P
P=np.array([[0.756,0.113,0.129,0.002,0,0,0],[0.174,0.821,0.004,0.001,0,0,0],[0.141,0.001,0.776,0.082,0,0,0],[0.003,0,0.192,0.753,0.052,0,0],[0,0,0.002,0.227,0.735,0.036,0],[0,0,0,0.007,0.367,0.604,0.022],[0,0,0,0,0.053,0.158,0.789]])
print(P)

# Use P7 = linalg.matrix_power(P, 7) to create P to power 7
P7=linalg.matrix_power(P,7)
print(P7)
#create the wind speed array by 10*i
wind_speed=np.array([0,10,20,30,40,50,60])
#then calculate the expected wind speed by wind_speed*P7[0,]
expected_windspeed=sum(P7[0,]*wind_speed)
expected_windspeed

# use H to collect each Hn from 1 to 100
H=np.zeros(100)
for i in range(100):
    x=linalg.matrix_power(P,i+1)    # i should start from 1 to 100, so we need to use i+1
    H[i]=x[0,6]
#Create a plot showing Hn as a function of n
plt.plot(H)
plt.title("Hn as a function of n")
plt.xlabel("number of days")
plt.ylabel("probability of strong wind")
# summary: Numerically the power matrix P^n converges as n increases
#As n increases, P^n gets into equilibrium, indicating that each P is an eigenvector for P^n and eigenvalue is 1
