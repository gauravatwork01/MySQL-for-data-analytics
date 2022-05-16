# MySQL
## Question 1 - Extract the information about count of employees in all the departments.

```sh
select d.dept_name,count(*) as tot_emp 
from employees as e left join dept_emp as de on de.emp_no=e.emp_no 
left join departments as d on d.dept_no=de.dept_no
group by d.dept_name;
```
Corresponding Tableau link
[https://public.tableau.com/views/dept_emp_cnt/Dashboard1?:language=en-GB&publish=yes&:display_count=n&:origin=viz_share_link]
