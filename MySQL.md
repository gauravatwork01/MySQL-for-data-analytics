# MySQL

## Question 1 - Extract the information about all those employees who are not managers.

```sh
select * 
from employees where emp_no not in (select emp_no from dept_manager);
```
## Question 2 - Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.

```sh
select * 
from dept_manager where
emp_no IN (select emp_no from employees where hire_date between "1990-01-01" 
and "1995-01-01" );
```


## Question 3 - Extract the information about department wise employee count in a descending order. 

```sh
select d.dept_name,count(distinct e.emp_no) as tot_emp 
from employees as e 
inner join dept_emp as de on de.emp_no=e.emp_no 
left join departments as d on d.dept_no=de.dept_no
group by d.dept_no 
order by tot_emp desc;
```
## Question 4 - Rank the employees within each department based on their hire date making sure that no ranks are missed.

```sh

select e.*,d.dept_name,dense_rank() over (partition by de.dept_no order by e.hire_date asc) as ranks
from employees as e inner join dept_emp as de on de.emp_no=e.emp_no
left join departments as d on d.dept_no=de.dept_no  ;
```

## Question 5 - Extract the information about employees who Rank 3rd within each department based on their hire date making sure that no ranks are missed.

```sh
select * from 
(
select e.*,d.dept_name,dense_rank() over (partition by de.dept_no order by e.hire_date asc) as ranks
from employees as e inner join dept_emp as de on de.emp_no=e.emp_no
left join departments as d on d.dept_no=de.dept_no  
) as t1 where ranks=3;
```

## Question 6 - Extract the information about employee hiring count between the year 1990 and 1995 for each department, and categorize the data with a threshold value of 700 into "low" and "high".

```sh

select de.dept_no,year(e.hire_date) as hire_yr,count(*) as tot_emp,
case 
 when  count(*) > 700 then "high"
 when count(*) < 700 then "low"
 end as hire_status
from employees as e inner join dept_emp as de on de.emp_no=e.emp_no
where year(e.hire_date)>=1990 and year(e.hire_date)<=1995
group by de.dept_no,hire_yr
order by de.dept_no,tot_emp asc
; 
```

