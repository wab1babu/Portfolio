x<-c(2,1,0,3)
matrix(x,nrow=2,ncol=2,byrow=TRUE)

y<-matrix(1:12,nrow=4,ncol=3,byrow=F)
y[,1]
y[3,1]

a<-c(1,2,3)
b<-c(6,7,8)
z<-array(c(a,b),dim=c(3,2))
is.matrix(z)

w<-array(1:20,dim=c(3,4,2),dimnames=list(rownames(x),colnames(w)))
rownames(w)=c("A","B","C")
colnames(w)=c("X","Y","Z","W")
w

apply(w,2,sum)
apply(w,c(1,2),mean)
