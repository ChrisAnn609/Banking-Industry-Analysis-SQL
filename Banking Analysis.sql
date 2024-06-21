create database banking_assignment;
use banking_assignment;

Create table Customer_mobaybranch(
Cust_id int not null unique auto_increment,
Acct_id int not null,
TRN numeric not null,
Title varchar(5) not null,
First_name varchar(50) not null,
last_name varchar(50) not null,
Phno varchar(11) not null,
Address varchar(50) not null,
Email varchar(50) not null,
DOB Datetime,
Gender varchar(2) not null,
Rel_status varchar(50) not null,
Acct_typ_req varchar(50) not null,
Cust_status varchar(20),
Comments varchar(100),
Primary key(Cust_id)
);

Alter table customer_mobaybranch
auto_increment=430000;


Create table Customer_Caymanbranch(
Cust_id int not null unique auto_increment,
Acct_id int not null,
TRN numeric not null,
Title varchar(5) not null,
First_name varchar(50) not null,
last_name varchar(50) not null,
Phno varchar(11) not null,
Address varchar(50) not null,
Email varchar(50) not null,
DOB Datetime,
Gender varchar(2) not null,
Rel_status varchar(50) not null,
Acct_typ_req varchar(50) not null,
Cust_status varchar(20),
Comments varchar(100),
Primary key(Cust_id)
);

Alter table customer_caymanbranch
auto_increment=430010;

Create table Customer_verif_mobaybranch(  
Cust_id int not null,
verification_id int not null primary key auto_increment,
status varchar(20),
result varchar(20),
foreign key(cust_id) references customer_mobaybranch(cust_id)
);
Alter table Customer_verif_mobaybranch
auto_increment=22;

Create table Customer_verif_caymanbranch(
Cust_id int not null,
verification_id int not null primary key auto_increment,
status varchar(20),
result varchar(20),
foreign key(cust_id) references customer_caymanbranch(cust_id)
);
Alter table Customer_verif_caymanbranch
auto_increment= 32;

Create table account_mobaybranch(
Acct_id int not null primary key,
Cust_id int not null,
Acct_num int not null,
Acct_type varchar(20) not null,
Acct_st_dt DATETIME,
Joint_acct varchar(2) not null,
Acct_status varchar(2) not null,
foreign key(cust_id) references Customer_verif_mobaybranch(cust_id)
);

Create table account_caymanbranch(
Acct_id int not null primary key,
Cust_id int not null,
Acct_num int not null,
Acct_type varchar(20) not null,
Acct_st_dt DATETIME,
Joint_acct varchar(2) not null,
Acct_status varchar(2) not null,
foreign key(cust_id) references Customer_verif_caymanbranch(cust_id)
);

Create table card_mobaybranch(
Card_id int not null primary key,
Acct_id int not null,
Card_number int not null,
Card_type varchar(10) not null,
Card_exp_date DATETIME,
Credit_card_approval varchar(15),
foreign key(Acct_id) references account_mobaybranch(Acct_id)
);

Create table card_caymanbranch(
Card_id int not null primary key,
Acct_id int not null,
Card_number int not null,
Card_type varchar(10) not null,
Card_exp_date DATETIME,
Credit_card_approval varchar(15),
foreign key(Acct_id) references account_caymanbranch(Acct_id)
);

Create table transactions_mobaybranch(
Tran_id int not null unique auto_increment,
Acct_id int not null,
Tran_amt numeric not null,
tran_type Enum('Deposit','Withdrawal'),
tran_date datetime,
FOREIGN KEY(Acct_id) references card_mobaybranch(Acct_id)
);

Create table transactions_caymanbranch(
Tran_id int not null unique auto_increment,
Acct_id int not null,
Tran_amt numeric not null,
tran_type Enum('Deposit','Withdrawal'),
tran_date datetime,
FOREIGN KEY(Acct_id) references card_caymanbranch(Acct_id)
);

Create table loans_mobaybranch(
loan_id int not null unique auto_increment,
Acct_id int not null,
loan_approval_amt int not null,
interest varchar(5) not null,
Loan_repayment_total decimal (10,2) not null,
loan_approval_date DATE,
loan_repayment_date DATE,
Amt_paid_down decimal (10,2) not null,
Date_of_payment DATE,
PRIMARY KEY(Loan_id)
);
Alter table loans_mobaybranch
auto_increment=199;


