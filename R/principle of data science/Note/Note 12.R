#demo1
#if, if...else
#using "if"  The operator==tests a condition. Returns TRUE or FALSE
x<-3
x==2
if(x==3){print("This is true")}
if(x==2){print("This is true")} #do nothing

#%in% logical operator used to identify if an element belongs to an R object
x<-c("hello")
if("hello"%in% x)
{print("hello")} 

#if and if..else
x<-c("hello")
if("goodbye" %in% x)
{print("goodbye")}else{print("see you later")}

#more examples if and if...else
x<-5
if(x>0){
  print("positive number")
}

#demo1 continued
#ifelse
#ifelse(test expression,yes,no)
#if the test expression

x<-1:10
ifelse(x<5|x>8,x,0) #x less than 5 or greater than8
ifelse(x<3|x>9,x,"missing") #a char string

x<-c(5:2)
ifelse(x==5|x>3,x,0)

#demo2
#repeat loop
#executes the same code repeatedly until a stop condition is met

x<-1     #set x to  1
repeat{
  print(x)
  x=x+1
  if(x==4){
    break
  }
}

#demo3
#while loop
#test expression is evaluated. The loop is entered if the result is TRUE

i<-1     #initialize
while(i<6){
  print(i)
  i=i+1
}

#given x<-c(2,4) write a while
x<-c(2,4)
i=6
while(length(x)<12)
{
  x=c(x,i)
  i=i+2
}
x

#demo4
#for loop
#count the number of even numbers in a vector
#the operator %% gives the remainder or modulus
x<-c(2,5,3,9,8,11,6)
count<-0
for(i in x){
  if(i %% 2 == 0) count = count+1
}
print(count) #prints count after exciting the loop

#demo5
x<-5
y<-40
i<-c(1:10)
for(j in i)
{x=x+3
y=y-2}
x
y

#demo6
fahrenheit_to_centigrade<-function(temp_F){
  temp_c<-((temp_F-32)*(5/9))
  return(temp_c)
}
fahrenheit_to_centigrade(82)

#demo7 Create a function to print squares of numbers in sequence
My_function<-function(a){
  for(i in 1:a){
    b<- i^2
    print(b)
  }
}
My_function(4)

#cat() will concatenate and print
for(a in 2:8)
  for(b in 1:6)
    if(a<b)
      cat(a,"less than",b,"\n")
