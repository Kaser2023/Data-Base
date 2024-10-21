Create database insertingData;

use insertingData;

create table cats (
name Varchar (50),
age int
);

desc cats;

insert INTO cats (name, age)
Values ("hero", 6),
		("kero", 7),
        ("shero", 9)
 ;
 
 select * from cats;
 
 
 -- exercise 1 for inserting 
 
 Create table people (
 first_name VARCHAR (20),
 laset_name VARCHAR (20),
 age INT
 );
 
 desc people;
 
 insert into 
 people (first_name, laset_name , age) values 
 ("Abdullah", "Alqurashi", 5678);
 
 select * from people;
 
 
 CREATE TABLE unique_cats2 (
  cat_id INT,
  name VARCHAR(100), 
  age INT,
  PRIMARY KEY(cat_id)
 );
 
 insert into unique_cats2 (name, age) 
 values ( 'meeeeaaw', 5);

 
 Create table Employees (
     id INT AUTO_INCREMENT PRIMARY KEY,
     last_name VARCHAR(50)  NOT NULL,
     fist_name VARCHAR (50) NOT NULL,
     middle_name VARCHAR (50),
    age INT NOT NULL,
    current_status VARCHAR(50) NOT NULL DEFAULT 'Employed'
     );
 
 
 
 