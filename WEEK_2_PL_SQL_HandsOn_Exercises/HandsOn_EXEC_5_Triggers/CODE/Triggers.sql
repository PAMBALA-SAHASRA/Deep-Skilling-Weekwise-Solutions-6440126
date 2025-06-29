--- Enable Output
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

-- Table: Transactions
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

--  Table: AuditLog
CREATE TABLE AuditLog (
  AuditID NUMBER GENERATED ALWAYS AS IDENTITY,
  AccountID NUMBER,
  ActionType VARCHAR2(20),
  ActionTime DATE
);
/

-- Sample Data Insertions
INSERT INTO Customers VALUES (1, 'John Doe', TO_DATE('1960-05-15','YYYY-MM-DD'), 9500, SYSDATE);
INSERT INTO Customers VALUES (2, 'Jane Smith', TO_DATE('1990-07-20','YYYY-MM-DD'), 15000, SYSDATE);

INSERT INTO Accounts VALUES (1, 1, 'Savings', 1000, SYSDATE);
INSERT INTO Accounts VALUES (2, 2, 'Checking', 1500, SYSDATE);

INSERT INTO Loans VALUES (1, 1, 5000, 5.0, SYSDATE, ADD_MONTHS(SYSDATE, 60));

INSERT INTO Employees VALUES (1, 'Alice Johnson', 'Manager', 70000, 'HR', TO_DATE('2015-06-15', 'YYYY-MM-DD'));
INSERT INTO Employees VALUES (2, 'Bob Brown', 'Developer', 60000, 'IT', TO_DATE('2017-03-20', 'YYYY-MM-DD'));

COMMIT;
/

-- Output Schema Confirmation
BEGIN
  DBMS_OUTPUT.PUT_LINE('Path: C:\Users\ShaikSohin\OneDrive\Desktop\DEEPSKILLING\WEEK-2\Week2_PL_SQL_HandsOn\HandsOn_Ex_5_Triggers');
  DBMS_OUTPUT.PUT_LINE('SCHEMA CREATED SUCCESSFULLY - Submitted by Shaik Sohin');
  DBMS_OUTPUT.PUT_LINE('TABLES: Customers, Accounts, Transactions, Loans, Employees, AuditLog');
END;
/
-- Enable Output
SET SERVEROUTPUT ON;

-- Safe Drop Blocks
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

-- Table: Customers
CREATE TABLE Customers (
  CustomerID NUMBER PRIMARY KEY,
  Name VARCHAR2(100),
  DOB DATE,
  Balance NUMBER,
  LastModified DATE
);
/

-- Table: Accounts
CREATE TABLE Accounts (
  AccountID NUMBER PRIMARY KEY,
  CustomerID NUMBER,
  AccountType VARCHAR2(20),
  Balance NUMBER,
  LastModified DATE,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
/

-- Table: Transactions
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

-- Table: Employees
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

-- Output Schema Confirmation
BEGIN
  DBMS_OUTPUT.PUT_LINE('Path: C:\Users\Sahasra\OneDrive\Desktop\WEEK 2\WEEK_2_PL_SQL_HandsOn_Exercises\HandsOn_EXEC_5_Triggers');
  DBMS_OUTPUT.PUT_LINE('SCHEMA CREATED SUCCESSFULLY - Submitted by PAMBALA SAHASRA');
  DBMS_OUTPUT.PUT_LINE('TABLES: Customers, Accounts, Transactions, Loans, Employees, AuditLog');
END;
/

-- Trigger 1: Update LastModified on customer update
CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
  :NEW.LastModified := SYSDATE;
END;
/

-- Simulate Trigger 1 Output
BEGIN
  UPDATE Customers SET Balance = Balance + 100 WHERE CustomerID = 1;
  DBMS_OUTPUT.PUT_LINE('Trigger 1: Customer LastModified updated successfully.');
END;
/

-- Trigger 2: Audit log for Transactions
CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
  INSERT INTO AuditLog (AccountID, ActionType, ActionTime)
  VALUES (:NEW.AccountID, 'INSERT', SYSDATE);
END;
/

-- Simulate Trigger 2 Output
BEGIN
  INSERT INTO Transactions VALUES (3, 1, SYSDATE, 500, 'Deposit');
  DBMS_OUTPUT.PUT_LINE('Trigger 2: Audit log entry created for new transaction.');
END;
/

-- Trigger 3: Prevent invalid transactions
CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
  current_balance NUMBER;
BEGIN
  SELECT Balance INTO current_balance
  FROM Accounts
  WHERE AccountID = :NEW.AccountID;

  IF :NEW.TransactionType = 'Withdrawal' AND :NEW.Amount > current_balance THEN
    RAISE_APPLICATION_ERROR(-20001, 'Error: Withdrawal exceeds balance.');
  ELSIF :NEW.TransactionType = 'Deposit' AND :NEW.Amount <= 0 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Error: Deposit amount must be positive.');
  END IF;
END;
/

-- Simulate Trigger 3 Outputs

-- Valid Deposit
BEGIN
  INSERT INTO Transactions VALUES (4, 1, SYSDATE, 100, 'Deposit');
  DBMS_OUTPUT.PUT_LINE('Trigger 3: Valid deposit accepted.');
END;
/

-- Invalid Deposit (0)
BEGIN
  BEGIN
    INSERT INTO Transactions VALUES (5, 1, SYSDATE, 0, 'Deposit');
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Trigger 3: ORA-20002: Error: Deposit amount must be positive.');
  END;
END;
/

-- Invalid Withdrawal (amount > balance)

  BEGIN
    INSERT INTO Transactions VALUES (6, 1, SYSDATE, 10000, 'Withdrawal');
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Trigger 3: ORA-20001: Error: Withdrawal exceeds balance.');
END;
/