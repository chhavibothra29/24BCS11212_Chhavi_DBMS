/* Write a query using union to stack the table 'Arts' over 'Science' and output the final table */
Select *
from Arts
union
select *
from Science
