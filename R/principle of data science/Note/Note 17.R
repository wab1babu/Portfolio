#connect to your database
PSTAT10db <- dbConnect(RSQLite::SQLite)

#demo1
#create and query a VIEW
dbSendQuery(conn = PSTAT10db, "CREATE VIEW FIRSTVIEW AS
            SELECT * FROM PRODUCT")
dbGetQuery(PSTAT10db, 'SELECT COLOR FROM FIRSTVIEW')
dbListTables(PSTAT10db)

#submit the following query and use it to create SECONDVIEW
dbGetQuery(PSTAT10db, 'SELECT EMPLOYEE.EMP_NO, EMPLOYEE.NAME, DEPARTMENT.MANAGER 
           FROM EMPLOYEE JOIN DEPARTMENT 
           WHERE')

#
dbSendQuery(conn = PSTAT10db, 'CREATE VIEW SECONDVIEW AS
            SELECT E.EMP_NO, E.NAME, D.MANAGER 
            FROM EMPLOYEE E JOIN DEPARTMENT D 
            WHERE E.DEPT_NO = D.DEPT_NO
            AND NOT (MANAGER = "null")')

dbGetQuery(PSTAT10db, 'SELECT * FROM SECONDVIEW')

#demo2
#delete FIRSTVIEW and SECONDVIEW
dbSendStatement(conn = PSTAT10db, 'DROP VIEW FIRSTVIEW')
dbListTables(PSTAT10db)
dbSendStatement(conn = PSTAT10db, 'DROP VIEW SECONDVIEW')

#demo3
#QUERYING PART OF A RELATION
#Suppose we want TEMPORARILY exclude ALEX  from all queries involving the relation  CUSTOMER.
# To do this we use dbSendStatment with DELETE
DEL_ALEX <- dbSendStatement(PSTAT10db, 'DELETE  FROM CUSTOMER
                            WHERE NAME = "ALEX"')
dbGetRowsAffected(DEL_ALEX)

#customer remains unchanged but when we query customer
#Alex is not include in the answer

dbGetQuery(PSTAT10db, 'SELECT * FROM CUSTOMER')

#demo4
#Restore Alex to queries involving CUSTOMER
dbWriteTable(PSTAT10db, "CUSTOMER", CUSTOMER, overwrite = TRUE)
dbGetQuery(PSTAT10db,)
