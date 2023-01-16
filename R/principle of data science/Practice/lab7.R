#a.create data frame 
subject<-c("English","Maths","CHemistry","Physics")
percentage<-c(80,100,85,95)
x<-data.frame(subject,percentage)
#b rename the columns
cnames<-c("Course","Score")
colnames(x) <- cnames
#c wirte code to extract the "course" column
y<-subset(x,select=-1)

#b.load "state.x77"
View(state.x77)
class(state.x77)
df1<-data.frame(state.x77)
w<-df1$Income<4300
sum(w)

View(swiss)
class(swiss)
z<-subset.data.frame(swiss,select=c(Examination,Education,Infant.Mortality))
z
z<-swiss[c(1,2,3,10,11,12,13),c(3,4,5)]
z
swiss[10,6]<-NA
swiss