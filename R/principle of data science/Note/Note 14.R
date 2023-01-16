#demo1
#what is averge number of items currently ordered?
dbGetQuery(PSTAT10db,'SELECT AVG(QUANTITY) FROM INVOICES')

#for how many items is the largest order and the smallest order
dbGetQuery(PSTAT10db, 'SELECT MAX(QUANTITY), MIN(QUANTITY) FROM INVOICES')

#how many items are there invoices?
dbGetQuery(PSTAT10db, 'SELECT COUNT (*) FROM INVOICES')

#what is the averge quantity for orders of product p2
dbGetQuery(PSTAT10db, 'SELECT  AVG(QUANTITY), MIN(QUANTITY)
           FROM INVOICES WHERE PROD_NO == "p1" ')

#demo2
#testing for null
dbGetQuery(PSTAT10db, 'SELECT * FROM DEPARTMENT WHERE MANAGER == "null"')

dbGetQuery(PSTAT10db, 'SELECT * FROM DEPARTMENT WHERE MAnager == "null"')

PRODUCT
#demo3
#what is the amount due 
dbGetQuery(PSTAT10db, 'SELECT PROD_NO, QUANTITY, PRICE*QUANTITY FROM INVOICES')
dbGetQuery(PSTAT10db, 'SELECT PROD_NO, SUM(QUANTITY), SUM(PRICE*QUANTITY) FROM INVOICES
           WHERE PROD_NO == "p1"')
#demo4
#group by
#how many items are in each order
dbGetQuery(PSTAT10db, 'SELECT ORDER_NO, SUM(QUANTITY) FROM INVOICES GROUP BY ORDER_NO')
#????
dbGetQuery(PSTAT10db, 'SELECT ORDER_NO, SUM(QUANTITY) FROM INVOICES')

#which order are invoices for a quantity of 20,000 or more items?????????
dbGetQuery(PSTAT10db, 'SELECT ORDER_NO, SUM(QUANTITY)
           FROM INVOICES GROUP BY ORDER_NO HAVING SUM(QUANTITY)>20')

dbGetQuery(PSTAT10db, 'SELECT ORDER_NO, SUM(QUANTITY)
           FROM INVOICES GROUP BY ORDER_NO')

#demo5 order
#select all items f
dbGetQuery(PSTAT10db, 'SELECT * FROM PRODUCT ORDER BY NAME')

#ordering
dbGetQuery(PSTAT10db, 'SELECT PROD_NO, NAME, COLOR FROM PRODUCT ORDER BY PROD_NO DESC')
dbGetQuery(PSTAT10db, 'SELECT PROD_NO, NAME, COLOR FROM PRODUCT ORDER BY 1 DESC')

#demo6 JOIN
dbGetQuery(PSTAT10db, 'SELECT * FROM CUSTOMER JOIN PRODUCT')

#dem o8 natural join uses keys
CUSTOMER
SALES_ORDER
dbGetQuery(PSTAT10db, 'SELECT ORDER_NO, CUST_NO
           FROM SALES_ORDER
           NATURAL JOIN
           CUSTOMER')


dbGetQuery(PSTAT10db, 'SELECT *
           FROM SALES_ORDER
           NATURAL JOIN
           CUSTOMER')

dbGetQuery(PSTAT10db, 'SELECT * FROM SALES_ORDER_LINE JOIN PRODUCT
           ON PRODUCT.PROD_NO = SALES_ORDER_LINE.PROD_NO')

dbGetQuery(PSTAT10db, 'SELECT * FROM SALES_ORDER_LINE NATURAL JOIN PRODUCT')

dbGetQuery(PSTAT10db, 'SELECT * FROM SALES_ORDER_LINE JOIN PRODUCT')

#compare with natural join
dbGetQuery(PSTAT10db, 'SELECT * FROM SALES_ORDER_LINE NATURAL JOIN PRODUCT')

#demo9
#correlation name
dbGetQuery(PSTAT10db, 'SELECT NAME FROM CUSTOMER')
dbGetQuery(PSTAT10db, 'SELECT C.NAME FROM CUSTOMER C')
dbGetQuery(PSTAT10db, 'SELECT C.NAME AS FNAME FROM CUSTOMER C')

#return product name as line_name
dbGetQuery(PSTAT10db, 'SELECT P.NAME AS LINE_NAME FROM PRODUCT P')

dbGetQuery(PSTAT10db, 'SELECT NAME AS LINE_NAME FROM PRODUCT')
