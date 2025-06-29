-- Enable Output
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
BEGIN
  DBMS_OUTPUT.PUT_LINE(' Path:C:\Users\Sahasra\OneDrive\Desktop\WEEK 2\WEEK_2_PL_SQL_HandsOn_Exercises\HandsOn_EXEC_4_Functions');
  DBMS_OUTPUT.PUT_LINE(' SCHEMA CREATED SUCCESSFULLY - Submitted by SAHASRA');
  DBMS_OUTPUT.PUT_LINE(' TABLES: Customers, Accounts, Transactions, Loans, Employees, AuditLog');
END;
/
--------------------------------------------------------------------------------
--  Scenario 1: Calculate age from DOB
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION CalculateAge (
    dob DATE
) RETURN NUMBER AS
BEGIN
    RETURN FLOOR(MONTHS_BETWEEN(SYSDATE, dob) / 12);
END;
/

-- Test: Age Function
BEGIN
    DBMS_OUTPUT.PUT_LINE('Age is: ' || CalculateAge(TO_DATE('1980-05-10','YYYY-MM-DD')));
END;
/

--------------------------------------------------------------------------------
-- Scenario 2: Calculate monthly installment for loan
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment (
    loan_amount    IN NUMBER,
    annual_rate    IN NUMBER,
    duration_years IN NUMBER
) RETURN NUMBER AS
    r NUMBER := annual_rate / (12 * 100); -- monthly interest rate
    n NUMBER := duration_years * 12;      -- total months
BEGIN
    RETURN ROUND(loan_amount * r * POWER(1 + r, n) / (POWER(1 + r, n) - 1), 2);
END;
/

--  Test: EMI Function
BEGIN
    DBMS_OUTPUT.PUT_LINE('EMI: ' || CalculateMonthlyInstallment(100000, 8, 5));
END;
/

--------------------------------------------------------------------------------
-- Scenario 3: Check sufficient balance
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION HasSufficientBalance (
    acc_id IN NUMBER,
    amt    IN NUMBER
) RETURN BOOLEAN AS
    bal NUMBER;
BEGIN
    SELECT Balance INTO bal FROM Accounts WHERE AccountID = acc_id;

    RETURN bal >= amt;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
    WHEN OTHERS THEN
        RETURN FALSE;
END;
/

-- ✅ Test: Balance Check Function
DECLARE
    result BOOLEAN;
BEGIN
    result := HasSufficientBalance(1, 500);

    IF result THEN
        DBMS_OUTPUT.PUT_LINE('Sufficient balance.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Not enough balance.');
    END IF;
END;
/
