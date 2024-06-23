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

There were 12 tables used to capture the customer data. These tables were: account_caymanbranch, account_mobaybranch, card_caymanbranch, card_mobaybranch, customer_caymanbranch, customer_mobaybranch, customer_verif_caymanbranch, customer_verif_mobaybranch, loans_caymanbranch, loans_mobaybranch, transactions_caymanbranch, transactions_mobaybranch. The account tables  store critical information about customer accounts, such as account ID, account type (savings or current), balance, and the date the account was opened. The Card tables show data on the debit cards that were issued, including card ID, card number, expiration date, and the associated account ID, which allows for the tracking of card usage and management. The Customer tables show demographic information, including customer ID, title, first and last names, gender, marital status, and their branch association. The Customer Verification tables show the result of the background verification test done on all potential customers. Only the customers who have passed the background verification test are able to have an account at either of the branches. The Loans tables Loans gives information on loan management, including loan ID, amount, terms, approval date, repayment schedule, interest rate, and the borrowing customer's ID.
Please see below snippets of each table, while the Transactions tables allow for an analysis of the transactions done by the Customers, which give an insight into their financial behaviour
#### The customer_mobaybranch table
![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/120ef22c-ff1e-480d-bdae-b543f0732d36)

#### The customer_caymanbranch table

![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/0deea529-5463-40b5-aac1-8715bcf92f53)

#### The customer_verif_mobaybranch table

![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/138f8a5e-b4d5-4bb3-8c88-a247fe194d75)

#### The customer_verif_caymanbranch table

![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/815de91e-01fe-477d-9043-5e5725543ff9)

#### The account_mobaybranch table

![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/0bfc7b0b-0c7a-4573-955b-0c02d51eb8dc)

#### The account_caymanbranch table

![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/f36b521d-6124-4a94-af00-4b468f566761)


#### The card_mobaybranch table

![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/b9b0bf63-0e36-49b6-8062-96383a4425c5)

#### The card_caymanbranch table

![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/3d22368a-d88f-4ea6-adbe-ed86ffb2fb32)

#### The transactions_mobaybranch table

![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/472eb929-cecd-44dc-96f0-9e7de7afc723)

![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/3cf00211-8bcf-4aaa-b584-4b4be037e8b4)



#### The transactions_caymanbranch table

![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/d0a1d591-8175-4126-a853-9374929d353f)

####  The loans_mobaybranch table

![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/377c26ac-ccc0-413e-b081-731f9a5f49fe)

#### The loans_caymanbranch table

![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/44ffb356-75c8-4528-a0ed-95d883a13dca)



### Data Analysis
The below queries select customers from the account_mobaybranch and account_caymanbranch tables who have had their accounts for at least 2 years. This is the criteria for eligibility for a loan. The use of TIMESTAMPDIFF(YEAR, acct_st_dt, NOW()) ensures that only the accounts that have been active for 2 or more years are retrieved.

#### Customers Eligible for a Loan:
```sql
SELECT * FROM account_mobaybranch WHERE TIMESTAMPDIFF(YEAR, acct_st_dt, NOW()) >= 2;
```
![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/b05c1c46-e65d-49cb-96eb-4e50078caed6)

```sql
SELECT * FROM account_caymanbranch WHERE TIMESTAMPDIFF(YEAR, acct_st_dt, NOW()) >= 2;
```
![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/abb8c65e-5cc3-495b-b9d6-1e75cf2b36ee)


The below queries select customers from the transactions_mobaybranch and transactions_caymanbranch tables who have conducted transactions amounting to $100,000 or more. Only customers who have conducted transactions amounting to $100,000 or more are eligible to receive a Credit card.

### Customers eligible for the Credit Card Service
```sql
SELECT acct_id, IF(SUM(tran_amt) >= 100000, 'ELIGIBLE', 'NOT ELIGIBLE') AS 'CREDIT CARD APPROVAL - MOBAY BRANCH' 
FROM transactions_mobaybranch
GROUP BY acct_id;
```
![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/69809c92-bfca-4375-9bd9-6b3bcc465bd1)

```sql
SELECT acct_id, IF(SUM(tran_amt) >= 100000, 'ELIGIBLE', 'NOT ELIGIBLE') AS 'CREDIT CARD APPROVAL - CAYMAN BRANCH' 
FROM transactions_caymanbranch
GROUP BY acct_id;
```
![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/574936bb-be60-4aa5-a76f-c1cfd615a901)

The below queries retrieve all transaction data for customers from both the Mobay and Cayman branch and then identify customers whose last transaction was 6 or more months ago by checking the latest transaction date MAX(tran_date) for each account and using TIMESTAMPDIFF.

