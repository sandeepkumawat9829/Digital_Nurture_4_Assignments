SQL> CREATE TABLE CUSTOMERS (
  2      CUSTOMERID   NUMBER PRIMARY KEY,
  3      NAME         VARCHAR2(100),
  4      DOB          DATE,
  5      BALANCE      NUMBER,
  6      LASTMODIFIED DATE
  7  );

Table created.

SQL> CREATE TABLE ACCOUNTS (
  2      ACCOUNTID    NUMBER PRIMARY KEY,
  3      CUSTOMERID   NUMBER,
  4      ACCOUNTTYPE  VARCHAR2(20),
  5      BALANCE      NUMBER,
  6      LASTMODIFIED DATE,
  7      FOREIGN KEY ( CUSTOMERID )
  8          REFERENCES CUSTOMERS ( CUSTOMERID )
  9  );

Table created.

SQL> CREATE TABLE TRANSACTIONS (
  2      TRANSACTIONID   NUMBER PRIMARY KEY,
  3      ACCOUNTID       NUMBER,
  4      TRANSACTIONDATE DATE,
  5      AMOUNT          NUMBER,
  6      TRANSACTIONTYPE VARCHAR2(10),
  7      FOREIGN KEY ( ACCOUNTID )
  8          REFERENCES ACCOUNTS ( ACCOUNTID )
  9  );

Table created.

SQL> CREATE TABLE LOANS (
  2      LOANID       NUMBER PRIMARY KEY,
  3      CUSTOMERID   NUMBER,
  4      LOANAMOUNT   NUMBER,
  5      INTERESTRATE NUMBER,
  6      STARTDATE    DATE,
  7      ENDDATE      DATE,
  8      FOREIGN KEY ( CUSTOMERID )
  9          REFERENCES CUSTOMERS ( CUSTOMERID )
 10  );

Table created.

SQL> CREATE TABLE EMPLOYEES (
  2      EMPLOYEEID NUMBER PRIMARY KEY,
  3      NAME       VARCHAR2(100),
  4      POSITION   VARCHAR2(50),
  5      SALARY     NUMBER,
  6      DEPARTMENT VARCHAR2(50),
  7      HIREDATE   DATE
  8  );

Table created.

SQL> -- INSERT INTO CUSTOMERS
SQL> INSERT INTO CUSTOMERS (CUSTOMERID, NAME, DOB, BALANCE, LASTMODIFIED)
  2  VALUES (1, 'John Doe', TO_DATE('1985-05-15', 'YYYY-MM-DD'), 1000, SYSDATE);

1 row created.

SQL> INSERT INTO CUSTOMERS (CUSTOMERID, NAME, DOB, BALANCE, LASTMODIFIED)
  2  VALUES (2, 'Jane Smith', TO_DATE('1990-07-20', 'YYYY-MM-DD'), 1500, SYSDATE);

1 row created.

SQL> SELECT * FROM CUSTOMERS;

CUSTOMERID                                                                      
----------                                                                      
NAME                                                                            
--------------------------------------------------------------------------------
DOB          BALANCE LASTMODIF                                                   
--------- ---------- ---------                                                   
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
DOB          BALANCE LASTMODIF                                                   
--------- ---------- ---------                                                   
                                                                                 

SQL> -- INSERT INTO ACCOUNTS
SQL> INSERT INTO ACCOUNTS (ACCOUNTID, CUSTOMERID, ACCOUNTTYPE, BALANCE, LASTMODIFIED)
  2  VALUES (1, 1, 'Savings', 1000, SYSDATE);

1 row created.

SQL> INSERT INTO ACCOUNTS (ACCOUNTID, CUSTOMERID, ACCOUNTTYPE, BALANCE, LASTMODIFIED)
  2  VALUES (2, 2, 'Checking', 1500, SYSDATE);

1 row created.

SQL> SELECT * FROM ACCOUNTS;

 ACCOUNTID CUSTOMERID ACCOUNTTYPE             BALANCE LASTMODIF                 
---------- ---------- -------------------- ---------- ---------                 
         1          1 Savings                    1000 07-JUN-24                 
         2          2 Checking                   1500 07-JUN-24                 

SQL> -- INSTER INTO TRANSACTIONS
SQL> INSERT INTO TRANSACTIONS (TRANSACTIONID, ACCOUNTID, TRANSACTIONDATE, AMOUNT, TRANSACTIONTYPE)
  2  VALUES (1, 1, SYSDATE, 200, 'Deposit');

1 row created.

SQL> INSERT INTO TRANSACTIONS (TRANSACTIONID, ACCOUNTID, TRANSACTIONDATE, AMOUNT, TRANSACTIONTYPE)
  2  VALUES (2, 2, SYSDATE, 300, 'Withdrawal');

1 row created.

SQL> SELECT * FROM TRANSACTIONS;

TRANSACTIONID  ACCOUNTID TRANSACTI     AMOUNT TRANSACTIO                       
------------- ---------- --------- ---------- ----------                       
            1          1 07-JUN-24        200 Deposit                          
            2          2 07-JUN-24        300 Withdrawal                       

SQL> -- INSERT INTO LOANS
SQL> INSERT INTO LOANS (LOANID, CUSTOMERID, LOANAMOUNT, INTERESTRATE, STARTDATE, ENDDATE)
  2  VALUES (1, 1, 5000, 5, SYSDATE, ADD_MONTHS(SYSDATE, 60));

1 row created.

SQL> SELECT * FROM LOANS;

    LOANID CUSTOMERID LOANAMOUNT INTERESTRATE STARTDATE ENDDATE                
---------- ---------- ---------- ------------ --------- ---------              
         1          1       5000            5 07-JUN-24 07-JUN-29              

SQL> -- INSERT INTO EMPLOYEES
SQL> INSERT INTO EMPLOYEES (EMPLOYEEID, NAME, POSITION, SALARY, DEPARTMENT, HIREDATE)
  2  VALUES (1, 'Alice Johnson', 'Manager', 70000, 'HR', TO_DATE('2015-06-15', 'YYYY-MM-DD'));

1 row created.

SQL> INSERT INTO EMPLOYEES (EMPLOYEEID, NAME, POSITION, SALARY, DEPARTMENT, HIREDATE)
  2  VALUES (2, 'Bob Brown', 'Developer', 60000, 'IT', TO_DATE('2017-03-20', 'YYYY-MM-DD'));

1 row created.

SQL> SELECT * FROM EMPLOYEES;

EMPLOYEEID                                                                      
----------                                                                      
NAME                                                                            
--------------------------------------------------------------------------------
POSITION                                               SALARY                   
-------------------------------------------------- ----------                   
DEPARTMENT                                         HIREDATE                     
-------------------------------------------------- ---------                   
         1                                                                      
Alice Johnson                                                                   
Manager                                                 70000                   
HR                                                 15-JUN-15                   
                                                                                 
         2                                                                      
Bob Brown                                                                       
Developer                                               60000                   
IT                                                 20-MAR-17                   
                                                                                 

SQL> SPOOL OFF;