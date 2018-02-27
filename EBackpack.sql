DROP TABLE Admin CASCADE CONSTRAINTS;
CREATE TABLE Admin(
   username varchar(25) not null,
   password varchar(25) not null,
   primary key (username)
 );   

DROP TABLE Student CASCADE CONSTRAINTS;
CREATE TABLE Student(
	phoneNo char(11) not null,
	email varchar(25) not null,
	fName varchar(15) not null,
	lName varchar(15) not null,
	username varchar(25) not null,
	password varchar(25) not null,
	primary key (username)
);
    
DROP TABLE Calendar CASCADE CONSTRAINTS;
CREATE TABLE Calendar(
    eventDate date not null,
    username varchar(25) not null,
    calendarID integer not null,
    primary key(calendarID),
	constraint FK_calendar foreign key(username) references Student (username)
);
    
DROP TABLE Event CASCADE CONSTRAINTS;
CREATE TABLE Event(
    eventDescription varchar(100),
    location varchar(25),
    eventID integer not null,
    hour1 integer not null,
    minutes integer not null,
    cID integer not null,
    primary key(eventID),
    constraint FK_event foreign key(cID) references Calendar (calendarID)
);

INSERT INTO Admin VALUES('k1moua', '1234'); 
INSERT INTO Admin VALUES('y1cao', '5678'); 
INSERT INTO Student VALUES('3203389117', 'ErnestWilliams@gmail.com', 'Ernest','Williams','ernestW', 'ernestW');
INSERT INTO Calendar VALUES(TO_DATE('2018/05/03', 'yyyy/mm/dd'), 'ernestW', '1'); 
INSERT INTO Event VALUES('Have to attend - FAE', 'CSB HAB', '1', '14', '05', '1' );
INSERT INTO Event VALUES('Optional visual FAE', 'SJU PENGL', '2', '15', '15', '1' );




  

