--  Enable Output
SET SERVEROUTPUT ON;

--  Safe Drop Blocks
BEGIN EXECUTE IMMEDIATE 'DROP TABLE AuditLog CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Transactions CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Accounts CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Loans CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Customers CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Employees CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

--  Table: Customers
CREATE TABLE Customers (
  CustomerID NUMBER PRIMARY KEY,
  Name VARCHAR2(100),
  DOB DATE,
  Balance NUMBER,
  LastModified DATE
);
/

--  Table: Accounts
CREATE TABLE Accounts (
  AccountID NUMBER PRIMARY KEY,
  CustomerID NUMBER,
  AccountType VARCHAR2(20),
  Balance NUMBER,
  LastModified DATE,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
/

--  Table: Transactions
CREATE TABLE Transactions (
  TransactionID NUMBER PRIMARY KEY,
  AccountID NUMBER,
  TransactionDate DATE,
  Amount NUMBER,
  TransactionType VARCHAR2(10),
  FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
/

--  Table: Loans
CREATE TABLE Loans (
  LoanID NUMBER PRIMARY KEY,
  CustomerID NUMBER,
  LoanAmount NUMBER,
  InterestRate NUMBER,
  StartDate DATE,
  EndDate DATE,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
/

--  Table: Employees
CREATE TABLE Employees (
  EmployeeID NUMBER PRIMARY KEY,
  Name VARCHAR2(100),
  Position VARCHAR2(50),
  Salary NUMBER,
  Department VARCHAR2(50),
  HireDate DATE
);
/

-- Table: AuditLog
CREATE TABLE AuditLog (
  AuditID NUMBER GENERATED ALWAYS AS IDENTITY,
  AccountID NUMBER,
  ActionType VARCHAR2(20),
  ActionTime DATE
);
/

-- Sample Data Insertions
INSERT INTO Customers VALUES (1, 'SAHASRA', TO_DATE('1960-05-15','YYYY-MM-DD'), 9500, SYSDATE);
INSERT INTO Customers VALUES (2, 'SMITHA', TO_DATE('1990-07-20','YYYY-MM-DD'), 15000, SYSDATE);

INSERT INTO Accounts VALUES (1, 1, 'Savings', 1000, SYSDATE);
INSERT INTO Accounts VALUES (2, 2, 'Checking', 1500, SYSDATE);

INSERT INTO Loans VALUES (1, 1, 5000, 5.0, SYSDATE, ADD_MONTHS(SYSDATE, 60));

INSERT INTO Employees VALUES (1, 'BOBBY', 'Manager', 70000, 'HR', TO_DATE('2015-06-15', 'YYYY-MM-DD'));
INSERT INTO Employees VALUES (2, 'CHARLIE', 'Developer', 60000, 'IT', TO_DATE('2017-03-20', 'YYYY-MM-DD'));

COMMIT;
/

--  Output Schema Confirmation
BEGIN
  DBMS_OUTPUT.PUT_LINE(' Path:C:\Users\Sahasra\OneDrive\Desktop\WEEK 2\WEEK_2_PL_SQL_HandsOn_Exercises\HandsOn_EXEC_7_Packages');
  DBMS_OUTPUT.PUT_LINE(' SCHEMA CREATED SUCCESSFULLY - Submitted by SAHASRA');
  DBMS_OUTPUT.PUT_LINE(' TABLES: Customers, Accounts, Transactions, Loans, Employees, AuditLog');
END;
/
DECLARE
-- Cursor for monthly statements
CURSOR cur_monthly_statements IS
SELECT c.CustomerID, c.Name, t.TransactionID, t.TransactionDate, t.Amount, t.TransactionType
FROM Customers c
         JOIN Accounts a ON c.CustomerID = a.CustomerID
         JOIN Transactions t ON a.AccountID = t.AccountID
WHERE TRUNC(t.TransactionDate, 'MM') = TRUNC(SYSDATE, 'MM')
ORDER BY c.CustomerID, t.TransactionDate;

-- Cursor for applying annual fee
CURSOR cur_accounts IS SELECT AccountID, Balance FROM Accounts;

-- Cursor for updating loan interest rates
CURSOR cur_loans IS SELECT LoanID, InterestRate FROM Loans;

v_current_customer Customers.CustomerID%TYPE := NULL;
  v_annual_fee CONSTANT NUMBER := 100;
  v_interest_increase CONSTANT NUMBER := 0.5;

BEGIN
  -- 1. Generate Monthly Statements
  DBMS_OUTPUT.PUT_LINE('--- Monthly Statements ---');
FOR rec IN cur_monthly_statements LOOP
    IF v_current_customer != rec.CustomerID THEN
      DBMS_OUTPUT.PUT_LINE(CHR(10) || 'Customer: ' || rec.Name || ' (ID: ' || rec.CustomerID || ')');
      v_current_customer := rec.CustomerID;
END IF;
    DBMS_OUTPUT.PUT_LINE('Transaction ' || rec.TransactionID || ': ' || TO_CHAR(rec.TransactionDate, 'DD-MON-YYYY') ||
                         ', Amount: ' || rec.Amount || ', Type: ' || rec.TransactionType);
END LOOP;

  -- 2. Apply Annual Fee to All Accounts
FOR rec IN cur_accounts LOOP
UPDATE Accounts
SET Balance = Balance - v_annual_fee,
    LastModified = SYSDATE
WHERE AccountID = rec.AccountID;
END LOOP;
  DBMS_OUTPUT.PUT_LINE(CHR(10) || 'Annual fees applied to all accounts.');

  -- 3. Update Loan Interest Rates
FOR rec IN cur_loans LOOP
UPDATE Loans
SET InterestRate = InterestRate + v_interest_increase
WHERE LoanID = rec.LoanID;
END LOOP;
  DBMS_OUTPUT.PUT_LINE('Loan interest rates updated.');

COMMIT;
END;
/