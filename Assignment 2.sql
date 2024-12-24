#Create a databse named Library and a table named books with the following columns:#
create database Library;
use Library;
create table books1(
id int primary key Auto_increment,
title varchar(255),
author varchar(100),
year date,
genre varchar(100)
);

select * from books1;

#insert the following books recordes into the books table:#
insert into books1(id,title,author,year,genre)
value(1,"The Greate Gatsby","F.Scott Fitzgerald","1925-09-12","Fiction");
insert into books1(id,title,author,year,genre)
value(2,"Pride and Prejudice","Jane Austen","1813-06-23","Romance");
insert into books1(id,title,author,year,genre)
value (3,"To Kill a Mockingbird","Harper Lee","1960-04-21","Fiction");
insert into books1(id,title,author,year,genre)
value(4,"1984","George Orwell","1949-12-28","Dystopian");
insert into books1(id,title,author,year,genre)
value(5,"Moby Dick","Herman Melville","1851-01-29","Adventure");
insert into books1(id,title,author,year,genre)
values(6,"The confused person","Aman@","1776-11-30","Adventure");
insert into books1(id,title,author,year,genre)
values(7,"half girlfriend","Abhishek@#","2024-09-25","Romance"),
      (8,"the Rose","Harsh!#!","2023-04-19","Romance");
#Write a query to select all books where the title starts with the letter 'T' using the LIKE operator.#
select * from books1
where title like 'T%';

#Write a query to find all books where the author's last name ends with 'son' using the LIKE operator.#
select * from books1
where author like '%son';

#Write a query to find all books where the title contains the word 'and' using the LIKE operator.#
select * from books1
where title like '%and%';

#Write a query to retrieve all books where the title ends with the word 'bird' using the LIKE operator.#
select * from books1
where title like '%bird';

#Write a query to find all books where the title has exactly 3 characters using the REGEXP operator.#
SELECT * FROM books1 WHERE title REGEXP '^[A-Za-z]{3}$';

#Write a query to select all books where the title contains a number using the REGEXP operator.#
SELECT * FROM books1 WHERE title REGEXP '[0-9]';

#Write a query to retrieve all books where the author's name starts with any letter between 'A' and 'J' using the REGEXP operator.#
SELECT * FROM books1 WHERE author REGEXP '^[A-J]';

#Write a query to select all books where the genre is either 'Fiction' or 'Adventure' using the REGEXP operator.#
SELECT * FROM books1 WHERE genre REGEXP 'Fiction|Adventure';

#Write a query to find all books where the title contains at least one uppercase letter using the REGEXP operator.#
SELECT * FROM books1 WHERE title REGEXP '[A-Z]';

#Write a query to find all books where the year of publication is between 1800 and 1950 using the LIKE operator.#

select * from books1 where year like "%1813-06-23" and (year like "1925-09-12%"); # Mam this not working why?
SELECT *FROM books1 where year LIKE '18%' OR year LIKE '19%'and year NOT LIKE '1951%'
and year NOT LIKE '1952%'
and year NOT LIKE '1953%'
and year NOT LIKE '1954%'
and year NOT LIKE '1955%';

#Write a query to retrieve all books where the author's name contains exactly two words using the REGEXP operator.#
 SELECT * FROM books1 WHERE author REGEXP '[A-z]+[A-z]';
 
 SELECT * FROM books1 WHERE author REGEXP '[^\A+\z+]';
 
 
 #Write a query to find all books where the title starts with the letter 'P' and contains exactly two words using the REGEXP operator.#
 SELECT * FROM books1 WHERE title REGEXP '^P [A-Za-z]+';
 
 #Write a query to find all books where the title contains any special characters (e.g., '!', '@', '#', etc.) using the REGEXP operator.#
 SELECT * FROM books1 WHERE title REGEXP '[^A-Za-z0-9 ]';
 
 

