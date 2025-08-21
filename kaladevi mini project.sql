create table students(
student_id int primary key,
name varchar(100) not null,
email varchar(100) unique not null,
department varchar(100),
gender char(1) default 'm'
);
create table books(
book_id int primary key,
title varchar(100) not null,
author varchar(100) not null,
category varchar(100),
available_copies int default 1
);
create table librarians(
librarian_id int primary key,
name varchar(100) not null,
experience_years int default 0
);
create table borrow(
borrow_id int primary key,
student_id int,
book_id int,
librarian_id int,
borrow_date date,
return_date date,
foreign key(student_id) references students(student_id),
foreign key(book_id) references books(book_id),
foreign key(librarian_id) references librarians(librarian_id)
);
insert into students values
(1,'payu','payu@gmail.com','ECE','m'),
(2,'shen','shen@gmail.com','CSE','f');
insert into books values
(101,'george orwell','dystopian','super',2),
(102,'science','smith','it',1);
insert into librarians values
(1,'devi',3),
(2,'kala',1);
insert into borrow values
(201,1,101,1,'2025-07-01','2025-07-10'),
(202,2,102,2,'2025-07-02',null);

select * from students;
select * from books;
select * from librarians;
select * from borrow;
insert into students values
(3,'sky','sky@gmail.com','MECH','f');
insert into books values
(103,'maths','charlie','medical',3);
insert into librarians values
(3,'alan',2);
insert into borrow values
(203,3,103,3,'2025-07-04',null);

update books set available_copies=available_copies - 1 where book_id = 101;

delete from borrow where borrow_id=203;

select * from students;
select* from books;
describe students;
describe books;
describe borrow;
describe librarians;

select s.name as student_name,b.title as book_title
from borrow br join students s on br.student_id = s.student_id
join books b on br.book_id = b.book_id;

select b.title, l.name as librarian_name from borrow br join books b on br.book_id = b.book_id
join librarians l on br. librarian_id = l.librarian_id;

select br.*,b.title from borrow br join books b on br.book_id = b.book_id where br.student_id = 1;
select student_id, count(*) as total_borrowed from borrow group by student_id;

select book_id, count(*) as borrow_count from borrow group by book_id order by borrow_count desc limit 1;
select avg(experience_years) as avg_experience from librarians;

select count(*) as total_students from students;

select min(borrow_date) as earliest_borrow,max(borrow_date) as latest_borrow from borrow where book_id = 101;
