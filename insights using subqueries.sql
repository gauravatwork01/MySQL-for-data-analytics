/*Extract the information about all those employees who are not managers*/

select * 
from employees where emp_no not in (select emp_no from dept_manager);


# Subqueries
/*Extract the information about Top 3 paid employees(based on salary) within each department as on 2000-01-01 .*/

select * from (
select e.emp_no,de.dept_no,s.salary,s.from_date,s.to_date,
row_number() over (partition by de.dept_no order by s.salary desc) as row_num
from employees as e inner join salaries as s on s.emp_no=e.emp_no
inner join dept_emp as de on de.emp_no=e.emp_no  
where ("2000-01-01" between s.from_date and s.to_date) 
) as t1 where row_num<=3
;  

# Subqueries

/*Extract the information about 3rd most paid employee in the entire organization(i.e include all departments) as on 2000-01-01 .*/
select * from 
(select e.emp_no,s.salary,s.from_date,s.to_date,row_number() over () as row_num
from employees as e inner join salaries as s on s.emp_no=e.emp_no
where ("2000-01-01" between from_date and to_date) 
order by salary desc 
) t1 where row_num=3
; 





/*Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.*/


select * from dept_manager where
emp_no IN (select emp_no from employees where hire_date between "1990-01-01" 
and "1995-01-01" );



/*Select the entire information for all employees whose job title is “Assistant Engineer”. */


select * from employees
where emp_no IN (select emp_no from titles where title="Assistant Engineer");



/*Extract the information about all department managers who are managing more than 1 departments.*/


select * from employees
where emp_no IN (select emp_no from dept_emp
group by emp_no having count(*)>1 );







