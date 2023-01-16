x<-c(2,3,4,5,6,7,8)
range(x)
IQR(x)
quantile(x)
summary(x)
boxplot(x)

#demo1
state.area
?boxplot
boxplot(x,col="BLUE",)#?????
mtcars#print(mtcars)
boxplot(mtcars,main="compare vehicle weigth to number of cylinders",xlab="number",ylab="weight",col="PINK")

#demo2
x<-c(2,3,4,5,6,7,5,6,5,4,3,4)
range(x)
quantile(x,0.25)
IQR(x)
sd(x)
var(x)
summary(x)
boxplot(state.area,col="YELLOW",main="boxplot of state area",border="BLUE")
boxplot(wt~cyl,data=mtcars,main="compare vehicle weight to numbers of cylinders",xlab="number of cylinders",ylab="weight",col="PINK")

barplot