Create table loans_caymanbranch(
loan_id int not null unique auto_increment,
Acct_id int not null,
loan_approval_amt int not null,
interest varchar(5) not null,
Loan_repayment_total decimal (10,2) not null,
loan_approval_date DATE,
loan_repayment_date DATE,
Amt_paid_down decimal (10,2) not null,
Date_of_payment DATE,
PRIMARY KEY(Loan_id)
);
Alter table loans_caymanbranch
auto_increment=205;

Show tables;
select * from Customer_mobaybranch;

Insert into Customer_mobaybranch(Acct_ID,TRN,TITLE,FIRST_NAME,LAST_NAME,PHNO,ADDRESS,EMAIL,DOB,GENDER,REL_STATUS,ACCT_TYP_REQ)
Values
(2,1234,'MS','Davia','Haughton',8762222222,'Marine Circle','dhaughton@gmail.com',"1969-01-01",'F','Single','Savings'),
(4,5678,'MR','Saad','Ellis',8763333333,'Adelphi','sellis@gmail.com',"1972-01-01",'M','Married','Savings'),
(6,9101,'MRS','Dia','Brandon',8761111111,'Linstead','dbrandon@gmail.com',"1976-01-01",'F','Married','Current'),
(8,1213,'MR','David','Campbell',8764444444,'Marine Crescent','dcampbell@gmail.com',"1978-01-01",'M','Married','Current'),
(10,1415,'MS','Chrisanique','Clarke',8765555555,'Wakesfield','cclarke@gmail.com',"1995-01-01",'F','Single','Current'),
(12,1617,'MS','JNyah','Brown',8766676767,'Manchester Plains','jbrown@gmail.com',"1998-01-01",'F','Single','Savings'),
(14,1819,'MR','Judah','Finson',8767777777,'Mona Gardens','jfinson@gmail.com',"1997-01-01",'M','Single','Savings'),
(16,2021,'MR','Israel','James',8768888888,'Alvaje Meadows','ijames@gmail.com',"1992-01-01",'M','Single','Savings'),
(18,2223,'MRS','Rochelle','Williams',8769999999,'Bogue Heights','rwilliams@gmail.com',"1990-01-01",'F','Married','Current'),
(20,2425,'MR','Zion','Ainsworth',8769121367,'Estuaria Village','zainsworth@gmail.com',"1989-01-01",'M','Married','Current');

Insert into Customer_Caymanbranch (Acct_ID,TRN,TITLE,FIRST_NAME,LAST_NAME,PHNO,ADDRESS,EMAIL,DOB,GENDER,REL_STATUS,ACCT_TYP_REQ)
Values
(22,2627,'MR','Christopher','Clarke',3452900602,'Grand Cayman','cclarke2@gmail.com',"1970-04-18",'M','Married','Savings'),
(24,2829,'MRS','Sasha-Gaye','Young',3452854355,'Grand Cayman','syoung@gmail.com',"1974-04-18",'F','Married','Current'),
(26,3031,'MRS','Romae','Brown',3453933624,'Grand Cayman','rbrown@gmail.com',"1977-04-18",'F','Married','Savings'),
(28,3233,'MRS','Tiffany','Brooks',3453612104,'Grand Cayman','tbrooks@gmail.com',"1988-04-18",'M','Married','Savings'),
(30,3435,'MS','Zahira','Jackson',3458243369,'Grand Cayman','zjackson@gmail.com',"1996-04-18",'F','Single','Current');


select * from Customer_Caymanbranch;

select * from Customer_verif_mobaybranch;

Insert into Customer_verif_mobaybranch (cust_id,status,result)
Values
(430000,'Done', 'BGV Passed'),
(430001,'Done','BGV Passed'),
(430002,'Done', 'BGV Passed'),
(430003,'Done', 'BGV Passed'),
(430004,'Done', 'BGV Passed'),
(430005,'Done', 'BGV Passed'),
(430006,'Done', 'BGV Passed'),
(430007,'Done', 'BGV Passed'),
(430008,'Done', 'BGV Passed'),
(430009,'Done', 'BGV Passed');

Insert into Customer_verif_caymanbranch (cust_id,status,result)
Values
(430010,'Done', 'BGV Passed'),
(430011,'Done', 'BGV Passed'),
(430012,'Done', 'BGV Passed'),
(430013,'Done', 'BGV Passed'),
(430014,'Done','BGV Passed');

Select * from Customer_verif_caymanbranch;

Select* from account_mobaybranch;

