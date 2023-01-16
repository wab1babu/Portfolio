#lab15
#1 retrieve all distinct employee names of employees at "Tiny Clothes"
dbGetQuery(PSTAT10db, 'SELECT DISTINCT NAME FROM EMPLOYEE')

#2find the name of all departments that begin with the letter "S" and contain the letter "r"
#will the query give the same result if you use "R" instead of "r"
#yes
dbGetQuery(PSTAT10db, 'SELECT NAME FROM DEPARTMENT WHERE NAME LIKE "S%" AND NAME LIKE "%r%" ')
dbGetQuery(PSTAT10db, 'SELECT NAME FROM DEPARTMENT WHERE NAME LIKE "S%" AND NAME LIKE "%R%" ')

#3 does "Tiny clothes" sell white socks
#yes
dbGetQuery(PSTAT10db, 'SELECT * FROM PRODUCT WHERE COLOR == "WHITE" AND NAME == "SOCKS"')

#4does tiny clothes have any orders for products p1 and p2
dbGetQuery(PSTAT10db, 'SELECT * FROM SALES_ORDER_LINE WHERE PROD_NO IN ("p1", "p2")')

#5 how many customers have placed an order
dbGetQuery(PSTAT10db, 'SELECT count(DISTINCT NAME) FROM CUSTOMER')

#6 what color socks does "tiny clothes " sell?
dbGetQuery(PSTAT10db, 'SELECT COLOR FROM PRODUCT WHERE NAME == "SOCKS"')

#7customer c6 has placed more than one order. find the order numbers and the dates on which the orders were placed
dbGetQuery(PSTAT10db, 'SELECT ORDER_NO, DATE FROM SALES_ORDER WHERE CUST_NO == "C6" ')

#8 if "tiny clothes" wants to ship all these items together, how many items will the shipment contain
dbGetQuery(PSTAT10db, 'SELECT sum(QUANTITY) FROM INVOICES WHERE ORDER_NO == "2" ')
