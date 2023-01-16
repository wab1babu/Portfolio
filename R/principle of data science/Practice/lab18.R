#lab18
#1 create a new relation
dbSendQuery(PSTAT10db, 'CREATE TABLE SHOES
            (SHOE_ID INTEGER,
            MODEL TEXT,
            COLOR TEXT)')

#2 check that SHOES exists in your database
dbListTables(PSTAT10db)

#3 populate SHOES 
dbSendQuery(PSTAT10db, 'INSERT INTO SHOES VALUES ("001", "Running", "PINK")')
dbSendQuery(PSTAT10db, 'INSERT INTO SHOES VALUES ("002", "XCountry", "GREEN")')

#4Delete SHOES
dbRemoveTable(PSTAT10db, "SHOES")