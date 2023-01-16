#demo1
dbListTables(PSTAT10db)
dbRemoveTable(PSTAT10db, "MTCARS")
dbListTables(PSTAT10db)
dbWriteTable(PSTAT10db, "mTCARS", mtcars)

#demo2
dbGetQuery(PSTAT10db, 'SELECT PROD_NO FROM SALES_ORDER_LINE 
           WHERE ORDER_NO = "01" OR ORDER_NO = "02"')

#demo3
#nesting
dbGetQuery(PSTAT10db,'SELECT NAME, COLOR FROM PRODUCT
           WHERE PROD_NO IN
           (SELECT PROD_NO FROM SALES_ORDER_LINE WHERE ORDER_NO = "01" OR ORDER_NO = "02")')

dbGetQuery(PSTAT10db,'SELECT NAME, COLOR FROM PRODUCT
           WHERE PROD_NO IN
           (SELECT PROD_NO FROM SALES_ORDER_LINE WHERE ORDER_NO = 1 OR ORDER_NO = 2)')

#demo4
dbGetQuery(PSTAT10db, 'SELECT * FROM PRODUCT')
NEWTABLE <- dbGetQuery(PSTAT10db, 'SELECT * FROM PRODUCT')
NEWTABLE
#does NEWTABLE exists as a relation in the database?
dbListTables(PSTAT10db)
#is it a data frame?
is.data.frame(NEWTABLE)
#add NEWTABLE to the database
dbWriteTable(PSTAT10db, "NEWTABLE", NEWTABLE, overwrite = TRUE)
#check the databse again
dbListTables(PSTAT10db)

#demo5
#data type
dbDataType(PSTAT10db, CUSTOMER)
dbDataType(PSTAT10db, "CUSTOMER")

#demo6
#attribute name
dbListFields(PSTAT10db, "PRODUCT")

#demo7
#add a tuple to an existing relation
ADD_NEW_TUPLE <- dbSendQuery(PSTAT10db, 'INSERT INTO PRODUCT VALUES ("p6","SOCKS","GREEN")')
ADD_NEW_TUPLE <- dbSendQuery(conn = PSTAT10db, 'INSERT INTO PRODUCT VALUES ("p6","SOCKS","GREEN")')
ADD_NEW_TUPLE

dbSendQuery(PSTAT10db, 'INSERT INTO PRODUCT VALUES ("p8","SHIRTS","PINK")')

dbGetQuery(PSTAT10db, 'SELECT * FROM PRODUCT')

#demo8
dbWriteTable(PSTAT10db, 'mtcars',mtcars)

result_in_batches <- dbSendQuery(PSTAT10db, 'SELECT mpg FROM mtcars')
dbFetch(result_in_batches, n=10)

dbGetRowCount(result_in_batches)
dbDataType(PSTAT10db, mtcars)

#demo9
dbSendQuery(conn = PSTAT10db, 'CREATE TABLE SOFT_TOYS
            (TOY_ID INTEGER
            Toy_Name TEXT,
            Color TEXT,
            Price REAL)')

dbSendQuery(conn = PSTAT10db, 'CREATE TABLE SOFTw_TOYS
            (TOY_ID， 
            Toy_Name,
            Color,
            Price)')

dbListTables(PSTAT10db)

#demo10
dbSendQuery(conn = PSTAT10db, 'INSERT INTO SOFT_TOYS
            VALUES (001, "BEAR", "BLUE", 5.99)')
#Query SOFT_TOYS
dbGetQuery(PSTAT10db, )















