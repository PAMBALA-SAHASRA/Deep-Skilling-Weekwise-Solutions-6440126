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
)
/

-- ✅ Table: Accounts
CREATE TABLE Accounts (
  AccountID NUMBER PRIMARY KEY,
  CustomerID NUMBER,
  AccountType VARCHAR2(20),
  Balance NUMBER,
  LastModified DATE,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)
/

-- Table: Transactions
CREATE TABLE Transactions (
  TransactionID NUMBER PRIMARY KEY,
  AccountID NUMBER,
  TransactionDate DATE,
  Amount NUMBER,
  TransactionType VARCHAR2(10),
  FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
)
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
)
/

-- Table: Employees
CREATE TABLE Employees (
  EmployeeID NUMBER PRIMARY KEY,
  Name VARCHAR2(100),
  Position VARCHAR2(50),
  Salary NUMBER,
  Department VARCHAR2(50),
  HireDate DATE
)
/

-- Table: AuditLog
CREATE TABLE AuditLog (
  AuditID NUMBER GENERATED ALWAYS AS IDENTITY,
  AccountID NUMBER,
  ActionType VARCHAR2(20),
  ActionTime DATE
)
END;
/
