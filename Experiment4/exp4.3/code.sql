select c.customer_name, o.* from orders o
left join customers c
where o.customer_id=c.customer_id;

select p.product_name, c.category_name from products p
full outer join categories c
where p.category_id=c.category_id;

select c.category_name, p.product_name, p.price from categories c
left join products p
where c.category_id=p.category_id;
