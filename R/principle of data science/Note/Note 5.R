#demo1
y<-matrix(1:20,nrow=5,ncol=4)#example generate a 5x4  numeric matrix
y[,3]#3rd column of the matrix
y[2:4,1:3]#row 2,3,4of columns 1,2,3
dim(y)#dimensions of a matrix. row by column

#demo2
HEC<-c(32,11,10,3,53,50,25,15,3,30,5,8)#construct a vector of the data be used in the matrix
HairEyeColor<-matrix(HEC,nrow=3,ncol=4,byrow=TRUE,dimnames=list(rnames,cnames))
HairEyeColor

#add row names and column names
rnames<-c("black hair","brown hair","blond hair")
cnames<-c("brown eye","blue eye","hazel eye","green eye")

HairEyeColor[2,]
HairEyeColor[2:3,1:3]

#sum rows and columns
xyz<-addmargins(HairEyeColor)
sum(HairEyeColor)
#give this matrix a name
hair_eye_color<-addmargins(HairEyeColor)
hair_eye_color

#demo3
a<-c(1,2,4,5,6)
b<-c(3,2,4,1,9)
d<-c(7,5,5,6,4)
CC<-cbind(a,b,d)#combine by column
CC
is.matrix(CC)
CR<-rbind(a,b,d)#combine by row
CR
is.matrix(CR)
CR[1,]<-1:5

#remove matrix elements
#removecolumn "a" from matrix named "CC"

#demo4
#create an array
vector1<-c(5,9,3)
vector2<-c(10,11,12,13)
result<-array(c(vector1,vector2),dim=c(3,3,2))
print(result)
#add names
column.names<-c("COL1","COL2","COL3")
row.names<-c("ROW1","ROW2","ROW3")
matrix.names<-c("matrix1","matrix2")
result<-array(c(vector1,vector2),dim=c(3,3,2),dimnames=list(row.names,column.names,matrix.names))
#example: calculation across arrays
aaa<-c(2,3,4,6)
bbb<-c(5,6,10,12,45)
new.array<-array(c(aaa,bbb),dim=c(3,3,2))
print(new.array)

#sum the rows,sum the columns
result<-apply(new.array,2,sum)
print(result)

2<4#example of a relational operator. see table 4.1 in textbook
5==6
#table 4.2 shows comparison operators

#demo5 logical value
data(state)#load data set "state"
state.area
#how many us states have an area less than 10000
smallstate<-state.area<10000
class(smallstate)
smallstate
sum(smallstate)

largestate<-state.area>100000
sum(largestate)

smallstate|largestate
sum(smallstate|largestate)
sum(smallstate&largestate)

