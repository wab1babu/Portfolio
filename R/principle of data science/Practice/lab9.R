#lab9
#1
#i find the missing value
prob<-c(0,0.4,0.1,0.03)
sum(prob)
A<-1-sum(prob)
#ii P(X<2)
x<-c(1,2,3,4,5)
prob<-c(0,0.47,0.4,0.1,0.03)
prob[x<2]

#iii find the mean of the random variable X
Mean<-sum(x*prob)
Mean
#iv find the standard deviation of X
sd<-sum((x-Mean)^2*prob)
sd
#v
cumsum(prob)

#2
dbinom(x=5,size=8,prob=0.2)
#3
dbinom(x=7,size=10,prob=0.8)