### Customers who have conducted no transactions for the past six(6) months
```sql
SELECT acct_id, MAX(tran_date) AS 'LAST TRANSACTION DATE PAST 6 MONTHS: MOBAY BRANCH' 
FROM transactions_mobaybranch 
WHERE TIMESTAMPDIFF(MONTH, tran_date, NOW()) >= 6 
GROUP BY acct_id;
```
![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/43b434fd-50f2-4608-aeb4-d26958c4d8b3)

```sql
SELECT acct_id, MAX(tran_date) AS 'LAST TRANSACTION DATE PAST 6 MONTHS: CAYMAN BRANCH' 
FROM transactions_caymanbranch 
WHERE TIMESTAMPDIFF(MONTH, tran_date, NOW()) >= 6 
GROUP BY acct_id;
```
![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/0a52f009-7c2e-4a4e-90ed-254b1d725c1d)



The below queries check for any recent transactions conducted by the customers within the last 6 months and updates the Customer_MOBAYBRANCH and Customer_CAYMANBRANCH tables accordingly with a status of 'Active' and comment 'Transaction conducted within the last 1-6 months' for customers who have conducted transactions within the last 6 months or 'Inactive' and comment 'No transaction conducted within the past 6 months' for those customers who have conducted transactions outside of the 6 month window.

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
A snippet of the Customer_mobaybranch table with the applied queries:

![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/5fb6810a-96b3-42d9-857d-f5d24094da82)

A snippet of the Customer_caymanbranch table with the applied queries:

![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/c67b6c6c-39ca-4940-ab43-dc22197fc4be)



The below queries show the customers who applied for loans based on their eligibility as well as the outstanding amount.
### Query with Customer Details, Loan Details, and Outstanding Amount
```sql
SELECT c.cust_id, l.acct_id, c.first_name, c.last_name,
(loan_repayment_total - amt_paid_down) AS 'OUTSTANDING AMOUNT'
FROM customer_mobaybranch AS c 
JOIN loans_mobaybranch AS l ON c.acct_id = l.acct_id;
```
![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/115c7813-17d3-43b1-ad90-e15483722724)

```sql
SELECT c.cust_id, l.acct_id, c.first_name, c.last_name,
(loan_repayment_total - amt_paid_down) AS 'OUTSTANDING AMOUNT'
FROM customer_caymanbranch AS c 
JOIN loans_caymanbranch AS l ON c.acct_id = l.acct_id;
```
![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/5f7148d2-c2cf-4656-aaaa-20b6cca4f669)


### Loan Details, Payment History, Outstanding Amount
```sql
SELECT c.cust_id, l.acct_id, c.first_name, c.last_name,
l.loan_id, l.loan_repayment_total, l.loan_repayment_date, 
(loan_repayment_total - amt_paid_down) AS 'OUTSTANDING AMOUNT', l.date_of_payment 
FROM customer_mobaybranch AS c 
JOIN loans_mobaybranch AS l ON c.acct_id = l.acct_id;
```
![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/d6045c52-1de1-4c33-91b8-cfdadbd4fa8d)


```sql
SELECT c.cust_id, l.acct_id, c.first_name, c.last_name,
l.loan_id, l.loan_repayment_total, l.loan_repayment_date, 
(loan_repayment_total - amt_paid_down) AS 'OUTSTANDING AMOUNT', l.date_of_payment 
FROM customer_caymanbranch AS c 
JOIN loans_caymanbranch AS l ON c.acct_id = l.acct_id;
```
![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/1dc5bf89-7f90-4b8b-ad46-eb16e4ec4de0)

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
```
![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/3ad1edca-e524-4416-9bb2-70a8d177f848)

```sql
SELECT c.cust_id, t.acct_id, c.first_name, c.last_name, a.acct_type,
SUM(tran_amt) AS 'BALANCE IN CUST ACCT',
(loan_repayment_total - amt_paid_down) AS 'OUTSTANDING LOAN AMOUNT - CAYMAN BRANCH'
FROM customer_caymanbranch AS c
LEFT JOIN account_caymanbranch AS a ON c.cust_id = a.cust_id
LEFT JOIN loans_caymanbranch AS l ON c.acct_id = l.acct_id
LEFT JOIN transactions_caymanbranch AS t ON c.acct_id = t.acct_id
GROUP BY acct_id;
```
![image](https://github.com/ChrisAnn609/Banking-Industry-Analysis-SQL/assets/173093556/cacfff90-209d-46bd-a546-351d2ede1535)

### Results Of Findings
### Recommendations
- Implement loyalty programs that reward frequent transactions. This will encourage customers to keep their accounts active.
- Offer more loans that will cater to the needs of customers such as: Home improvement loans, educational loans or small business loans. This will in turn attract more customers.
- Expand the offerings to customers to include insurance products or investment plans offerings.
  
### Limitations
- The data had a narrow scope, preventing a broader analysis.






