/* Write a query to count the number of students across departments who has scored more than 80 marks.*/

select department, count(case when Marks>80 then 1 else NULL end ) as Dept_HighScore_Count from student group by department;
