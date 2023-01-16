#demo1 factors
#create a factor with elements: male, female,  female, male
gender<-factor(c("male","female","female","male")) 
#what are the levels?
levels(gender)
#order--alphabet

#how many factors are there?
nlevels(gender)
plot(gender)#return a bar chart
table(gender)#table  returns a frequency table

#ordinal data
classgrades<-ordered(c("Pass","Fail"))
classgrades
nlevels(classgrades)

classgrade<-ordered(c("pass","fail"))

#demo2 list
#create a list 
list(7,8,17)
#create a list containing a factor, a number, a character string
mylist<-list(gender, 9, "PSTAT10")
mylist

#is the R object mylist a list?
is.list(mylist)

#find the length of mylist
length(mylist)

#members refrence using SINGLE square bracket notation
#returns the 2nd and 3rd elements of the list
mylist[c(2,3)]

#member reference using DOUBLE square bracket notation
mylist[2]
mylist[2]+3#does not work
mylist[[2]]
mylist[[2]]+3
typeof(mylist[2])#single square brackets
typeof(mylist[[2]])#double square brackets
class(mylist[2])
class(mylist[[2]])
#add to the list

mylist[[1]]#refrences element 1 of mylist(gender)
mylist[[1]]<-paste(mylist[[1]],"other")
mylist

#demo3
#using sub() to replace  the  first match only in a string
#syntax:sub(old,new,string)
x<-c("Hello,Hello World")
x
sub("Hello","Hi",x)
gsub("Hello","Hi",x)

#Pre-defined constants in R
letters    #lower-case letters
LETTERS    #upper-case letters
month.abb
month.name
is.list(letters)
is.vector(letters)

#demo4 data frame
#construct 3 vectors
d<-c(1,2,3,4)                 #numeric vector
e<-c("red",NA,"white","red")  #character vector
f<-c(TRUE,TRUE,TRUE,FALSE)    #logical vector
#construct a data frame named "My_DF" using these 3 vectors
My_DF<-data.frame(d,e,f)
My_DF
na.omit(My_DF)
#Is My_DF a dataframe
is.data.frame(My_DF)

#???glue

setwd("/folder1/folder2/folder3/")

x<-factor(c("a","b","a","d"))
table(x)
table2<-c("x","x","y","z")
table(x,table2)






