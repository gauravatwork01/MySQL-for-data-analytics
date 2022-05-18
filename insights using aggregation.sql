/*Extract the information about count of employees in all the departments.*/

select d.dept_name,count(*) as tot_emp 
from employees as e left join dept_emp as de on de.emp_no=e.emp_no 
left join departments as d on d.dept_no=de.dept_no
group by d.dept_name; 

/* Corresponding report link */
https://public.tableau.com/views/dept_emp_cnt/Dashboard1?:language=en-GB&publish=yes&:display_count=n&:origin=viz_share_link

/*Extract the information about last 5 joinies in all the departments in the year 1999 .*/


select *,row_number() over (partition by de.dept_no order by from_date desc)  
from 
employees as e left join dept_emp as de on de.emp_no=e.emp_no
where e.hire_date between "2000-01-01" and "2000-01-10"; 



/*Extract the information about the employee whose salary is highest as on 2000-01-01 .*/
select * from 
employees as e 
left join salaries as s on s.emp_no=e.emp_no 
where ("2000-01-01" between from_date and to_date)
order by salary desc limit 1;


/*Extract the information about department wise breakage of total money invested as salary as on 2000-01-01 .*/
select d.dept_name,sum(salary) from 
employees as e left join dept_emp as de on de.emp_no=e.emp_no
left join departments as d on d.dept_no=de.dept_no
left join salaries as s on s.emp_no=e.emp_no 
where ("2000-01-01" between s.from_date and s.to_date)
group by de.dept_no
order by sum(salary) desc ;

































