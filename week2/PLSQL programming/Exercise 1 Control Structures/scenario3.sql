SQL> SET SERVEROUTPUT ON;
SQL> DECLARE
  2      CURSOR CUR_LOANS IS
  3          SELECT L.LOANID, L.CUSTOMERID, C.NAME, L.ENDDATE
  4          FROM LOANS L
  5          JOIN CUSTOMERS C ON L.CUSTOMERID = C.CUSTOMERID
  6          WHERE L.ENDDATE BETWEEN SYSDATE AND SYSDATE + 30;
  7  
  8      V_LOAN_ID LOANS.LOANID%TYPE;
  9      V_CUSTOMER_ID LOANS.CUSTOMERID%TYPE;
 10      V_CUSTOMER_NAME CUSTOMERS.NAME%TYPE;
 11      V_END_DATE LOANS.ENDDATE%TYPE;
 12      V_FOUND BOOLEAN := FALSE;
 13  BEGIN
 14      OPEN CUR_LOANS;
 15      LOOP
 16          FETCH CUR_LOANS INTO V_LOAN_ID, V_CUSTOMER_ID, V_CUSTOMER_NAME, V_END_DATE;
 17          EXIT WHEN CUR_LOANS%NOTFOUND;
 18  
 19          V_FOUND := TRUE;
 20          DBMS_OUTPUT.PUT_LINE('Reminder: Loan ' || V_LOAN_ID || ' for customer ' || V_CUSTOMER_NAME || ' (ID: ' || V_CUSTOMER_ID || ') is due on ' || TO_CHAR(V_END_DATE, 'YYYY-MM-DD'));
 21      END LOOP;
 22      CLOSE CUR_LOANS;
 23  
 24      IF NOT V_FOUND THEN
 25          DBMS_OUTPUT.PUT_LINE('No loans are due within the next 30 days.');
 26      END IF;
 27  END;
 28  /
No loans are due within the next 30 days.                                       

PL/SQL procedure successfully completed.

SQL> SPOOL OFF