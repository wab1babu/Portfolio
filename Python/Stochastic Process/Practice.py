
import numpy as np
import matplotlib
from matplotlib import pyplot

#1a)
#s0 is the initial distribution according to whatever input
def simReflectedRW(T,p,s0):
    route=[s0]
    for i in range (T):
        if (route[i]!=0):
            #generate the next stage with according probability if current state is not 0
            nextStage=(np.random.choice([route[i]-1,route[i]+1],1,p=[1-p,p]))[0]
        else:
            nextStage=1
        route.append(nextStage)
    return route

#1b)
data=[]
for i in range(1000):
    #generate the required simulation
    temp=simReflectedRW(100,0.35,1)[100]
    data.append(temp)
pyplot.hist(data)
pyplot.show()
print("The estimated expectation of S100 is", np.mean(data))

#1c)
data=[]
for i in range(1000):
    #generate the required simulation
    temp=simReflectedRW(200,0.35,1)[200]
    data.append(temp)
pyplot.hist(data)
pyplot.show()
print("The estimated expectation of S200 is", np.mean(data))

#1d)
# we do a simulation large enough for n = 10000
pyplot.plot(simReflectedRW(10000,0.35,1))
# as a simple random walk, state i always communicates with i+1 and i-1, thus all states communicates with each other,
# and thus if we write the random walk into a MC, it is irreducible.
# However, this MC is not aperiodic, since if we write the transitional matrix, we find that all diagnal elements are 0.
# Thus the MC is not ergotic and the limit does not always exist for every k. It depends on specific case.
