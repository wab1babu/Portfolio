#Demo1(a)
#create a vector of the given test scores using the function c()
Testscores<- c(8,7,7,10,5)
Testscores
mode(Testscores)#not the most frequency number
mean(Testscores)#find the mean of test scores
median(Testscores)#find the median of test scores
Testresults<-c("Bob"=8,"Alice"=7,"Alex"=7,"Juan"=10,"Amy"=5)
Testresults
mode(Testresults)

#Demo1(b)
mile<-c(65311,65624,65908)
x<-diff(mile)
x
mile2<-c(3,4,5)
mile3<-c(mile,mile2)#combines mile and mile2
mile3
z<-diff(mile3)
mode(z)

#demo2
both<-c("dog",3,4,"banana")
mode(both)

#demo3
series<-1:10#construct series 1-10, using colon operator
series

seq(1,10,0.5)#seq(from,to,by)
seq(1,10,length=4)#seq(from,to,length=)

#demo4
rep(3,times=5)
rep(x=3,times=5)
rep(1:4,2)

#demo5
Testscores<-c(8,7,7,10,5)#create a vector
sort(Testscores,decreasing=FALSE)#sort(x,FALSE/TRUE)
sort(Testscores)#increasing is default
sort(Testscores,decreasing=TRUE)

#demo6
x<-c(1,7,3,10,5)#create the required vector
x[4]#4th element of x
x[-2]#return every element except the 2rd
