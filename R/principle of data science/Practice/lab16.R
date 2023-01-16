#lab16
#1
dbGetQuery(PSTAT10db, 'select sum(QUANTITY) from STOCK_TOTAL')
#2
dbGetQuery(PSTAT10db,'select * from STOCK_TOTAL where quantity<=1000')
#3
SALES_ORDER_LINE <- read.csv("~/Desktop/PSTAT10/SALES_ORDER_LINE.txt")
dbWriteTable(PSTAT10db,"SALES_ORDER_LINE", SALES_ORDER_LINE, overwrite=TRUE)

#4
dbGetQuery(PSTAT10db, 'select max(age) from employee')

#5
dbGetQuery(PSTAT10db, 'select * from employee where (age<50) AND (name LIKE "%R%") ')

#6
dbGetQuery(PSTAT10db, 'select manager from department where name="Sales"')
#7
dbGetQuery(PSTAT10db, 'select count(DEPT_NO) from department')
