#demo1
data("state")
rm(state.center)
rm(state.region)
rm(state.x77)

state.area#area of us states in square miles
is.vector(state.area)#???
class(state.area)
mode(state.area)
#view state area
View(state.area)
view#view is  sensentive????

#demo2
hist(state.area)#default
hist(state.area,breaks="Sturges",col="PURPLE", xlab="STATE AREAs",main=paste("HISTOGRAM OF STATE"),ylim=c(0,50))
options(scipen=999)#open
hist(state.area,breaks="Sturges",col="PURPLE", xlab="STATE AREAs",main=paste("HISTOGRAM OF STATE"),ylim=c(0,50))
options(scipen=999)#close
