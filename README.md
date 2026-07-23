# 24BCS11212_Chhavi_DBMS

//Experiment - 1 

--Complete the queries below to insert data into the tables & retrieving the first records from the first 3 tables.

-- Inserting Data into Doctors Table
INSERT INTO Doctors (DoctorID, Name, Specialization, ContactNumber, Email) VALUES
(1, 'Dr. John Smith', 'Cardiology', '1234567890', 'john.smith@hospital.com'),
(2, 'Dr. Lisa Brown', 'Neurology', '0987654321', 'lisa.brown@hospital.com');

-- Inserting Data into Patients Table
INSERT INTO Patients (PatientID, Name, DOB, Gender, ContactNumber, Address) VALUES
(1, 'Alice Johnson', '1990-05-21', 'Female', '1112223333', '123 Main St'),
(2, 'Bob Martin', '1985-08-14', 'Male', '4445556666', '456 Elm St');

-- Inserting Data into Appointments Table
INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, Status) VALUES
(1, 1, 1, '2025-02-15', 'Scheduled'),
(2, 2, 2, '2025-02-16', 'Completed');

-- Inserting Data into Treatments Table
INSERT INTO Treatments (TreatmentID, PatientID, DoctorID, Diagnosis, TreatmentDescription, TreatmentDate) VALUES
(1, 1, 1, 'Hypertension', 'Prescribed medication', '2025-02-15'),
(2, 2, 2, 'Migraine', 'MRI Scan and medications', '2025-02-16');

-- Inserting Data into MedicalRecords Table
INSERT INTO MedicalRecords (RecordID, PatientID, TreatmentID, Notes) VALUES
(1, 1, 1, 'Patient responding well to treatment'),
(2, 2, 2, 'Further evaluation required');

-- Inserting Data into Billing Table
INSERT INTO Billing (BillID, PatientID, TreatmentID, Amount, BillDate, Status) VALUES
(1, 1, 1, 200.00, '2025-02-15', 'Paid'),
(2, 2, 2, 500.00, '2025-02-16', 'Unpaid');

--Now write the queries for retrieving the first records from the first three tables (Doctors, Patients, Appointments).
SELECT * FROM DOCTORS 
LIMIT 1;

SELECT * FROM Patients 
LIMIT 1;

SELECT * FROM Appointments 
LIMIT 1;


//Experiment - 2.1

-- Write a query using union to stack the table 'Arts' over 'Science' and output the final table 

select * from Arts union select * from Science;

//Experiment - 2.2

-- Write a query to output a single table with the names of employees in both  the table 'employee' and 'pt_employee'.
Employee names are added on the field emp_name in both the tables.
Note: Do not remove the duplicate names while combining both the tables. */

select emp_name from employee union all select emp_name from pt_employee;

//Experiment - 2.3

-- Write a query to find the list of fruits available in the supermarket.
(f_name column has the name of the fruits and inv_name has the name of inventories, you are suppose to output the name of the fruits.)*/
select f_name  from fruit intersect select  inv_name from inventory;


//Experiment - 2.4

--Write a query to output the name of the fruits (f_name) from the table 'fruit' which are not present in the table  inventory(f_name column has the name of the fruits and inv_name has the name of the items in inventory). */

select f_name from fruit except select inv_name from inventory;

//Experiment - 3.1

/* Write a query to count the number of students across departments who has scored more than 80 marks.*/

select department, 
count(case when Marks>80 then 1 else NULL end ) as Dept_HighScore_Count
from student 
group by department;

//Experiment - 3.2

CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(100) NOT NULL,
emp_salary DECIMAL(10, 2) NOT NULL,
emp_city VARCHAR(100) NOT NULL
);

