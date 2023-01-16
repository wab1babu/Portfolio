#demo1 normal distribution

#plotting the standard normal distribution
x<-seq(-4,4,length=200)
y<-1/sqrt(2*pi)*exp(-x^2/2)
z<-plot(x,y,type="l",lwd=2,col="pink")

#plotting the standard normal distribution using dnorm
x<-seq(-4,4,length=200)
y<-dnorm(x,mean=0,sd=1)
z<-plot(x,y,type="l",lwd=2,col="blue")

#the standard deviation -- a measure of spread
x<-seq(-8,8,length=500)
y1<-dnorm(x,mean=0,sd=1)
plot(x,y1,type="l",lwd=2,col="red")

y2<-dnorm(x,mean=0,sd=2)
lines(x,y2,type="l",lwd=2,col="blue")

#normal distributions with standard deviations
x<-seq(-8,8,length=500)
y3<-dnorm(x,mean=0,sd=1/2)
plot(x,y3,type="l",lwd=2,col="green")

y2<-dnorm(x,mean=0,sd=2)
lines(x,y2,type="l",lwd=2,col="blue")

y1<-dnorm(x,mean=0,sd=1)
lines(x,y1,type="l",lwd=2,col="red")

legend("topright",title="sigma type",c("sigma=1/2","sigma=2","sigma=1"),lty=c(1,1,1),col=c("green","blue","red"))

#create a normal curve with mean equal to 10
#and standard deviation equal to 10.

x<-seq(70,130,length=200)
y<-dnorm(x,mean=100,sd=10)
plot(x,y,type="l",lwd=2,col="red")

#find the area under the standard normal curve
#below x=1
pnorm(0,mean=0,sd=1)
#find the area between x=-1 and x=1
pnorm(1,mean=0,sd=1)-pnorm(-1,mean=0,sd=1)
#find the area between x=-2 and x=2
pnorm(1,mean=0,sd=1)-pnorm(-1,mean=0,sd=1)
#find the area between x=-3 and x=3
pnorm(3,mean=1,sd=1)-pnorm(-3,mean=0,sd=1)

#finding probabiolities for the normal distribution in general
x<-seq(70,130,length=200)
y<-dnorm(x,mean=100,sd=10)
plot(x,y,type="l",lwd=2,col="red")
x<-seq(70,90,length=100)
y<-dnorm(x,mean=100,sd=10)
polygon(c(70,x,90),c(0,y,0),col="gray")

#find the shaded area
pnorm(90,mean=100,sd=10)

#find the shaded area between 90 and 100
x<-seq(70,130,length=200)
y<-dnorm(x,mean=100,sd=2)
plot(x,y,type="l",lwd=2,col="red")
x<-seq(90,100,length=200)
y<-dnorm(x,mean=100,sd=10)
polygon(c(90,x,100),c(0,y,0),col="gray")

pnorm(100,mean=100,sd=10)-pnorm(90,mean=100,sd=10)

#suppose that the area under the curve to the left of some unknown x-value is 0.95. findx
#qnorm(p,mean=0,sd=1,lower.tail=TRUE)
#p is the given area under the curve
qnorm(0.95,mean=100,sd=10)

#standard normal distribution
qnorm(0.50,mean=0,sd=1)  #return 0, the mean

pnorm(-1,mean=0,sd=1) #area under std curve below -1
# 0.1586553
#given the area. find the value of x
qnorm(0.1586553,mean=0,sd=1)

#demo2
#control structures
x<-c("hello")
if("hello" %in% x)
{print("hello")}

my_function<-function(a){
  for(i in 1:a){
    b<-i^2
    print(b)
  }
}
my_function(4)
