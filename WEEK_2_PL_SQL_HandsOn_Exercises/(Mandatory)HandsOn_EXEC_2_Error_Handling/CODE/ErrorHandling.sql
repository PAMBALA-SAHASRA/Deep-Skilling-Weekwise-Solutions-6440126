-- Enable Output
SET SERVEROUTPUT ON;

-- Safe Drop Blocks
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
-- Output Schema Confirmation
BEGIN
  DBMS_OUTPUT.PUT_LINE('Path:C:\Users\Sahasra\OneDrive\Desktop\WEEK 2\WEEK_2_PL_SQL_HandsOn_Exercises\HandsOn_EXEC_2_Error_Handling');
  DBMS_OUTPUT.PUT_LINE('SCHEMA CREATED SUCCESSFULLY - Submitted by PAMBALA SAHASRA');
  DBMS_OUTPUT.PUT_LINE('TABLES: Customers, Accounts, Transactions, Loans, Employees, AuditLog');
END;
/
--------------------------------------------------------------------------------
-- Scenario 1: Safe fund transfer with error handling
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE SafeTransferFunds (
    from_acc_id IN NUMBER,
    to_acc_id   IN NUMBER,
    amount      IN NUMBER
) AS
    insufficient_balance EXCEPTION;
    from_balance NUMBER;
BEGIN
    SELECT Balance INTO from_balance FROM Accounts WHERE AccountID = from_acc_id;

    IF from_balance < amount THEN
        RAISE insufficient_balance;
    END IF;

    UPDATE Accounts SET Balance = Balance - amount WHERE AccountID = from_acc_id;
    UPDATE Accounts SET Balance = Balance + amount WHERE AccountID = to_acc_id;

    DBMS_OUTPUT.PUT_LINE(' Funds transferred successfully.');

EXCEPTION
    WHEN insufficient_balance THEN
        DBMS_OUTPUT.PUT_LINE('Error: Insufficient funds in source account.');
        ROLLBACK;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
        ROLLBACK;
END;
/

BEGIN
    SafeTransferFunds(1, 2, 2000);  -- Test case
END;
/

--------------------------------------------------------------------------------
-- Scenario 2: Update salary with employee existence check
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE UpdateSalary (
    emp_id     IN NUMBER,
    increment  IN NUMBER
) AS
    current_salary NUMBER;
BEGIN
    SELECT Salary INTO current_salary FROM Employees WHERE EmployeeID = emp_id;

    UPDATE Employees
    SET Salary = current_salary + (current_salary * increment / 100)
    WHERE EmployeeID = emp_id;

    DBMS_OUTPUT.PUT_LINE(' Salary updated successfully.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ID not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/

BEGIN
    UpdateSalary(99, 10);  -- Test with non-existing ID
END;
/

--------------------------------------------------------------------------------
-- Scenario 3: Add new customer with duplicate ID check
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE AddNewCustomer (
    id     IN NUMBER,
    name   IN VARCHAR2,
    dob    IN DATE,
    bal    IN NUMBER
) AS
BEGIN
    INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
    VALUES (id, name, dob, bal, SYSDATE);

    DBMS_OUTPUT.PUT_LINE(' Customer added successfully.');

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Customer ID already exists.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/

BEGIN
    AddNewCustomer(1, 'Alice', TO_DATE('1995-01-01','YYYY-MM-DD'), 5000);  -- Test duplicate ID
END;
/