#demo1
#create a new database named PSTAT10db
PSTAT10db<-dbConnect(RSQLite::SQLite(), "PSTAT10-db,sqlite")

CUSTOMER <- read.csv("~/Desktop/PSTAT10/CUSTOMER.txt")
EMPLOYEE<-read.csv("~/Desktop/PSTAT10/EMPLOYEE.txt")
DEPARTMENT <- read.csv("~/Desktop/PSTAT10/DEPARTMENT.txt")

dbWriteTable(PSTAT10db)

dbWriteTable(PSTAT10db, "EMPLOYEE", EMPLOYEE)
dbWriteTable(PSTAT10db, "DEPARTMENT", DEPARTMENT)
dbWriteTable(PSTAT10db, "CUSTOMER", CUSTOMER)

dbListConnections()

dbRemoveTable()

#demo2
#select all from employee
dbGetQuery(PSTAT10db,"SELECT*FROM EMPLOYEE")
EMPLOYEE

#the result of the query is given as a data frame
is.data.frame(EMPLOYEE)

#we can also add data frames to the database directly
dbWriteTable(PSTAT10db, "mtcars", mtcars)
dbWriteTable(PSTAT10db, "iris", iris)
dbListTables(PSTAT10db)

#demo3 mtcars
#mtcars is a data frame with 32 observations
#use of the LIMIT operator
#select  all from mtcars but only return the first 5 tuples
dbGetQuery(PSTAT10db, "SELECT * FROM mtcars LIMIT 5")

dbGetQuery(PSTAT10db,'select * from mtcars limit 10')

#use of an arithmetic operator
#select wt with the WHERE condition that mpg>30
dbGetQuery(PSTAT10db, "SELECT wt FROM mtcars WHERE mpg>30")
#select wt and mpg for cars with mpg>30
dbGetQuery(PSTAT10db, "SELECT wt, mpg FROM mtcars WHERE mpg>30")
dbGetQuery(PSTAT10db, "select wt, mpg from mtcars where mpg>30")

#demo4
#cyl refers to the number of cylinders
dbGetQuery(PSTAT10db, "SELECT cyl FROM mtcars")

#find the number of cylinders cars in the survey have
#do not return duplicates
dbGetQuery(PSTAT10db, "SELECT DISTINCT cyl FROM mtcars")
dbGetQuery(PSTAT10db, "select distinct cyl from mtcars")

#find the number of gears and corresponding number of cylinders
dbGetQuery(PSTAT10db,  "SELECT gear,cyl FROM mtcars")
#find the number of gears and corresponding number  of cylinders
#do not return duplicates
dbGetQuery(PSTAT10db, 'SELECT DISTINCT gear, cyl FROM mtcars')

#demo5
#caution: working with 'DISTINCT'
dbGetQuery(PSTAT10db, 'SELECT * FROM EMPLOYEE')
dbGetQuery(PSTAT10db)
