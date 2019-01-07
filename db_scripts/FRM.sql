drop table Booking;
drop table Employee;
drop table roomfeature;
drop table feature;
drop table room;
drop table roomtype;
drop table destination;

drop sequence destinationIdSeq;
create sequence destinationIdSeq
  start with 1
  increment by 1;
  
create table destination(
  id numeric primary key,
  street varchar(70) not null, 
  city varchar(50) not null,
  state varchar(50) not null,
  country varchar(50) not null
);
insert into destination values(0, 'not set', 'not set', 'not set', 'not set');
insert into destination values(1, '7548 Northwest St', 'Nashville', 'TN', 'USA');
insert into destination values(2, '8457 Fayetteville', 'Altanta', 'GA', 'USA');

select * from destination;

drop sequence roomTypeIdSeq;
create sequence roomTypeIdSeq
  start with 1
  increment by 1;

create table roomtype(
  id numeric primary key,
  rtype varchar(50) not null,
  imageFilePath varchar(150) default 'no image location yet'
);
insert into roomtype values(0, 'not set', default);
insert into roomtype values(1,'Scrum Room', '');
insert into roomtype values(2,'Conference Room 1', '');
insert into roomtype values(3,'Conference Room 2', '');
insert into roomtype values(4,'Trainning Room', '');
insert into roomtype values(5,'Game Room', '');

select * from roomtype;


drop sequence roomIdSeq;
create sequence roomIdSeq
  start with 1
  increment by 1;


create table room(
  id numeric primary key,
  roomtype numeric references roomtype(id) not null,
  destination numeric references destination(id) ON DELETE CASCADE not null,
  issuperroom number(1),
  capacity numeric not null,
  name varchar(100) not null,
  constraint superbool check(issuperroom in (0,1))
);
insert into room values(0, 0, 0, 0, 0, 'not set');

select * from room;


drop sequence featureIdSeq;
create sequence featureIdSeq
  start with 1
  increment by 1;


create table feature(
	id numeric primary key,
	name varchar(35) not null,
  imageFilePath varchar(150) default 'no image location yet'
);
insert into feature values(0, 'not set', default);
insert into feature values(1,'Monitors','');
insert into feature values(2,'Chairs','');
insert into feature values(3,'Desks','');
insert into feature values(4,'TV','');
insert into feature values(5,'Projector','');

select * from feature;



create table roomfeature(
	id numeric primary key,
	room numeric references room(id) ON DELETE CASCADE not null,
	feature numeric references feature(id) ON DELETE CASCADE not null,
	quantity numeric not null,
	constraint feat_uq unique(room,feature)
);

select * from roomfeature;



--Employee Type
  --Super admin
  --Admin
  --User 
drop sequence EmployeeIdSeq;
create sequence EmployeeIdSeq
  start with 1
  increment by 1;
  

create table Employee(
  id numeric primary key,
  home numeric DEFAULT 0,
  password varchar(15) not null,
  name varchar(50) not null,
  phone varchar(10) not null unique,
  email varchar(50) not null unique,
  etype varchar(10) not null,
  CONSTRAINT emp_fk foreign key (home) REFERENCES destination(id) ON DELETE SET NULL--SET DEFAULT not implemented
); 
insert into employee values(0,0,'not set','not set','not set','not set','not set');
 insert into Employee values(1, 2, 'syntel123$','Ousmane Diallo','9013384952','minos@gmail.com','User');
 insert into Employee values(2, 1, 'syntel123$','Mahesh','9012245962','mahesh@syntelinc.com','Admin');
 insert into Employee values(3, 2, 'syntel123$','Nate ','4587984652','nate@gmail.com','User');
 insert into Employee values(4, 1, 'syntel123$','Betty','9015874986','betty@syntelinc.com','SuperAdmin');
 
 select * from Employee;
 
 
  drop sequence bookingIdSeq;
 create sequence bookingIdSeq
  start with 1
  increment by 1;

 

create table Booking(
  id numeric primary key,
  employee numeric references Employee(id) ON DELETE CASCADE,
  room numeric references room(id) ON DELETE CASCADE,
  startdate date not null,
  enddate date not null,
  starttime numeric not null,
  endtime numeric not null
  
);
 
 select * from Booking;
 
commit;
 