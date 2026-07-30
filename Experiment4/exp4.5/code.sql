select e.employee_name as Employee, m.employee_name as Manager
from employees e
left join employees m
on e.manager_id=m.employee_id;

select c.customer_name, p.product_name
from customers c
cross join products p;
