CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary NUMERIC(10,2),
    dept_name VARCHAR(25)
);

CREATE OR REPLACE PROCEDURE Insert_employees (
    p_emp_id INT, p_emp_name VARCHAR(50), p_salary NUMERIC(10,2), p_dept_name VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
IF p_emp_id%2=0 THEN
RAISE EXCEPTION 'Even IDs are not allowed.';
ELSE
INSERT INTO Employee VALUES(p_emp_id, p_emp_name, p_salary, p_dept_name);
RAISE NOTICE 'Employee detail inserted successfully.';
END IF;
END;
$$;

CALL Insert_employees(100, 'Chhavi' , 200000.00, 'CSE');
CALL Insert_employees(101, 'Ankita' , 200000.00, 'CSE');
SELECT * FROM Employee;
