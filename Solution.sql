/* Here you can see my optimal solution using pl/sql. 
Solution based on danse_rank() window function. Tested on Oracle SQL.*/
with agg as (
select DepartmentId, Name, Salary, dense_rank() over (partition by DepartmentId order by Salary desc) as rank
from Employee)

select d.Name as "Department", a.Name as "Employee", a.Salary as "Salary"
from agg a 
join Department d on a.DepartmentId = d.Id
where a.rank < 4
