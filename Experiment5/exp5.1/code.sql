select round(
(sum(case when cuisine="American" then price else 0 end) /
sum(price))*100, 2) 
as American_Revenue 
from orders;
