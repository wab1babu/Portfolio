#data structure
#scalars,vectors,matrices,data frame,lists

#data types
#logic,numeric,character,complex

#length
x<-c(1,2,3,4,5,6)
length(x)

#difference
mile1<-c(567,786,675)
diff(mile1)
mile2<-c(457,568,765)
diff(c(mile1,mile2))
#combine different mode
name<-c("LILY","BOB")
logic<-c(T,F,T)
c(name,x,logic)

#seq()
seq(1,20,by=2)
seq(1,20,length=4)
seq(40)

#rep()
repitition<-rep(1:5,length=6)

#sort()
sort(repitition,decreasing = T)

x[-2]#return every element except the 2rd

#3
hist(state.area,xlab="dsfg",ylab="sdhi",main="SDUHJ")
options(scipen=0)
x<-c(2,4,5,3,3,3,2,4,5,10)

#4
range(x)
quantile(x)
IQR(x)
sd(x)
var(x)
summary(x)
boxplot(data=mtcars,col="PINK",main="boxplot of mtcars",wt~mpg)
View(mtcars)
x<-matrix(1:20,nrow=4,ncol=5,byrow=T)
barplot(x,border="gray",names.arg=c("A","D","C","F","H"),col="PINK")

y<-c(2,4,5,6,1)
pie(y,labels<-c("sd","sb","i","b","la"),radius=-0.8,main="University of California",clockwise=T,col=rainbow(length(y)))

#5
#matrix(data,nrow,ncol,byrow,dimnames=list(rownames,colnames))
x<-matrix(1:20,nrow=5,ncol=4)
x[,3]
x[2:4,1:2]
dim(x)

# Construct the matrix for the Hair Color and Eye Color data.
HEC <- c(32, 11, 10, 3, 53, 50, 25, 15, 3, 30, 5, 8)
HairColorEyeColor <- matrix(HEC, nrow=3, ncol=4, byrow=TRUE) # fill by row
HairColorEyeColor

#Add row names and column names
rnames <- c("Black Hair", "Brown Hair", "Blond Hair")
cnames <- c("Brown Eyes", "Blue Eyes", "Hazel Eyes", "Green Eyes")
HairEyeColor <- matrix(HEC, nrow=3, ncol=4, byrow=TRUE,dimnames=list(rnames,cnames) )
HairEyeColor

addmargins(HairColorEyeColor)

#array: 2 more matrices
matrix_name<-c("matrix1","matrix2")
row_names<-c("A","B","C")
col_name<-c("D","F","G")
x<-array(1:9,dim=c(3,3,2),dimnames=list(row_names,col_name,matrix_name))
x
y

aaa <- c(2,3,4,6) # create vector
bbb <- c(5,6,10,12,45) # create vector
x<-array(c(aaa,bbb),dim=c(3,4))
apply(x,1,sum)
apply(x,c(1,2),sum)

#4.2
#substrings
bar<-"hello, hello worlds"
sub("hello","hi",bar)
gsub("hello","hi",bar)

substr(bar,7,11)<-"nihao"

#6
gender<-c("M","F","M","F")
factor(gender,ordered=T)
nlevels(gender)

#demo2 list
list(7,8,7)
mylist<-list(gender,9,"Pstat10",TRUE)
mylist
is.list(mylist)
length(mylist)
class(mylist)
mylist[[2]]+3
mylist[[1]]<-paste(mylist[[1]],"others")

letters
LETTERS
month.abb
month.name

mf <- merge.data.frame(state.abb, state.area)
as.tibble(mf)

name<-c("LILY","BOB","Sam")
logic<-c(T,F,T)
year<-c(21,23,19)
x<-data.frame(name,logic,year)
y<-subset(x,year>21,select=c(name,logic))

x<-c("Hello,Hello world")
sub("Hello","Hi",x)
gsub("Hello","Hi",x)

#7
class(iris)
ls(iris)
names(iris)
head(iris,n=1)
tail(iris,n=4)
my_iris<-subset(iris,selct=-Petal.Width)
my_iris
as.tibble(my_iris)
my_iris2<-subset(iris,select=c(Petal.Length,Species))
my_iris2
summary(my_iris)

hist(iris$Petal.Length)
mean(iris$Petal.Length)
median(iris$Sepal.Length)
sd(iris$Sepal.Length)
is.tibble(iris)
as.tibble(iris)


missing<-data.frame(x=c("PSTAT",2,TRUE),y=c(5,NA,8))
missing
na.omit(missing)

MissingValue<-data.frame(x=c("PSTAT10",TRUE,2),y=c(5,NA,8))
MissingValue
na.omit(MissingValue)

newlist<-list(gender,9,"PSTAT10",T)
newlist
class(newlist)
is.list(newlist)
typeof(mylist[[2]])

#8
data<-c(8,98,5,115,22,76,16,69)
MedicineArray<-array(data,dim=c(2,2,2),dimnames=list(outcome=c("deaths","suvivors"),medicine=c("TOLB","placebo"),Age=c("age<55","age>=55")))
addmargins(MedicineArray)
apply(MedicineArray,3,sum)
print(MedicineArray[2,2,2])

dogs<-c(1,4,6,10)
breedname<-c("A","B","C","D")
hist(dogs,xlab="Breed",ylab="Dogs")

read.cvs
write.cvs

speed <- c(45,50,56,60)
df = data.frame(speed = c(45,50,56,60), mileage = c(10,18,25,30))
subset(df$speed, speed > 50); subset(df$speed, speed <= 50)

x <- c(1,0,TRUE,35)
!x

library(iris)
print("Pstat10")
testresult<-c("B"=8,"A"=10,"C"=20)
mode(testresult)

seq(20)
seq(1,10,0.5)
rep(3,each=5,length=2)
x<-c(2,3,4,5,4,4,8,2,3,3)
quantile(x)
range(x)
sd(x)
var(x)
max(x)
min(x)
mfv(x)
summary(x)
