set.seed(250)
a=runif(3,min=0,max=100)

set.seed(123)
x=rnorm(100,mean=100,sd=10)
set.seed(234)
x=rnorm(100,mean=100,sd=10)

rnames=c("cat","flower","owl","flower","banana")
cnames=c("spicy roll","rice roll","fish","spicy")
x=matrix(1:20,nrow=5,ncol=4,byrow=TRUE)
rownames(x)=rnames
colnames(x)=cnames
x

dim1=c("A1","A2")
dim2=c("B1","B2","B3")
dim3=c("C1","C2","C3","C4") 
dim4=c("D1","D2","D3")
z=array(1:72,c(2,3,4,3),dimnames=list(dim1,dim2,dim3,dim4))
z
z[1,2,3,]

StudentID=c(1,2,3,4)
Age=c(18,19,20,21)
Type=c("sm","sn","sr","manz")
studentdata=data.frame(StudentID,Age,Type)
studentdata[1,(1:3)]

par(mfrow=c(2,2))
plot(rnorm(50),pch=17)
plot(rnorm(20),type="l",lty=3)
plot(rnorm(30),cex=0.5)
plot(rnorm(100),lwd=2)

x=matrix(1:20,nrow=5,ncol=4,byrow=TRUE)
y=rnorm(100,mean=50,sd=2)
mylist=list(x,y)
mylist[2]

for(i in 1:10){
  print(i)
}

i=1
while(i<=10){
  print(i)
  i=i+1
}

i=1
if(i==1){
  print("hello world")
}

i=2
if(i==1){
  print("hello world")
}else{
  print("goodbye world")
}


#demo1
7+5

options(prompt="R>")#new CP end with a space
print("223")


ourstring<-"PSTAT10"#assign value to ourstring
ourstring

?ourstring
