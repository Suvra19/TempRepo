create table CustomerSales (
	trans_date date primary key,
    cust_name varchar(10),
    product char(7),
    price tinyint
);  

create table CustomerSalesDates (
	trans_date date primary key,
    day_name varchar(9),
    month_name varchar(9),
    quarter char(2)
);

insert into CustomerSales values(20180101,'Tim','Widget1',10);
insert into CustomerSales values(20180102,'Geoff','Widget2',7);
insert into CustomerSales values(20180103,'Fred','Widget3',5);
insert into CustomerSales values(20180105,'Bob','Widget5',8);
insert into CustomerSales values(20180107,'Sue','Widget7',20);
insert into CustomerSales values(20180109,'Cat','Widget9',2);
insert into CustomerSales values(20180110,'Jan','Widget0',9);
insert into CustomerSales values(20180111,'Allan','Widget1',10);
insert into CustomerSales values(20180112,'Robert','Widget2',7);
insert into CustomerSales values(20180113,'Chris','Widget3',5);
insert into CustomerSales values(20180114,'Sam','Widget4',16);
insert into CustomerSales values(20180116,'Gandolf','Widget6',6);
insert into CustomerSales values(20180117,'Tim','Widget7',20);
insert into CustomerSales values(20180118,'Geoff','Widget8',17);
insert into CustomerSales values(20180119,'Fred','Widget9',2);
insert into CustomerSales values(20180120,'Bob','Widget0',9);
insert into CustomerSales values(20180121,'Sue','Widget1',10);
insert into CustomerSales values(20180123,'Cat','Widget3',5);
insert into CustomerSales values(20180124,'Jan','Widget4',16);
insert into CustomerSales values(20180125,'Allan','Widget5',8);
insert into CustomerSales values(20180126,'Robert','Widget6',6);
insert into CustomerSales values(20180127,'Chris','Widget7',20);
insert into CustomerSales values(20180128,'Sam','Widget8',17);
insert into CustomerSales values(20180130,'Gandolf','Widget0',9);
insert into CustomerSales values(20180131,'Tim','Widget1',10);
insert into CustomerSales values(20180201,'Geoff','Widget1',10);
insert into CustomerSales values(20180202,'Fred','Widget2',7);
insert into CustomerSales values(20180203,'Bob','Widget3',5);
insert into CustomerSales values(20180205,'Sue','Widget5',8);
insert into CustomerSales values(20180206,'Cat','Widget6',6);
insert into CustomerSales values(20180207,'Jan','Widget7',20);
insert into CustomerSales values(20180209,'Allan','Widget9',2);
insert into CustomerSales values(20180210,'Robert','Widget0',9);
insert into CustomerSales values(20180211,'Chris','Widget1',10);
insert into CustomerSales values(20180212,'Sam','Widget2',7);
insert into CustomerSales values(20180213,'Gandolf','Widget3',5);
insert into CustomerSales values(20180214,'Hans','Widget4',16);

insert into CustomerSalesDates values(20180101,'Monday','Jan!uary','Q1');
insert into CustomerSalesDates values(20180102,'Tuesday','January','Q1');
insert into CustomerSalesDates values(20180103,'Wednesday','January','Q1');
insert into CustomerSalesDates values(20180104,'Thursday','January','Q1');
insert into CustomerSalesDates values(20180105,'Friday','January','Q1');
insert into CustomerSalesDates values(20180106,'Saturday','January','Q1');
insert into CustomerSalesDates values(20180107,'Sunday','January','Q1');
insert into CustomerSalesDates values(20180108,'Monday','January','Q1');
insert into CustomerSalesDates values(20180109,'Tuesday','Jan!uary','Q1');
insert into CustomerSalesDates values(20180110,'Wednesday','January','Q1');
insert into CustomerSalesDates values(20180111,'Thursday','January','Q1');
insert into CustomerSalesDates values(20180112,'Friday','January','Q1');
insert into CustomerSalesDates values(20180113,'Saturday','January','Q1');
insert into CustomerSalesDates values(20180114,'Sunday','January','Q1');
insert into CustomerSalesDates values(20180115,'Monday','Janu?ary','Q1');
insert into CustomerSalesDates values(20180116,'Tuesday','January','Q1');
insert into CustomerSalesDates values(20180117,'Wednesday','January','Q1');
insert into CustomerSalesDates values(20180118,'Thursday','January','Q1');
insert into CustomerSalesDates values(20180119,'Friday','January','Q1');
insert into CustomerSalesDates values(20180120,'Saturday','Janu?ary','Q1');
insert into CustomerSalesDates values(20180121,'Sunday','January','Q1');
insert into CustomerSalesDates values(20180122,'Monday','January','Q1');
insert into CustomerSalesDates values(20180123,'Tuesday','January','Q1');
insert into CustomerSalesDates values(20180124,'Wednesday','January','Q1');
insert into CustomerSalesDates values(20180125,'Thursday','January','Q1');
insert into CustomerSalesDates values(20180126,'Friday','January','Q1');
insert into CustomerSalesDates values(20180127,'Saturday','January','Q1');
insert into CustomerSalesDates values(20180128,'Sunday','January','Q1');
insert into CustomerSalesDates values(20180129,'Monday','January','Q1');
insert into CustomerSalesDates values(20180130,'Tuesday','January','Q1');
insert into CustomerSalesDates values(20180131,'Wednesday','January','Q1');
insert into CustomerSalesDates values(20180201,'Thursday','February','Q1');
insert into CustomerSalesDates values(20180202,'Friday','February','Q1');
insert into CustomerSalesDates values(20180203,'Saturday','February','Q1');
insert into CustomerSalesDates values(20180204,'Sunday','February','Q1');
insert into CustomerSalesDates values(20180205,'Monday','February','Q1');
insert into CustomerSalesDates values(20180206,'Tuesday','Feb!ruary','Q1');
insert into CustomerSalesDates values(20180207,'Wednesday','February','Q1');
insert into CustomerSalesDates values(20180208,'Thursday','February','Q1');
insert into CustomerSalesDates values(20180209,'Friday','February','Q1');
insert into CustomerSalesDates values(20180210,'Saturday','February','Q1');
insert into CustomerSalesDates values(20180211,'Sunday','February','Q1');
insert into CustomerSalesDates values(20180212,'Monday','February','Q1');
insert into CustomerSalesDates values(20180213,'Tuesday','February','Q1');
insert into CustomerSalesDates values(20180214,'Wednesday','February','Q1');

update CustomerSalesDates set month_name = REGEXP_REPLACE(month_name, '[^a-zA-z]', '') where trans_date > '2017-12-31';

select count(month_name) from CustomerSalesDates where REGEXP_LIKE(month_name, '[^a-zA-z]');

create temporary table monthly_customer 
select DATE_FORMAT(cs.trans_date, '%Y%m') AS TRANS_DATE, sum(price) as sum_price, cust_name 
from customersales as cs 
group by cust_name, DATE_FORMAT(cs.trans_date, '%Y%m') order by sum_price DESC;

select * from monthly_customer;

select mc.trans_date, mc.cust_name, sum(mc.sum_price) as sum_price, csd.day_name, csd.month_name, csd.quarter as qtr 
from monthly_customer as mc 
cross join CustomerSalesDates as csd
GROUP BY mc.cust_name, csd.day_name, mc.trans_date, csd.month_name
order by sum_price DESC;



