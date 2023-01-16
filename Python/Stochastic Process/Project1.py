#Porject 1
#practice with sampling from a distribution with the __NumPy Package__.

import numpy as np
import numpy.random as npr
import matplotlib
from matplotlib import pyplot

# 1. Simulate 100,000 realizations from the binomial distribution with $N$=2500 trails and success probability $p$=0.45.
samples = npr.binomial(2500, 0.45, size=100000)
print(samples)

# 2. Compute the empirical mean and the empricial standard deviation of your sample and compare these values with the theoretical values.
empirical_mean = samples.mean()
print(empirical_mean)
empirical_sd = samples.std()
print(empirical_sd)
#compute theoretical mean and sd
theoretical_mean = 2500*0.45
theoretical_sd = np.sqrt(2500*0.45*(1-0.45))
print(theoretical_mean)
print(theoretical_sd)
#compare these values with the theoretical mean and sd
#we found the difference between empirical values and theoretical values is small


# 3. Plot a histogram of your sample with the absolute number of counts for each bin. Choose 50 bins.
pyplot.hist(samples, 50,color="pink")
pyplot.show()


# 4. Standardize your sample, that is, subtract the emprical mean and divide by the empricial standard deviation.
standardize_sample = (samples - samples.mean())/samples.std()
print(standardize_sample)


# 5. Plot a histogram of your standardized sample with the counts normalized to form a probability density. Choose again 50 bins. Compare your histrogram with the density of the standard normal distribution by inserting its density into the histogram plot.
pyplot.hist(standardize_sample, 50,color="pink")
pyplot.show()
#Compare your histrogram with the density of the standard normal distribution by inserting its density into the histogram plot.
mu, sigma = 0, 1
count, bins, ignored = pyplot.hist(standardize_sample, 50, density=True,color="pink")

pyplot.plot(bins, 1/(sigma * np.sqrt(2 * np.pi)) * np.exp( - (bins - mu)**2 / (2 * sigma**2) ), 
         linewidth=2, color='red')
pyplot.show()


# Problem 2
# 1. Implement the simulation of a biased 6-sided die which takes the values 1,2,3,4,5,6 with probabilities 1/8,1/12,1/8,1/12,1/4,1/3.
values = [1,2,3,4,5,6]
p = [1/8,1/12,1/8,1/12,1/4,1/3]
sample = npr.choice(values,p=p)
print(sample)

# 2. Plot a histrogramm with 1,000,000 simulations to check if the relative counts of each number is approximately equal to the corresponding specified probabilities.
new_sample = npr.choice(values,1000000,p=p)
pyplot.hist(new_sample, bins=[0,1,2,3,4,5,6,7],color="pink",edgecolor="black")
pyplot.show

#plot histrogram with speicified probabilities
specified_probabilities = np.array([1,1,1,2,2,3,3,3,4,4,5,5,5,5,5,5,6,6,6,6,6,6,6,6])
pyplot.hist(specified_probabilities,bins=6,color="blue",edgecolor="black",label="specified_probabilities",alpha=0.5,density="True")

#insert the histrogram with relative counts into histrogram with speicified probabilities
pyplot.hist(new_sample, bins=6,color="pink",edgecolor="black",label="relative_counts",alpha=0.5,density="True")
pyplot.legend()
pyplot.show()

#Two histrograms overlap (see firgue below). 
#Thus, Yes, the relative counts of each number is approximately equal to the corresponding specified probabilities.