INSERT INTO employees (emp_id, emp_name, emp_salary, emp_city) VALUES
(101, 'Amit Sharma', 85000.00, 'Mumbai'),
(102, 'Priya Patel', 95000.00, 'Mumbai'),
(103, 'Rahul Verma', 60000.00, 'Delhi'),
(104, 'Ananya Iyer', 110000.00, 'Bangalore'),
(105, 'Vikram Singh', 55000.00, 'Delhi'),
(106, 'Sneha Reddy', 105000.00, 'Bangalore'),
(107, 'Rohan Das', 72000.00, 'Kolkata')

- - AGGREGATE FUNCTION -> SUM(),MIN(),MAX(),AVG(),COUNT()
- - COUNT NUMBER OF EMPLOYEES IN EACH CITY
-- (I)
SELECT emp_city,COUNT(*) AS EMP_COUNT
FROM employees
GROUP BY EMP_CITY
- - (II)

SELECT emp_city,COUNT(EMP_ID) AS EMP_COUNT
FROM employees
GROUP BY EMP_CITY

- - FIND THE AVERAGE SALARY OF EACH CITY

SELECT emp_city,AVG(EMP_SALARY)::NUMERIC(20,2) AS AVG_SAL
FROM employees
GROUP BY EMP_CITY

- - COUNT THE NUMBER OF EMPLOYEE IN EACH CITY WHOSE SALARY IS GREATER THAN EQUAL TO 90000
-- AND SORT THE DATA ON THE BASIS OF EMP_CITY IN DESCEDING ORDER
SELECT emp_city,SUM(CASE WHEN EMP_SALARY>=90000 THEN 1 ELSE 0 END) AS EMP_COUNT
FROM employees
GROUP BY EMP_CITY
ORDER BY EMP_CITY DESC
- - COUNT THE NUMBER OF EMPLOYEE IN EACH CITY WHOSE SALARY IS GREATER THAN EQUAL TO 90000
-- AND SORT THE DATA ON THE BASIS OF EMP_CITY IN ASCENDING ORDER
-- (I)
SELECT emp_city,SUM(CASE WHEN EMP_SALARY>=90000 THEN 1 ELSE 0 END) AS EMP_COUNT
FROM employees
GROUP BY EMP_CITY
ORDER BY EMP_CITY ASC
- - (II)
SELECT emp_city,SUM(CASE WHEN EMP_SALARY>=90000 THEN 1 ELSE 0 END) AS EMP_COUNT
FROM employees
GROUP BY EMP_CITY
ORDER BY EMP_CITY
- - COUNT THE NUMBER OF EMPLOYEE IN EACH CITY WHOSE SALARY IS GREATER THAN EQUAL TO 90000
-- AND SORT THE DATA ON THE BASIS OF EMP_COUNT IN DECENDING ORDER
- - (I)
SELECT emp_city,SUM(CASE WHEN EMP_SALARY>=90000 THEN 1 ELSE 0 END) AS EMP_COUNT
FROM employees
GROUP BY EMP_CITY
ORDER BY EMP_COUNT DESC
- - (II)
SELECT emp_city,SUM(CASE WHEN EMP_SALARY>=90000 THEN 1 ELSE 0 END) AS EMP_COUNT
FROM employees
GROUP BY EMP_CITY
ORDER BY SUM(CASE WHEN EMP_SALARY>=90000 THEN 1 ELSE 0 END) DESC
- -
-- FIND THE MAXIMUM EMPLOYEE SALARY OF EACH CITY

SELECT emp_city,MAX(EMP_SALARY) AS MAX_SALARY
FROM employees
GROUP BY EMP_CITY

//Experiment - 3.3

SELECT NAME AS CUSTOMERS FROM CUSTOMERS
WHERE ID NOT IN(
SELECT CUSTOMERID FROM ORDERS
)

//Experiment - 3.4

-- Write your MySQL query statement below
SELECT Employee.name,Bonus.bonus FROM Employee 
LEFT JOIN Bonus ON Employee.empID = Bonus.empID
WHERE bonus < 1000 OR Bonus IS NULL ;
