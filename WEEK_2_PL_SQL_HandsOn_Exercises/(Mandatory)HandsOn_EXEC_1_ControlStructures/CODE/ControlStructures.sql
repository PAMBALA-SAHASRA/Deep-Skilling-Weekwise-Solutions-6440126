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

-- Table: Loans
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
  DBMS_OUTPUT.PUT_LINE(' Path:C:\Users\Sahasra\OneDrive\Desktop\WEEK 2\WEEK_2_PL_SQL_HandsOn_Exercises\HandsOn_EXEC_1_ControlStructures');
  DBMS_OUTPUT.PUT_LINE(' SCHEMA CREATED SUCCESSFULLY - Submitted by PAMBALA SAHASRA');
  DBMS_OUTPUT.PUT_LINE(' TABLES: Customers, Accounts, Transactions, Loans, Employees, AuditLog');
END;
/
-- Scenario 1: Apply 1% discount to interest rates for customers above 60
BEGIN
  FOR cust IN (
    SELECT c.CustomerID, l.LoanID, l.InterestRate, c.DOB
    FROM Customers c
    JOIN Loans l ON c.CustomerID = l.CustomerID
  ) LOOP
    IF MONTHS_BETWEEN(SYSDATE, cust.DOB)/12 > 60 THEN
      UPDATE Loans
      SET InterestRate = InterestRate - 1
      WHERE LoanID = cust.LoanID;
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(' Discount applied for senior customers.');
END;
/

-- Scenario 2: Promote to VIP if balance > 10000
BEGIN
  EXECUTE IMMEDIATE 'ALTER TABLE Customers ADD (IsVIP VARCHAR2(5))';
EXCEPTION
  WHEN OTHERS THEN NULL; -- Ignore if column already exists
END;
/

BEGIN
  UPDATE Customers
  SET IsVIP = 'TRUE'
  WHERE Balance > 10000;
  DBMS_OUTPUT.PUT_LINE(' VIP flags updated.');
END;
/

-- Scenario 3: Remind customers with loans due in next 30 days
BEGIN
  FOR due_loan IN (
    SELECT l.LoanID, c.Name, l.EndDate
    FROM Loans l
    JOIN Customers c ON c.CustomerID = l.CustomerID
    WHERE l.EndDate <= SYSDATE + 30
  ) LOOP
    DBMS_OUTPUT.PUT_LINE(' Reminder: Loan ID ' || due_loan.LoanID || ' for ' || due_loan.Name ||
                         ' is due on ' || TO_CHAR(due_loan.EndDate, 'DD-MON-YYYY'));
  END LOOP;
END;
/