create table newstudent(
	StudentId int NOT NULL,
	SurName	varchar(30) NOT NULL,
	FirstName varchar(30) NOT NULL,
	MiddleName varchar(30) NOT NULL,
	Gender varchar(6) NOT NULL,
	AdmitDate date NOT NULL
);

select concat(SurName,' ',FirstName,' ',MiddleName) as Name from newstudent where StudentId = 1

select * from newstudent where SurName = 'Shah'

select * from newstudent where Gender = 'Male'

select * from newstudent where Gender = 'Female' and SurName = 'Patel' or AdmitDate > '2006-01-01'

select * from newstudent where  MiddleName Like '%Bhai'

select * from newstudent where  FirstName Like 'M%' and MiddleName Like '%ant%'

select * from newstudent where  SurName Like '__c%'

select concat(FirstName,' ',LEFT(MiddleName, 1),'. ',SurName) as Name from newstudent

select FirstName ,len(FirstName) as Length from newstudent

select concat(SurName,' ',FirstName,'bhai ',MiddleName) as Name from newstudent where FirstName NOT Like '%bhai'

select concat('Mr. ',FirstName) as FirstName from newstudent 

select * from newstudent where  FirstName Like '%Mira%'