Insert into account_mobaybranch
Values
(2,430000,021,'Savings',"2019-01-01",'NO','Y'),
(4,430001,023,'Savings',"2017-04-03",'NO','Y'),
(6,430002,025,'Savings',"2023-02-01",'NO','Y'),
(8,430003,027,'Current',"2016-03-03",'NO','Y'),
(10,430004,029,'Savings',"2022-04-04",'NO','Y'),
(12,430005,031,'Savings',"2018-12-15",'NO','Y'),
(14,430006,033,'Current',"2019-12-25",'NO','Y'),
(16,430007,035,'Current',"2023-03-04",'NO','Y'),
(18,430008,037,'Current',"2020-11-01",'NO','Y'),
(20,430009,039,'Current',"2021-12-31",'NO','Y');

Insert into account_caymanbranch
Values
(22,430010,041,'Savings',"2022-10-28",'NO','Y'),
(24,430011,043,'Current',"2023-05-17",'NO','Y'),
(26,430012,045,'Savings',"2019-03-28",'NO','Y'),
(28,430013,047,'Current',"2022-01-01",'NO','Y'),
(30,430014,049,'Savings',"2023-01-01",'NO','Y');
Select* from account_caymanbranch;

Select* from card_mobaybranch;
Insert into card_mobaybranch(Card_id, Acct_id, Card_number, Card_type, Card_exp_date)
Values
(3,2,111,'Debit',"2026-12-31"),
(6,4,222,'Debit',"2025-12-31"),
(9,6,333,'Debit',"2024-12-31"),
(12,8,444,'Debit',"2027-12-31"),
(15,10,555,'Debit',"2028-12-31"),
(18,12,677,'Debit',"2029-12-31"),
(21,14,777,'Debit',"2025-01-01"),
(24,16,888,'Debit',"2026-01-01"),
(27,18,999,'Debit',"2027-01-01"),
(30,20,101,'Debit',"2024-12-31");

Insert into card_caymanbranch(Card_id, Acct_id, Card_number, Card_type, Card_exp_date)
Values
(33,22,122,'Debit',"2019-01-01"),
(36,24,133,'Debit',"2026-12-15"),
(39,26,144,'Debit',"2024-12-31"),
(42,28,155,'Debit',"2025-12-12"),
(45,30,166,'Debit',"2027-01-31");

Select* from transactions_mobaybranch;
Select * from card_caymanbranch;
Select* from transactions_mobaybranch;
Insert into transactions_mobaybranch (Acct_id, Tran_amt, tran_type, tran_date)
Values
(2,15000,'1',"2019-01-01"),
(2,45000,'1',"2019-03-03"),
(2,60000,'1',"2021-09-13"),
(2,20000,'1',"2022-04-12"),
(4,5000,'1',"2017-04-03"),
(4,6000,'1',"2017-12-31"),
(4,6000,'1',"2021-01-01"),
(4,8000,'1',"2023-08-15"),
(6,25000,'1',"2023-02-01"),
(6,30000,'1',"2023-02-02"),
(6,30000,'1',"2023-05-15"),
(6,25000,'1',"2023-08-06"),
(8,15000,'1',"2016-03-03"),
(8,20000,'1',"2019-03-03"),
(8,15000,'1',"2022-05-24"),
(8,75000,'1',"2023-01-31"),
(10,5000,'1',"2022-04-04"),
(10,6000,'1',"2022-11-15"),
(10,7000,'1',"2023-04-04"),
(10,8000,'1',"2023-08-02"),
(12,10000,'1',"2018-12-15"),
(12,9000,'1',"2019-04-30"),
(12,20000,'1',"2022-10-15"),
(12,60000,'1',"2023-01-01"),
(14,5500,'1',"2019-12-25"),
(14,5500,'1',"2020-09-01"),
(14,5500,'1',"2023-02-28"),
(14,5500,'1',"2023-07-31"),
(16,25000,'1',"2023-03-04"),
(16,30000,'1',"2023-04-04"),
(16,35000,'1',"2023-05-04"),
(16,40000,'1',"2023-06-04"),
(18,12000,'1',"2020-11-01"),
(18,15000,'1',"2021-11-01"),
(18,18000,'1',"2022-11-01"),
(18,60000,'1',"2023-05-25"),
(20,30000,'1',"2021-12-31"),
(20,30000,'1',"2021-12-31"),
(20,20000,'1',"2022-12-31"),
(20,20000,'1',"2023-03-04");

Select* from transactions_mobaybranch;

