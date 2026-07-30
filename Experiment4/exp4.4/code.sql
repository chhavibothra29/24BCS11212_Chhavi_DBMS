select s.*, c.*
from student s
full outer join course c
on s.Course_id=c.Course_id;
