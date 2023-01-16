data("iris")
View(iris)
is.data.frame(iris)
class(iris)#another way to check
dim(iris)#the dimensions of iris--150 observations of 5 variables
ls(iris)#shows the names of objects (variables) in iris
names(iris)#also shows the names of objects (variabels)
print(ls())

head(iris,5)
#print the last seven row
tail(iris,n=7)

#remove the petal width from iris?????????????
my_iris_data1<-subset(iris,select = -Petal.Width)
head(my_iris_data1,n=5)

#keep only PetalLength and Species
myirisdata3<-subset(iris, select = c(Petal.Length,Species))
head(myirisdata3,n=5)
summary(iris)

hist(iris$Petal.Length,col="PINK")
mean(iris$Petal.Length)
median(iris$Petal.Length)
sd(iris$Petal.Length)

boxplot(Petal.Length~Species, iris, main="Petal Length to Species",xlab="Species",ylab="Petal.Length",col="pink")

#demo3
is.tibble(iris)
as.tibble(iris)#coerce data frame to tibble
is.data.frame(x)

#demo4
#create 3 vectors
Firstname<-c("Ann","Paul","BOB")
Lastname<-c("Smith","Liu","Lopez")
Department<-c("Math","Physics","Biology")
#combine into an object
Faculty_Profile<-cbind(Firstname,Lastname,Department)
Faculty_Profile
class(Faculty_Profile)

#create a data frame with similar columns
#notice the use of the = sign
New_Faculty_Profile<-data.frame(Firstname=c("John","Sara","Jane"), Lastname=c("Day","Brown","Green"),Department=c("HIstory","English","PSTAT"))
New_Faculty_Profile
class(New_Faculty_Profile)

#join Faculty_Profile and New_Faculty_Profile
All_Faculty_Profile<-rbind(Faculty_Profile,New_Faculty_Profile)
All_Faculty_Profile
class(All_Faculty_Profile) #data frame
as.tibble(All_Faculty_Profile)

#Export All_Faculty_Profile to your working directory as a csv file
write.csv(All_Faculty_Profile,"All_Faculty_Profile2.csv")

?read.csv

#import file
read.csv("All_Faculty_Profile2.csv")
My_New_All_Faculty_Profile2<-read.csv("All_Faculty_Profile2.csv")
My_New_All_Faculty_Profile2

#missing values in a data frame
Missing_Values<-data.frame(x=c("PSTAT",2,TRUE,3),y=c(5,NA,8,NA))
Missing_Values
is.data.frame(Missing_Values)
na.omit(Missing_Values)

setwd("/folder1/folder2/folder3/")
?setwd

x<-factor(c("M","F"))
paste(x,"other")
paste(x)
