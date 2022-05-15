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







