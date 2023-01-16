#1
x<-seq(-4,4,length=200)#a seqence of numbers from -4 to 4 and also satisfy the condition that the seqence has 200 numbers
y<-dnorm(x,mean=0,sd=1)#create a normal distribution with mean=0 and standard deviation=1
z<-plot(x,y,type="l",lwd=2,col="blue")#create the plot of the normal distribution

#2
1-pnorm(77,mean=68,sd=9)

#3
#a
pnorm(95,mean=80,sd=12)-pnorm(65,mean=80,sd=12)
#b
pnorm(74,mean=80,sd=12)

#4
pnorm(1000,mean=775,sd=150)

#5
#a
600*(pnorm(82,mean=76,sd=8)-pnorm(70,mean=76,sd=8))
#b
qnorm(0.95,mean=76,sd=8)

#6
pnorm(116,mean=100,sd=16)-pnorm(84,mean=100,sd=16)
qnorm(0.98,mean=100,sd=16)
