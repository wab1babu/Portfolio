#lab4
#1
#2
View(mtcars)#view mtcars
#3
#4
x<-c(mtcars$mpg)
y<-c(mtcars$gear)
plot(x,y,xlab="miles/gallon",ylab="rear axle ratio")
#5
hist(y,xlab="numbers of gears")
#6
summary(mtcars)#summary of the mtcars
#7
boxplot(x,color="PURPLE",main="boxplot of the miles per gallon")#boxplot of the miles per gallon
options(scipen=999)
options(scipen=0)
#8
boxplot(mpg~gear,data=mtcars,col="YELLOW",main="boxplots to compare of mgp to number of gears",xlab="number of gears", ylab="miles per gallon")