select * from transactions_caymanbranch;
Insert into transactions_caymanbranch (Acct_id, Tran_amt, tran_type, tran_date)
Values
(22,5000,'1',"2022-10-28"),
(22,95000,'1',"2022-12-31"),
(22,10000,'1',"2023-03-04"),
(22,45000,'1',"2023-07-15"),
(24,10000,'1',"2023-05-17"),
(24,20000,'1',"2023-05-18"),
(24,60000,'1',"2023-06-28"),
(24,5000,'1',"2023-07-31"),
(26,90000,'1',"2019-03-28"),
(26,1000,'1',"2019-12-31"),
(26,5000,'1',"2021-06-28"),
(26,6000,'1',"2022-03-04"),
(28,5000,'1',"2022-01-01"),
(28,5000,'1',"2022-07-17"),
(28,5000,'1',"2023-02-26"),
(28,5000,'2',"2023-08-01"),
(30,20000,'1',"2023-01-01"),
(30,20000,'1',"2023-01-02"),
(30,20000,'1',"2023-03-06"),
(30,30000,'1',"2023-05-16");
select * from transactions_caymanbranch;

Select* from account_mobaybranch;
Select acct_st_dt from account_mobaybranch order by cust_id;

Select * from loans_mobaybranch;
Select * from loans_caymanbranch;

Insert into loans_mobaybranch(Acct_id, loan_approval_amt, interest, Loan_repayment_total, loan_approval_date, loan_repayment_date,Amt_paid_down,date_of_payment)
Values
(2,100000,'5%',105000,"2023-08-01","2024-08-01",15000,"2023-08-15"),
(4,200000,'6%',212000,"2023-08-16","2024-08-16",12000,"2023-08-30"),
(8,150000,'5%',157500,"2023-08-01","2024-08-01",50000,"2023-08-06"),
(12,250000,'6%',265000,"2023-08-06","2024-08-06",20000,"2023-08-13"),
(14,75000,'3%',77250,"2023-08-10","2024-08-10",75000,"2023-08-29"),
(18,800000,'8%',864000,"2023-08-15","2024-08-15",10000,"2023-08-25");

Insert into loans_caymanbranch(Acct_id, loan_approval_amt, interest, Loan_repayment_total, loan_approval_date, loan_repayment_date,
Amt_paid_down,date_of_payment)
Values
(26,1000000,'10%',1200000,"2023-08-23","2024-08-23",100000,"2023-08-30");

-- CUSTOMERS ELIGIBLE FOR A LOAN:
	Select* from account_mobaybranch WHERE timestampdiff(year,acct_st_dt,now())>=2;
	Select * from  account_caymanbranch WHERE timestampdiff(year,acct_st_dt,now())>=2;
    
-- CUSTOMERS ELIGIBLE FOR THE CREDIT CARD SERVICE
        
Select* from transactions_mobaybranch;
Select* from card_mobaybranch;


Select acct_id,if(sum(tran_amt)>=100000,'ELIGIBLE','NOT ELIGIBLE') AS 'CREDIT CARD APPROVAL- MOBAY BRANCH' 
FROM transactions_mobaybranch
group by acct_id;

 Select acct_id,if(sum(tran_amt)>=100000,'ELIGIBLE','NOT ELIGIBLE') AS 'CREDIT CARD APPROVAL -CAYMAN BRANCH' 
 FROM transactions_CAYMANbranch
group by acct_id;

Select * from card_mobaybranch;
Select* from card_caymanbranch;

Alter table card_mobaybranch
DROP COLUMN Credit_card_approval;

Alter table card_caymanbranch
DROP COLUMN Credit_card_approval;

-- CUSTOMERS WHO HAVE CONDUCTED NO TRANSACTIONS FOR THE PAST 6 MONTHS.
Select* from transactions_mobaybranch;
select * from transactions_caymanbranch;

Select acct_id, max(tran_date) AS 'LAST TRANSACTION DATE PAST 6 MONTHS:MOBAY BRANCH' from transactions_mobaybranch  where timestampdiff(month,tran_date,now())>=6 
 group by acct_id; 
 
Select acct_id, max(tran_date) 'LAST TRANSACTION DATE PAST 6 MONTHS:CAYMAN BRANCH' from transactions_caymanbranch where timestampdiff(month,tran_date,now())>=6 
group by acct_id; 

Select * from customer_mobaybranch;
select* from customer_caymanbranch;

-- FOR STATUS AND COMMENTS

Select acct_id, max(tran_date) from transactions_mobaybranch where timestampdiff(month,tran_date,now())<=6 group by acct_id; 
Select acct_id, max(tran_date) from transactions_caymanbranch where timestampdiff(month,tran_date,now())<=6 group by acct_id; 	

