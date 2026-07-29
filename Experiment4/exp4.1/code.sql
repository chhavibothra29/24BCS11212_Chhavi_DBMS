-- Customers and Orders: List the customer_name and order_date for all customers who have placed orders.

-- All Customers and Their Orders: List all customer names and their corresponding product_name from orders, if they have any. Include customers even if they haven't placed any orders.

-- Find Products and Their Orders: Display Product Name and the order_date from all the products that are ordered.

select c.customer_name, o.order_date from orders as o
left join customers as c 
on o.customer_id = c.customer_id;

select c.customer_name, o.product_name from customers as c
left join orders as o
on c.customer_id=o.customer_id;

select p.product_name, o.order_date from products as p
inner join orders as o
on o.product_name=p.product_name;
