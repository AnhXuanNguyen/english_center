create database englishcenter;
use englishcenter;
create table admin(
    name nvarchar(50),
    email varchar(50),
    dob date,
    address nvarchar(50),
    phone varchar(10),
    username varchar(50),
    password varchar(50)
);
create table ministry(
    id int auto_increment primary key ,
    name nvarchar(50),
    email varchar(50),
    dob date,
    address nvarchar(50),
    phone varchar(10),
    username varchar(50),
    password varchar(50)
);
create table teacher(
    id int auto_increment primary key ,
    name nvarchar(50),
    email varchar(50),
    dob date,
    address nvarchar(50),
    phone varchar(10),
    username varchar(50),
    password varchar(50)
);
create table course(
    id int auto_increment primary key ,
    name varchar(50)
);
create table teacher_course(
    id int auto_increment primary key ,
    teacherid int,
    courseid int,
    foreign key (teacherid) references teacher(id),
    foreign key (courseid) references course(id)
);
create table diary(
    id int auto_increment primary key ,
    title nvarchar(50),
    writedate date,
    content nvarchar(500)
);
create table grade(
    id int auto_increment primary key ,
    name varchar(20),
    diaryid int,
    courseteacherid int,
    foreign key (diaryid) references diary(id),
    foreign key (courseteacherid) references teacher_course(id)
);
create table student(
    id int auto_increment primary key ,
    name nvarchar(50),
    email varchar(50),
    dob date,
    address nvarchar(50),
    phone varchar(10),
    username varchar(20),
    password varchar(20),
    gradeid int,
    foreign key (gradeid) references grade(id)
);
create table mark(
                     id int auto_increment primary key ,
                     smark double,
                     studentid int,
                     foreign key(studentid) references student(id)
);