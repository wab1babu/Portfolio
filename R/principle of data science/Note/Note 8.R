#demo1 clinical trial data
tdat<-c(8,98,5,115,22,76,16,69)
tdat<-array(tdat,c(2,2,2))
tdat
dim(tdat)

#row names, column names and matrix names
dimnames(tdat)<-list(Outcome=c("deaths","survivors"),Treatment=c("tolb","placebo"),Age_group=c("Age<55","Age>=55"))
tdat
is.array(tdat)
#calculate total number of deaths and survivors
total_row<-apply(tdat,1,sum)
total_row
#total number of tolb and placebo
total_col<-apply(tdat,2,sum)
total_col
#print row2,col2,matrix2
print(tdat[2,2,2])

tdat[c(1,2),,2]

#
print(tdat["Deaths",1,2]) 
tdat2 <- tdat["Deaths",1,2]
#create a matrix of the combined data
total_row_col<-apply(tdat,c(1,2),sum)
total_row_col
class(total_row_col)

#difference
tdap<-c(8,98,5,115,22,76,16,69)
tdap<-array(tdap,c(2,2,2),dimnames=list(outcomes,treatment,age_group))
outcomes=c("deaths","survivors")
treatment=c("tolb","placebo")
age_group=c("age<55","age>=55")
tdap

#demo1
#Construct a vector of the outcome values given above
outcomes<-c(0,1,2,3,4)
outcomes 
#Construct a vector of corresponding probabilities.
probabilities<-c(0.07,0.20,0.38,0.22,0.13)
probabilities

#produce the barplot of the data
barplot(probabilities, ylim=c(0,0.4), name.arg=outcomes, space=0, xlab="Number of Children per Household", ylab="Probability")
#produce the cumulative sums of the probabilities
cumulative<-cumsum(probabilities)

#plot the cumulative distribution
barplot(cumulative,name.arg=outcomes,space=0,xlab="Number of Children per Household",ylab="cumukative probability")

#demo2
outcomes2 <- c(0,1,2,3,4)
outcomes2
probabilities2 <- c(0.07, 0.20, 0.38, NA, 0.13)
probabilities2
cumulative2 <- cumsum(probabilities2)
cumulative2

probabilities3 <- sum(c(0.07, 0.20, 0.38, NA, 0.13))
probabilities3 # does not give the answer we require

probabilities3<-c(0.07,0.20,0.38,NA,0.13)
sum(probabilities3,na.rm=TRUE) #return the sum
1-sum(probabilities3,na.rm=T)#returns the mission value

probabilities3<-c(0.07,0.20,0.38,NA,0.13)
probabilities3
sum(probabilities3,na.rm=TRUE)
1-sum(probabilities3,na.rm=T)

#demo2
#mean of distribution is the sum of (the  x values X respective probabilities)
Mean_discrete_dist<-sum(outcomes2*probabilities)
Mean_discrete_dist

#demo3
#variance
Var_discrete_dist<-sum((outcomes-Mean_discrete_dist)^2*probabilities)
Var_discrete_dist
#standard deviation
Stand_discrete_dist<-sqrt(Var_discrete_dist)
Stand_discrete_dist

#demo4
dbinom(x=2,size=2,prob=0.5)

x <- factor(c("yes", "yes", "no", "yes", "no"))
table(x)
data("HairEyeColor")

subset(iris,select=c(Sepal.Width:Species))
as.tibble(subset(iris,select=c(Sepal.Width:Species)))
summary(iris)
names(iris)
ls(iris)
class(iris)
hist(iris$Petal.Width)
boxplot(Petal.Length~Species,data=iris)
