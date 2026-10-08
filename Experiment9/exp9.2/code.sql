create or replace function salary_hike_func()
returns Trigger
AS
$$
	Begin
		if New.emp_salary - Old.emp_salary > Old.emp_salary * 0.15 then
			Raise Exception 'The salary hike cannot be more than 15 percent of the old salary';
		end if;

		return New;
	End;
$$ language plpgsql

create trigger salary_hike_trig
Before update
on employees
For each row
Execute function salary_hike_func()

update employees set emp_salary = 100000 where emp_id = 103
