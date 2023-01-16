library(datasets)  # loading the packages: datasets base stats graphics
library(base)
library(stats)
library(graphics)
# 1
# (a)
options(stringsAsFactors = TRUE)
# (b)
getwd()
avocado2 <- read.csv("D:/2020 Fall/PSTAT 10/Wording Directory/avocado2.csv")

# 2
# (a)
ls(avocado2)
sd(avocado2$Total.Bags)
# (b)
install.packages("statip")  # install the package "statip"
library(statip)
mfv(avocado2$Prod.Year)
# (c)
mean(avocado2$Small.Bags)
# (d)
names(avocado2)
# (e)
summary(avocado2$Large.Bags)
# (f)
avocado2$Total.Bags
avocado2$Prod.Year
# (g)
options(scipen=999)
# (h)
boxplot(Price~Prod.Year,data = avocado2,
        main = toupper("compare the price of avocados for each Production year"),
        xlab = "Year of Production", ylab = "Price")
# (i)

# (j)
avocado3 <- data.frame(avocado2$Price, avocado2$Prod.Year)
avocado3
# (k)
head(avocado3, n=4)
# (l)
library(tibble)
tibble(avocado2)
# (m)
options(stringsAsFactors = FALSE)

# 3
# (i)
dbinom(3, size = 10, prob = 0.2)
# (ii)
1-pbinom(3, size = 10, prob = 0.2)

# 4
pnorm(90.1, mean = 72.3, sd = 8.9)-pnorm(81.2, mean = 72.3, sd = 8.9)

# 5
# (a)
x <- c(2,3,4,5,6,7,8,9,2)
y <- c(3,4,5,6,7,8,9,2,3)
result <- array(c(x,y),dim=c(3,3,2))
result
# (b)
apply(result, 2 ,sum)
# 6
temp <- c(62,73,47,47,54,11,80,62,62,12,17,23)
stem(temp,scale = 2)

# 7
numbers <- c(7,5,3,9,44,11,6,18)
count <- 0
for(i in numbers){
  if(i%%2==0){count <- count + 1}
}
print(count)

# 8
my_function <- function(n){
  if(n>0){(n^2*(n+1)^2)/4}
}
my_function(10)
my_function(0)
my_function(-10)

# 9
library(DBI)
library(RSQLite)
library(sqldf)
TinyClothesdb <- dbConnect(RSQLite::SQLite(),"TinyClothes-db.sqlite")
CUSTOMER <- read.csv("D:/2020 Fall/PSTAT 10/Wording Directory/CUSTOMER.txt")
EMPLOYEE <- read.csv("D:/2020 Fall/PSTAT 10/Wording Directory/EMPLOYEE.txt")
DEPARTMENT <- read.csv("D:/2020 Fall/PSTAT 10/Wording Directory/DEPARTMENT.txt")
EMPLOYEE_PHONE <- read.csv("D:/2020 Fall/PSTAT 10/Wording Directory/EMPLOYEE_PHONE.txt")
INVOICES <- read.csv("D:/2020 Fall/PSTAT 10/Wording Directory/INVOICES.txt")
PRODUCT <- read.csv("D:/2020 Fall/PSTAT 10/Wording Directory/PRODUCT.txt")
SALES_ORDER <- read.csv("D:/2020 Fall/PSTAT 10/Wording Directory/SALES_ORDER.txt")
SALES_ORDER_LINE <- read.csv("D:/2020 Fall/PSTAT 10/Wording Directory/SALES_ORDER_LINE.txt")
STOCK_TOTAL <- read.csv("D:/2020 Fall/PSTAT 10/Wording Directory/STOCK_TOTAL.txt")
dbWriteTable(TinyClothesdb,"CUSTOMER",CUSTOMER)
dbWriteTable(TinyClothesdb,"EMPLOYEE",EMPLOYEE)
dbWriteTable(TinyClothesdb,"DEPARTMENT",DEPARTMENT)
dbWriteTable(TinyClothesdb,"EMPLOYEE_PHONE",EMPLOYEE_PHONE)
dbWriteTable(TinyClothesdb,"INVOICES",INVOICES)
dbWriteTable(TinyClothesdb,"PRODUCT",PRODUCT)
dbWriteTable(TinyClothesdb,"SALES_ORDER",SALES_ORDER)
dbWriteTable(TinyClothesdb,"SALES_ORDER_LINE",SALES_ORDER_LINE)
dbWriteTable(TinyClothesdb,"STOCK_TOTAL",STOCK_TOTAL)
dbListTables(TinyClothesdb)
# (a)
dbSendQuery(TinyClothesdb,'CREATE TABLE WAREHOUSE
            (WAREHOUSE_NO TEXT NOT NULL PRIMARY KEY,
            LOCATION TEXT,
            CHECK (length("WAREHOUSE_NO")<3)
            )')
dbRemoveTable(TinyClothesdb,"WAREHOUSE")
# (b)
dbSendStatement(TinyClothesdb,'INSERT INTO WAREHOUSE VALUES ("1","DENVER")')
dbSendStatement(TinyClothesdb,'INSERT INTO WAREHOUSE VALUES ("2","VENTURA")')
dbSendStatement(TinyClothesdb,'INSERT INTO WAREHOUSE VALUES ("3","BOISE")')
# (c)
dbGetQuery(TinyClothesdb,'SELECT * FROM WAREHOUSE WHERE LOCATION IS "DENVER"')
# (d)
dbSendQuery(TinyClothesdb,'CREATE TABLE STOCK
            (WAREHOUSE_NO TEXT,
            PROD_NO TEXT,
            BIN_NO TEXT NOT NULL PRIMARY KEY,
            QUANTITY REAL
            )')
# (e)
dbSendStatement(TinyClothesdb,'INSERT INTO STOCK VALUES 
                ("1","p1","B2",100)')
dbSendStatement(TinyClothesdb,'INSERT INTO STOCK VALUES 
                ("1","p2","B3",250)')
dbSendStatement(TinyClothesdb,'INSERT INTO STOCK VALUES 
                ("2","p3","B6",150)')
dbSendStatement(TinyClothesdb,'INSERT INTO STOCK VALUES 
                ("3","p2","B4",50)')
# (f)
dbGetQuery(TinyClothesdb,'SELECT SUM(QUANTITY) FROM STOCK WHERE PROD_NO IS "p2"')

# 10
View(warpbreaks)
# (a)
dbWriteTable(TinyClothesdb,'warpbreaks',warpbreaks)
# (b)
dbGetQuery(TinyClothesdb,'SELECT breaks FROM warpbreaks
           WHERE "A" > 30 ORDER BY breaks ASC')
# (c)
dbGetQuery(TinyClothesdb,'SELECT SUM(breaks) FROM warpbreaks WHERE wool IS "B"')
# (d)
dbGetQuery(TinyClothesdb,'SELECT MAX(breaks),MIN(breaks) FROM warpbreaks
           WHERE wool IS "A"')
# (e)
dbGetQuery(TinyClothesdb,'SELECT breaks FROM warpbreaks 
           WHERE wool IS "B" AND tension IS "M"')