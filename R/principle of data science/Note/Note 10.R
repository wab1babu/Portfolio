#demo1
#flip a twice. find the probability of obtaining two tails.
dbinom(x=2,size=2,prob=0.5)

#flip three times. calculate the probability of obtaining three tails
dbinom(3,3,0.5)

#demo2
#flip a coin three times Construct the pmf for "tails"
prob_tails<-dbinom(0:3,size=3,prob=1/2)
prob_tails

#demo3
#method1:use dbinom()
#find P(X=0), P(X=1),P(X=2),P(X=3),P(X=4) heads. then use "sum"
#method2:use pbinom()
#to find P(x<=4) heads
#the cumulative probability 
dbinom(0:4,size=10,prob=1/2)
sum(dbinom(0:4,size=10,prob=1/2))
pbinom(4,size=10,prob=1/2)

#calculate the probability of obtaining between 5 and 8 heads
#method1: use dbinom()
sum(dbinom(5:8,10,0.5))
#method2:using pbinom
pbinom(8,size=10,prob=1/2)-pbinom(4,size=10,prob=1/2)

#calculate the probability that the number of heads is greater than 7
sum(dbinom(8:10,size=10,prob=1/2))
#calculate the probability that the number of heads is greater than7
1-pbinom(7,size=10,prob=1/2)

#demo4 example
#defective parts example
dbinom()

#demo5 uniform distribution
Bus_example<-dunif(0:10,min=0,max=10)
hist(Bus_example,freq=FALSE,xlab="x")

#punif()gives the distribution function
#probability of waiting 5 minutes or less
punif(5,min=0,max=7,lower.tail=TRUE)
#probability of waiting 7 minutes  or less minus #probability of waiting 5 munites or less
punif(q=7,min=0,max=10)
