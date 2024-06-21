# Banking-Industry-Analysis-SQL


## Table Of Contents
- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Data Cleaning and Preparation](#data-cleaning-and-preparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Data Analysis](#data-analysis)
- [Results of Findings](#results-of-findings)
- [Recommendations](#recommendations)
- [Limitations](#limitations)

### Project Overview
This project involves analyzing customer and transaction data from two bank branches: the Mobay branch and the Cayman branch. The goal is to identify customers eligible for loans and credit card services, determine customers who haven't conducted transactions in the past six months, and analyze loan details and outstanding amounts. This project was of personal interest as I've always been interested in the banking industry and was curious as to how financial institutions are able to maintain an effective, well structured system which allows for the storage and retrieval of banking information across different branches.

### Data Sources
The data used in this project comes from multiple tables representing the different branches- Mobay and Cayman as well as the customers' information.

#### The tools used were:
- SQL for data querying and manipulation
- Excel for Data Visualization
  
### Data Cleaning and Preparation
- The data was cleaned and properly formatted for analysis.
- Any missing values were removed.

The Data Cleaning and Preparation process included:

#### Removing duplicate customers in Mobay branch
```
DELETE FROM Customer_mobaybranch
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM Customer_mobaybranch
    GROUP BY Customer_id
);
```
#### Removing duplicate customers in Cayman branch
```
DELETE FROM Customer_Caymanbranch
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM Customer_Caymanbranch
    GROUP BY Customer_id
);
```
### Exploratory Data Analysis

 Based on the Banking Analysis project, the Mobay branch services an equal number of male and female customers, with an even distribution between single and married individuals. The accounts held by the customers are split evenly between savings and current accounts, which could give some insight into the varying financial needs of the customers. Based on the transaction history, there is active customer engagement, with deposits ranging from $5,000 to $75,000. The Mobay Branch has also issued multiple loans with varying amounts and interest rates, which is indicative of the branch's commitment to supporting the financial goals of the customers. All customers have passed their background verification, ensuring a trustworthy clientele. The issued debit cards have expiration dates extending up to 2029, which suggests that there are regular updates and replacements of the debit cards.
 
The Cayman branch, however, has a slightly higher proportion of female and married customers. Most of the customers have opted for savings accounts over current accounts. Based on the transaction data, there was a wide range of deposit amounts and one notable withdrawal. The branch has approved a significant loan amount of $1,000,000 with a 10% interest rate, which indicates the capacity of the branch to handle high-value loans. Like the Mobay Branch, all the customers affiliated with the Cayman Branch have passed background verification, and debit cards are the sole type issued, with expiration dates suggesting ongoing card management. 

### Data Analysis

#### Customers Eligible for a Loan:
```sql
SELECT * FROM account_mobaybranch WHERE TIMESTAMPDIFF(YEAR, acct_st_dt, NOW()) >= 2;
SELECT * FROM account_caymanbranch WHERE TIMESTAMPDIFF(YEAR, acct_st_dt, NOW()) >= 2;
```

### Customers eligible for the Credit Card Service
```sql
SELECT acct_id, IF(SUM(tran_amt) >= 100000, 'ELIGIBLE', 'NOT ELIGIBLE') AS 'CREDIT CARD APPROVAL - MOBAY BRANCH' 
FROM transactions_mobaybranch
GROUP BY acct_id;

SELECT acct_id, IF(SUM(tran_amt) >= 100000, 'ELIGIBLE', 'NOT ELIGIBLE') AS 'CREDIT CARD APPROVAL - CAYMAN BRANCH' 
FROM transactions_caymanbranch
GROUP BY acct_id;
```
### Customers who have conducted no transactions for the past six(6) months
```sql
SELECT acct_id, MAX(tran_date) AS 'LAST TRANSACTION DATE PAST 6 MONTHS: MOBAY BRANCH' 
FROM transactions_mobaybranch 
WHERE TIMESTAMPDIFF(MONTH, tran_date, NOW()) >= 6 
GROUP BY acct_id;

SELECT acct_id, MAX(tran_date) AS 'LAST TRANSACTION DATE PAST 6 MONTHS: CAYMAN BRANCH' 
FROM transactions_caymanbranch 
WHERE TIMESTAMPDIFF(MONTH, tran_date, NOW()) >= 6 
GROUP BY acct_id;
```
### Updating Customer Status and Comments
```sql
UPDATE Customer_MOBAYBRANCH
SET cust_status = 'Active', comments = 'Transaction conducted within the last 1-6 months'
WHERE acct_id IN (
    SELECT acct_id 
    FROM transactions_mobaybranch 
    WHERE TIMESTAMPDIFF(MONTH, tran_date, NOW()) <= 6
);

UPDATE Customer_CAYMANBRANCH
SET cust_status = 'Active', comments = 'Transaction conducted within the last 1-6 months'
WHERE acct_id IN (
    SELECT acct_id 
    FROM transactions_caymanbranch 
    WHERE TIMESTAMPDIFF(MONTH, tran_date, NOW()) <= 6
);

UPDATE Customer_mobaybranch
SET cust_status = 'Inactive', comments = 'No transaction conducted within the past 6 months'
WHERE acct_id IN (
    SELECT acct_id 
    FROM transactions_mobaybranch 
    WHERE TIMESTAMPDIFF(MONTH, tran_date, NOW()) > 6
);

UPDATE Customer_caymanbranch
SET cust_status = 'Inactive', comments = 'No transaction conducted within the past 6 months'
WHERE acct_id IN (
    SELECT acct_id 
    FROM transactions_caymanbranch 
    WHERE TIMESTAMPDIFF(MONTH, tran_date, NOW()) > 6
);
```
### Query with Customer Details, Loan Details, and Outstanding Amount
```sql
SELECT c.cust_id, l.acct_id, c.first_name, c.last_name,
(loan_repayment_total - amt_paid_down) AS 'OUTSTANDING AMOUNT'
FROM customer_mobaybranch AS c 
JOIN loans_mobaybranch AS l ON c.acct_id = l.acct_id;

SELECT c.cust_id, l.acct_id, c.first_name, c.last_name,
(loan_repayment_total - amt_paid_down) AS 'OUTSTANDING AMOUNT'
FROM customer_caymanbranch AS c 
JOIN loans_caymanbranch AS l ON c.acct_id = l.acct_id;
```

### Loan Details, Payment History, Outstanding Amount
```sql
SELECT c.cust_id, l.acct_id, c.first_name, c.last_name,
l.loan_id, l.loan_repayment_total, l.loan_repayment_date, 
(loan_repayment_total - amt_paid_down) AS 'OUTSTANDING AMOUNT', l.date_of_payment 
FROM customer_mobaybranch AS c 
JOIN loans_mobaybranch AS l ON c.acct_id = l.acct_id;

SELECT c.cust_id, l.acct_id, c.first_name, c.last_name,
l.loan_id, l.loan_repayment_total, l.loan_repayment_date, 
(loan_repayment_total - amt_paid_down) AS 'OUTSTANDING AMOUNT', l.date_of_payment 
FROM customer_caymanbranch AS c 
JOIN loans_caymanbranch AS l ON c.acct_id = l.acct_id;
```
### Customer, Account Type, Balance Based on Transaction
```sql
SELECT c.cust_id, t.acct_id, c.first_name, c.last_name, a.acct_type,
SUM(tran_amt) AS 'BALANCE IN CUST ACCT',
(loan_repayment_total - amt_paid_down) AS 'OUTSTANDING LOAN AMOUNT - MOBAY BRANCH'
FROM customer_mobaybranch AS c
LEFT JOIN account_mobaybranch AS a ON c.cust_id = a.cust_id
LEFT JOIN loans_mobaybranch AS l ON c.acct_id = l.acct_id
LEFT JOIN transactions_mobaybranch AS t ON c.acct_id = t.acct_id
GROUP BY acct_id;

SELECT c.cust_id, t.acct_id, c.first_name, c.last_name, a.acct_type,
SUM(tran_amt) AS 'BALANCE IN CUST ACCT',
(loan_repayment_total - amt_paid_down) AS 'OUTSTANDING LOAN AMOUNT - CAYMAN BRANCH'
FROM customer_caymanbranch AS c
LEFT JOIN account_caymanbranch AS a ON c.cust_id = a.cust_id
LEFT JOIN loans_caymanbranch AS l ON c.acct_id = l.acct_id
LEFT JOIN transactions_caymanbranch AS t ON c.acct_id = t.acct_id
GROUP BY acct_id;
```
### Results Of Findings
### Recommendations
- Implement loyalty programs that reward frequent transactions. This will encourage customers to keep their accounts active.
- Offer more loans that will cater to the needs of customers such as: Home improvement loans, educational loans or small business loans. This will in turn attract more customers.
- Expand the offerings to customers to include insurance products or investment plans offerings.
  
### Limitations
-The data had a narrow scope, preventing a broader analysis.






