SQL> SELECT * FROM ACCOUNTS;

 ACCOUNTID CUSTOMERID ACCOUNTTYPE             BALANCE LASTMODIF                 
---------- ---------- -------------------- ---------- ---------                 
         1          1 Savings                    1515 04-AUG-24                 
         2          2 Checking                   1000 04-AUG-24                 

SQL> SET SERVEROUTPUT ON;
SQL> 
SQL> CREATE OR REPLACE PROCEDURE TRANSFERFUNDS(
  2      P_FROM_ACCOUNT_ID IN ACCOUNTS.ACCOUNTID%TYPE,
  3      P_TO_ACCOUNT_ID IN ACCOUNTS.ACCOUNTID%TYPE,
  4      P_AMOUNT IN NUMBER
  5  ) AS
  6      V_FROM_BALANCE ACCOUNTS.BALANCE%TYPE;
  7  BEGIN
  8  
  9      SELECT BALANCE INTO V_FROM_BALANCE
 10      FROM ACCOUNTS
 11      WHERE ACCOUNTID = P_FROM_ACCOUNT_ID
 12      FOR UPDATE;
 13  
 14      -- Check for sufficient funds
 15      IF V_FROM_BALANCE < P_AMOUNT THEN
 16          RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds in the source account.');
 17      END IF;
 18  
 19      -- Perform the transfer
 20      UPDATE ACCOUNTS
 21      SET BALANCE = BALANCE - P_AMOUNT,
 22          LASTMODIFIED = SYSDATE
 23      WHERE ACCOUNTID = P_FROM_ACCOUNT_ID;
 24  
 25      UPDATE ACCOUNTS
 26      SET BALANCE = BALANCE + P_AMOUNT,
 27          LASTMODIFIED = SYSDATE
 28      WHERE ACCOUNTID = P_TO_ACCOUNT_ID;
 29  
 30      COMMIT;
 31      DBMS_OUTPUT.PUT_LINE('Transfer of ' || P_AMOUNT || ' from account ' || P_FROM_ACCOUNT_ID || ' to account ' || P_TO_ACCOUNT_ID || ' completed successfully.');
 32  EXCEPTION
 33      WHEN OTHERS THEN
 34          ROLLBACK;
 35          DBMS_OUTPUT.PUT_LINE('Transfer failed: ' || SQLERRM);
 36  END TRANSFERFUNDS;
 37  /

Procedure created.

SQL> 
SQL> EXEC TRANSFERFUNDS(1,2,100);
Transfer of 100 from account 1 to account 2 completed successfully.             

PL/SQL procedure successfully completed.

SQL> 
SQL> SELECT * FROM ACCOUNTS;

 ACCOUNTID CUSTOMERID ACCOUNTTYPE             BALANCE LASTMODIF                 
---------- ---------- -------------------- ---------- ---------                 
         1          1 Savings                    1415 07-JUN-24                 
         2          2 Checking                   1100 07-JUN-24                 

SQL> SPOOL OFF