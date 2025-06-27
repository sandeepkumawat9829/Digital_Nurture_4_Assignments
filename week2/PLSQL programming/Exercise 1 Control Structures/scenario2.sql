SQL> DESC CUSTOMERS;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUSTOMERID                                NOT NULL NUMBER
 NAME                                               VARCHAR2(100)
 DOB                                                DATE
 BALANCE                                            NUMBER
 LASTMODIFIED                                       DATE

SQL> ALTER TABLE CUSTOMERS ADD ISVIP CHAR(10) CONSTRAINT CHK1 CHECK(ISVIP IN ('TRUE','FALSE')) ;

Table altered.

SQL> SELECT * FROM CUSTOMERS;

CUSTOMERID                                                                      
----------                                                                      
NAME                                                                            
--------------------------------------------------------------------------------
DOB          BALANCE LASTMODIF ISVIP                                            
--------- ---------- --------- ----------                                       
         1                                                                      
John Doe                                                                        
15-MAY-85       1000 07-JUN-24                                                  
                                                                                
         2                                                                      
Jane Smith                                                                      
20-JUL-90       1500 07-JUN-24                                                  

CUSTOMERID                                                                      
----------                                                                      
NAME                                                                            
--------------------------------------------------------------------------------
DOB          BALANCE LASTMODIF ISVIP                                            
--------- ---------- --------- ----------                                       
                                                                                

SQL> SET SERVEROUTPUT ON;
SQL> DECLARE
  2      CURSOR CUSTOMER_CURSOR IS
  3          SELECT CUSTOMERID, BALANCE
  4          FROM CUSTOMERS;
  5      VAR_CUSTOMER_ID CUSTOMERS.CUSTOMERID%TYPE;
  6      VAR_BALANCE CUSTOMERS.BALANCE%TYPE;
  7  BEGIN
  8      FOR CUSTOMER_RECORD IN CUSTOMER_CURSOR LOOP
  9          VAR_CUSTOMER_ID := CUSTOMER_RECORD.CUSTOMERID;
 10          VAR_BALANCE := CUSTOMER_RECORD.BALANCE;
 11          IF VAR_BALANCE > 10000 THEN
 12              DBMS_OUTPUT.PUT_LINE('CUSTOMER ID : ' || VAR_CUSTOMER_ID || ' HAS BALANCE GREATER THAN 10000');
 13              UPDATE CUSTOMERS
 14              SET ISVIP = 'TRUE'
 15              WHERE CUSTOMERID = VAR_CUSTOMER_ID;
 16          ELSE
 17              DBMS_OUTPUT.PUT_LINE('CUSTOMER ID : ' || VAR_CUSTOMER_ID || ' HAS BALANCE LESSER THAN 10000');
 18              UPDATE CUSTOMERS
 19              SET ISVIP = 'FALSE'
 20              WHERE CUSTOMERID = VAR_CUSTOMER_ID;
 21          END IF;
 22      END LOOP;
 23      COMMIT;
 24  END;
 25  /
CUSTOMER ID : 1 HAS BALANCE LESSER THAN 10000                                   
CUSTOMER ID : 2 HAS BALANCE LESSER THAN 10000                                   

PL/SQL procedure successfully completed.

SQL> SELECT * FROM CUSTOMERS;

CUSTOMERID                                                                      
----------                                                                      
NAME                                                                            
--------------------------------------------------------------------------------
DOB          BALANCE LASTMODIF ISVIP                                            
--------- ---------- --------- ----------                                       
         1                                                                      
John Doe                                                                        
15-MAY-85       1000 07-JUN-24 FALSE                                            
                                                                                
         2                                                                      
Jane Smith                                                                      
20-JUL-90       1500 07-JUN-24 FALSE                                            

CUSTOMERID                                                                      
----------                                                                      
NAME                                                                            
--------------------------------------------------------------------------------
DOB          BALANCE LASTMODIF ISVIP                                            
--------- ---------- --------- ----------                                       
                                                                                

SQL> SPOOL OFF