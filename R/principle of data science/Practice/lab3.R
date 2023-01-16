#lab3
#2
hist(co2,breaks="Sturges",col="PURPLE",xlab="conc",main=paste("Histogram of the CO2 uptake rates"))
#3
#a 
?stem()
#b-scale/width
x<-c(9,9,22,32,33,39,39,42,49,52,58,70)
stem(x,2)

#4
min(state.area)
max(state.area)
mean(state.area)
median(state.area)
x<-c(max(state.area),min(state.area))
diff(x)

#5
x<-c(2,3,3,3,4,2,5,10)
mfv(x)