for(i in 1:10){
if(i<=5){
  next
}
  print(i)
  }
for(a in 2:4){
  result1 <- a+1
  print(result1)
  }
  for(b in 1:3){
    result2 <- b+1
    if(result2>3){
      break
    }
    print(result2)
  }
 print(result1,result2)

 positive_number <- function(a){
   if(a>0){
     print(a)
   }
  else{
    print("Your number must be positive")
  }
 }
 positive_number(-4)
 positive_number(5)
 positive_number(0)
 
 # sum of first n natural numbers
 sum_numbers <- function(n){
   if(n>=0){
     result <- n*(n+1)/2
     print(result)}
   }
sum_numbers(4)

i <- 0 
repeat{
  i=i+1
  print("PSTAT10")
  if(i==5){
    break
  }
}

x <- c(2,5,3,9,8,11,6)
count <- 0
for (i in x) {
  if(i %% 2 == 1){
    count = count+1}
}
   odd_number <- print(count)  
   
x <- c(2,5,3,9,8,11,6)
count <- 0
for(i in x){
  if(i %% 2==0) count=count+1
}
even_number<-print(count)
n <- c(even_number,odd_number)
sum(n)
cat(even_number,"even numbers",",",odd_number,"odd numbers")
 
