#lab6
#1
#a
View(HairEyeColor)
print(HairEyeColor)
#b
rm(HairEyeColor)
#c
#d
#e
is.array(HairEyeColor)

#write code to determine the total number of:
#total number of respondents in the survey
y<-addmargins(HairEyeColor)
y

#male respondents in the survey
x<-apply(HairEyeColor,3,sum)
x
#how many respondents have blue eyes
w<-apply(HairEyeColor,2,sum)
w
#how many females have red hair
Female_Redhair<-apply(HairEyeColor,c(1,3),sum)
Female_Redhair<-Female_Redhair[3,2]


#2
#a
cat("The quick brown fox\n\tjumped over\n\t\tthe lazy dogs")
#b
num1<-4
num2<-0.75
paste("The result of multiplying",num1,"by",num2,"is 3")
#e
x<-"Two 6-packs for $12.99"
substr(x,start=5,stop=10)
substr(x,start=17,stop=22)<-"$10.99"
x

#3
sex<-rep("M",20)
sex[c(1,5:7,12,14:16)]<-"F"
party<-rep("National",20)
party[c(1,4,12,15,16,19)]<-"Labour"
party[c(6,9,11)]<-"Greens"
party[c(10,20)]<-"Other"
party