Update Customer_MOBAYBRANCH
Set cust_status='Active',comments='Transaction conducted within the last 1-6 months'
WHERE ACCT_ID in (
Select acct_id from transactions_mobaybranch where timestampdiff(month,tran_date,now())<=6
);

Update Customer_CAYMANBRANCH
Set cust_status='Active',comments='Transaction conducted within the last 1-6 months'
WHERE ACCT_ID in (
Select acct_id from transactions_caymanbranch where timestampdiff(month,tran_date,now())<=6
);

Update Customer_mobaybranch
Set cust_status='Inactive', comments='No transaction conducted within the past 6 months'
WHERE acct_id in(
Select acct_id from transactions_mobaybranch where timestampdiff(month,tran_date,now())>6
);
	
Update Customer_caymanbranch
Set cust_status='Inactive', comments='No transaction conducted within the past 6 months'
WHERE acct_id in(
Select acct_id from transactions_caymanbranch where timestampdiff(month,tran_date,now())>6
);
Select * from customer_mobaybranch;
select * from customer_caymanbranch;
    
    # CUSTOMER WHOSE PARTICIPATION IS LESS IN A PARTICULAR LOCATION #
Select* from transactions_mobaybranch;
Select * from transactions_caymanbranch;


-- QUERY WITH CUST.DETAILS,LOAN DETAILS AND OUTSTANDING AMOUNT

Select (loan_repayment_total-amt_paid_down) as 'OUTSTANDING AMOUNT' from loans_mobaybranch;
Select (loan_repayment_total-amt_paid_down) as 'OUTSTANDING AMOUNT' from loans_caymanbranch;
    
Select c.cust_id, l.acct_id, c.first_name,c.last_name,
(loan_repayment_total-amt_paid_down) as 'OUTSTANDING AMOUNT'
from customer_mobaybranch as c join loans_mobaybranch as l on c.acct_id=l.acct_id;

Select c.cust_id, l.acct_id, c.first_name,c.last_name,
(loan_repayment_total-amt_paid_down) as 'OUTSTANDING AMOUNT'
from customer_caymanbranch as c join loans_caymanbranch as l on c.acct_id=l.acct_id;

#LOAN DETAILS,PAYMENT HISTORY,OUTSTANDING AMOUNT#

Select * from loans_mobaybranch;
Select * from loans_caymanbranch;

Select c.cust_id, l.acct_id, c.first_name,c.last_name,
l.loan_id, l.Loan_repayment_total,l.loan_repayment_date, (loan_repayment_total-amt_paid_down) as 'OUTSTANDING AMOUNT',
l.Date_of_payment from customer_mobaybranch as c join loans_mobaybranch as l on c.acct_id=l.acct_id;

Select c.cust_id, l.acct_id, c.first_name,c.last_name,
l.loan_id, l.Loan_repayment_total,l.loan_repayment_date, (loan_repayment_total-amt_paid_down) as 'OUTSTANDING AMOUNT',
l.Date_of_payment from customer_caymanbranch as c join loans_caymanbranch as l on c.acct_id=l.acct_id;


#CUSTOMER,ACCT TYPE, BALANCE BASED ON TRANSACTION#
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT c.cust_id, t.acct_id, c.first_name, c.last_name, a.acct_type,
SUM(tran_amt) AS 'BALANCE IN CUST ACCT',
(loan_repayment_total - amt_paid_down) AS 'OUTSTANDING LOAN AMOUNT-MOBAY BRANCH'
FROM customer_mobaybranch AS c
left JOIN account_mobaybranch AS a ON c.cust_id = a.cust_id
left JOIN loans_mobaybranch AS l ON c.acct_id = l.acct_id
left JOIN transactions_mobaybranch AS t ON c.acct_id = t.acct_id
GROUP BY acct_id;


SELECT c.cust_id, t.acct_id, c.first_name, c.last_name, a.acct_type,
SUM(tran_amt) AS 'BALANCE IN CUST ACCT',
(loan_repayment_total - amt_paid_down) AS 'OUTSTANDING LOAN AMOUNT-CAYMAN BRANCH'
FROM customer_caymanbranch AS c
left JOIN account_caymanbranch AS a ON c.cust_id = a.cust_id
left JOIN loans_caymanbranch AS l ON c.acct_id = l.acct_id
left JOIN transactions_caymanbranch AS t ON c.acct_id = t.acct_id
GROUP BY acct_id;

