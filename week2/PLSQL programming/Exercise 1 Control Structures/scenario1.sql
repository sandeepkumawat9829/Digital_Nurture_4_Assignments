SQL> SELECT * FROM ACCOUNTS;

 ACCOUNTID CUSTOMERID ACCOUNTTYPE             BALANCE LASTMODIF                 
---------- ---------- -------------------- ---------- ---------                 
         1          1 Savings                    1500 07-JUN-24                 
         2          2 Checking                   1000 07-JUN-24                 

SQL> SET SERVEROUTPUT ON;
SQL> CREATE OR REPLACE PROCEDURE PROCESSMONTHLYINTEREST AS
  2  BEGIN
  3      UPDATE ACCOUNTS
  4      SET BALANCE = BALANCE * 1.01,
  5          LASTMODIFIED = SYSDATE
  6      WHERE ACCOUNTTYPE = 'Savings';
  7  
  8      COMMIT;
  9      DBMS_OUTPUT.PUT_LINE('Monthly interest processed for all savings accounts.');
 10  EXCEPTION
 11      WHEN OTHERS THEN
 12          ROLLBACK;
 13          DBMS_OUTPUT.PUT_LINE('Error processing monthly interest: ' || SQLERRM);
 14  END PROCESSMONTHLYINTEREST;
 15  /

Procedure created.

SQL> 
SQL> EXEC PROCESSMONTHLYINTEREST();
Monthly interest processed for all savings accounts.                            

PL/SQL procedure successfully completed.

SQL> 
SQL> SELECT * FROM ACCOUNTS;

 ACCOUNTID CUSTOMERID ACCOUNTTYPE             BALANCE LASTMODIF                 
---------- ---------- -------------------- ---------- ---------                 
         1          1 Savings                    1515 07-JUN-24                 
         2          2 Checking                   1000 07-JUN-24                 

SQL> SPOOL OFF