create database Library;
use library;
create table Branch(Branch_no int primary key,
Manager_Id int,
Branch_address varchar(15),
Contact_no int);
insert into Branch values(1, 123,'Kottayam',9767565),
(2,134,'Thrissur',9866455),
(3,345,'TVM',8675654),
(4,874,'Alapuzha',897654),
(5,645,'Ernakulam',978543);
select * from branch;

create table Employee1(Emp_Id int primary key,
Emp_name varchar(15),
Position varchar(15),
Salary int,
Branch_no int,
foreign key(Branch_no) references Branch(Branch_no));

insert into Employee1 values (345,'Venu','Manager',45000,3),
(874,'Ramesh','Manager',35000,4),
(33,'Seema','Librarian',50000,1),
(134,'vasundara','Manager',45000,2),
(55,'Aiswarya','Data Scientist',55000,3),
(66,'Minnu','HR',30000,5),
(77,'Aadhya','HR',35000,3),
(88,'Juhi','HR',45000,3),
(99,'Ashwin','HR',55000,3),
(111,'Aadhik','HR',25000,3);
select * from Employee1;
drop table Employee1;

create table books(ISBN int primary key,
Book_title varchar(30),
Category varchar(30),
Rental_price int,
Status enum ('yes', 'no'),
Author varchar(30),
Publisher varchar(30));
alter table books modify column Book_title varchar(30); 
alter table books modify column Category varchar(30); 
alter table books modify column Author varchar(30); 
alter table books modify column Publisher varchar(30); 

insert into books values(102,'Wings of Fire','Autobiography',150,'yes','APJ','XYZY'),
(103,'Alchemist','Fiction',200,'yes','Paulo Coelho','TYU'),
(104,'Ikigai','Philosophy',300,'no','Hector and Francesc','DFG'),
(105,'Harry Potter','Fiction',500,'no','J K Rowling','CVB'),
(106,'Twilight','Fiction',300,'yes','Stephenie Meyer','DGH'),
(107,'2 States','Romance',200,'no','Chetan Bhagat','ZXC'),
(108,'Angels and Demons','Myster Thriller',350,'yes','Dan Brown','ASD');
select * from books;
update books set Category='History' where ISBN=102;

create table Customer1(Customer_ID int primary key,
Customer_Name varchar(15),
Customer_address varchar(15),
Reg_date date);
insert into Customer1 values(01,'Geethu','asdfg','2020-09-30'),
(02,'Gibin','hhbmn','2021-04-18'),
(03,'Nidhin','tewuyg','2024-01-26'),
(04,'Shon','uyhjbd','2023-11-07'),
(05,'Aravind','tygjh','2022-06-10'),
(06,'Amal','ueywhj','2021-04-19');
select * from Customer1;

create table Issuestatus(Issue_ID int primary key,
Issued_cust int,
Foreign Key(Issued_cust) references Customer1(Customer_ID),
Issue_date date,
Isbn_book int,
foreign Key(Isbn_book) references books(ISBN));
insert into Issuestatus values(12,05,'2024-07-10',104),
(13,04,'2024-07-11',103),
(14,01,'2024-07-12',105),
(15,02,'2024-07-13',107),
(16,06,'2023-06-15',108);
select * from Issuestatus;


create table Returnstatus(Return_Id int primary key,
Return_cost int,
return_book_name varchar(30),
Return_date date,
Isbn_book2 int,
Foreign Key(Isbn_book2) references books(ISBN));
insert into Returnstatus values(001,200,'Alchemist','2024-07-15',103),
(002,300,'Ikigai','2024-07-14',104),
(003,500,'Harry Potter','2024-07-13',105),
(004,200,'2 states','2024-07-16',107);
select * from Returnstatus;

-- 1
select book_title, category, Rental_price from books where status ='yes';

-- 2
select Emp_name, Salary from Employee1 order by salary desc;

-- 3
select Issuestatus.Isbn_book,Issuestatus.Issued_cust from Issuestatus join books on Issuestatus.Isbn_book=ISBN join Customer1 on Issuestatus.Issued_cust=Customer_ID;

-- 4
select category, count(*) as total_books from books group by category;

-- 5
select Emp_name, Position from Employee1 where salary>50000;

-- 6
select Customer_name from Customer1 where reg_date<'2022-01-01' and Customer_Id not in(select Issued_cust from Issuestatus);

-- 7
select branch_no, count(*) as total_employees from Employee1 group by branch_no;

-- 8
select Customer1.Customer_name from Issuestatus join Customer1 on Issuestatus.Issued_cust=Customer1.Customer_Id

where Issuestatus.Issue_date between '2023-06-01' and '2023-06-30';

-- 9
select book_title from books where category='History';

-- 10
select branch_no, count(*)as Total_employee from Employee1 group by branch_no having count(*)>5;

-- 11
select Employee1.Emp_name,Branch.branch_address from Employee1 join Branch on Employee1.Emp_Id=Branch.Manager_Id;

-- 12
select Customer1.customer_name from Issuestatus join books on Issuestatus.Isbn_book join Customer1 on Issuestatus.Issued_cust=Customer1.Customer_Id 
where books.rental_price>25;

