create table students
(
ID integer,
name varchar(255),
g varchar(1),
age integer
);


insert into students values(1, 'Nadine', 'F', 12);
insert into students values(2, 'Florent', 'M', 18);
insert into students values(3, 'Laura', 'F', 16);
insert into students values(4, 'Marc', 'M', 20);
insert into students values(5, 'Claude', 'M', 12);
insert into students values(6, 'John', 'M', 16);

DECLARE 

code students.ID%type:=&ID;
nbr_girls integer;
nbr_boys integer;
nbr_students integer;
st_age students.age%type;
gender students.g%type;
st_name students.name%type;

BEGIN

select count(ID) into nbr_students from students;
select count(ID) into nbr_girls from students where g='F';
select count(ID) into nbr_boys from students where g='M';
select g into gender from students where ID=code;
select age into st_age from students where ID=code;
select name into st_name from students where ID=code;


dbms_output.put_line('There are ' || nbr_students || ' students whose age is below 18');

dbms_output.put_line(nbr_girls || ' students out of the ' || nbr_students || ' are girls');

dbms_output.put_line(nbr_boys || ' students out of the ' || nbr_students || ' are boys');


if gender= 'F' then

if st_age >12 AND st_age<16 then
dbms_output.put_line(st_age || ' years old ' || st_name || ' gets a laptop and a skirt');

else
dbms_output.put_line(st_age || ' years old ' || st_name || ' gets a laptop and a pants');
end if;

else 

if gender= 'M' then

if st_age>=12 AND  st_age<16 then
dbms_output.put_line(st_age || ' years old ' || st_name || ' gets a laptop and a suit');

else
dbms_output.put_line(st_age || ' years old ' || st_name || ' gets a laptop and a dress');
end if;

end if;

end if;



END;
/

