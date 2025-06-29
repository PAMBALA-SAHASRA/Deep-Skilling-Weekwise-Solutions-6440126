--  Enable Output
SET SERVEROUTPUT ON;

--  Safe Drop Blocks
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

-- Sample Data Insertions
INSERT INTO Customers VALUES (1, 'John Doe', TO_DATE('1960-05-15','YYYY-MM-DD'), 9500, SYSDATE);
INSERT INTO Customers VALUES (2, 'Jane Smith', TO_DATE('1990-07-20','YYYY-MM-DD'), 15000, SYSDATE);

INSERT INTO Accounts VALUES (1, 1, 'Savings', 1000, SYSDATE);
INSERT INTO Accounts VALUES (2, 2, 'Checking', 1500, SYSDATE);

INSERT INTO Transactions VALUES (1, 1, SYSDATE, 200, 'Deposit');
INSERT INTO Transactions VALUES (2, 2, SYSDATE, 300, 'Withdrawal');

INSERT INTO Loans VALUES (1, 1, 5000, 5.0, SYSDATE, ADD_MONTHS(SYSDATE, 60));

INSERT INTO Employees VALUES (1, 'Alice Johnson', 'Manager', 70000, 'HR', TO_DATE('2015-06-15', 'YYYY-MM-DD'));
INSERT INTO Employees VALUES (2, 'Bob Brown', 'Developer', 60000, 'IT', TO_DATE('2017-03-20', 'YYYY-MM-DD'));

COMMIT;
/
/
BEGIN
  DBMS_OUTPUT.PUT_LINE(' Path:C:\Users\Sahasra\OneDrive\Desktop\WEEK 2\WEEK_2_PL_SQL_HandsOn_Exercises\HandsOn_EXEC_3_StoredProcedures');
  DBMS_OUTPUT.PUT_LINE(' SCHEMA CREATED SUCCESSFULLY - Submitted by SAHASRA');
  DBMS_OUTPUT.PUT_LINE(' TABLES: Customers, Accounts, Transactions, Loans, Employees, AuditLog');
END;
/
--------------------------------------------------------------------------------
-- Scenario 1: Process monthly interest for savings accounts (1% interest)
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
UPDATE Accounts
SET Balance = Balance + (Balance * 0.01)
WHERE AccountType = 'Savings';

DBMS_OUTPUT.PUT_LINE(' Monthly interest applied to all savings accounts.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

BEGIN
    ProcessMonthlyInterest;
END;
/

--------------------------------------------------------------------------------
--  Scenario 2: Add bonus to all employees in a given department
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    dept_name IN VARCHAR2,
    bonus_pct IN NUMBER
) AS
BEGIN
UPDATE Employees
SET Salary = Salary + (Salary * bonus_pct / 100)
WHERE Department = dept_name;

DBMS_OUTPUT.PUT_LINE(' Bonus applied to department: ' || dept_name);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

BEGIN
    UpdateEmployeeBonus('IT', 10); -- Example: Add 10% bonus to IT dept
END;
/

--------------------------------------------------------------------------------
-- Scenario 3: Transfer funds between two accounts with check
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE TransferFunds (
    source_acc IN NUMBER,
    target_acc IN NUMBER,
    amount     IN NUMBER
) AS
    balance_source NUMBER;
BEGIN
SELECT Balance INTO balance_source FROM Accounts WHERE AccountID = source_acc;

IF balance_source < amount THEN
        DBMS_OUTPUT.PUT_LINE('Error: Not enough balance in source account.');
ELSE
UPDATE Accounts SET Balance = Balance - amount WHERE AccountID = source_acc;
UPDATE Accounts SET Balance = Balance + amount WHERE AccountID = target_acc;
DBMS_OUTPUT.PUT_LINE(' Funds transferred successfully.');
END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: One or both account IDs do not exist.');
WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/

BEGIN
    TransferFunds(1, 2, 500); -- Example test case
END;
/