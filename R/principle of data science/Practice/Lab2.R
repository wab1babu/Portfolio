View(CO2)#view the data
R> View(CO2)#e
x <- CO2$uptake#f
mean(CO2$uptake)#mean
quantile(x,0.75)#quantile
order(x)#???
sort(x,TRUE)#sort from highest to lowest

help(rivers)#see a description of the data set
c(length(rivers), mean(rivers), median(rivers), min(rivers), max(rivers))#vector of five elements
trimfraction
mean(rivers,trim=0.1)
mean(rivers,trim=0.07)
trimfraction<- 1
  
state.name
y<-state.name
y[21]#find the name of the 21st state
y[state.area>120000]#state area greater than 120000
state.area>120000#????
z<-sort(y,TRUE)#starting with"w"
NEW=z[1:21]
NEW[5]
rm(NEW)
