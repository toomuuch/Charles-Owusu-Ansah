-- Select all the employees who were born between January 1, 1952 and December 31, 1955 and their titles and title date ranges
-- Order the results by emp_no
with about_to_retire as (select * from employees 
where to_char(birth_date, 'MM-DD-YYYY') between '01-01-1952' and '12-31-1955')
select about_to_retire.emp_no, 
		about_to_retire.first_name,
		about_to_retire.last_name,
		about_to_retire.birth_date,
		titles.title,
		titles.from_date,
		titles.to_date
		from about_to_retire join titles 
		on about_to_retire.emp_no=titles.emp_no
		order by emp_no;


  -- **Note:** There are duplicate entries in the `titles` table for some employees because they have switched titles over the years.


--Write another query that builds off of the previous query, but selects only the current title for each employee.	
with prev_tit as (
with about_to_retire as (select * from employees 
where to_char(birth_date, 'YYYY-MM-DD') between '1952-01-01' and '1955-12-31')
	
select about_to_retire.emp_no, 
		about_to_retire.first_name,
		about_to_retire.last_name,
		about_to_retire.birth_date,
		titles.title,
		titles.from_date,
		titles.to_date
		from about_to_retire join titles 
		on about_to_retire.emp_no=titles.emp_no
		order by emp_no),
		
latest_title as (
select emp_no, max(from_date) as most_recent from titles group by emp_no)

select prev_tit.emp_no, prev_tit.first_name, prev_tit.last_name, prev_tit.title as current_title from prev_tit join latest_title on ((prev_tit.emp_no=latest_title.emp_no) and (prev_tit.from_date=latest_title.most_recent));



--Write a query that counts the total number of employees about to retire by their current job title.
with latest_title as (
with prev_tit as (
with about_to_retire as (select * from employees 
where to_char(birth_date, 'YYYY-MM-DD') between '1952-01-01' and '1955-12-31')
	
select about_to_retire.emp_no, 
		about_to_retire.first_name,
		about_to_retire.last_name,
		about_to_retire.birth_date,
		titles.title,
		titles.from_date,
		titles.to_date
		from about_to_retire join titles 
		on about_to_retire.emp_no=titles.emp_no
		order by emp_no),
		
latest_title as (
select emp_no, max(from_date) as most_recent from titles group by emp_no)

select prev_tit.emp_no, prev_tit.first_name, prev_tit.last_name, prev_tit.title as current_title from prev_tit join latest_title on ((prev_tit.emp_no=latest_title.emp_no) and (prev_tit.from_date=latest_title.most_recent)))

select current_title, count (*) as emp_cnt from latest_title group by current_title;



--Write a query to count the total number of employees per department.
with cnt_by_dept as(
select dept_no, count(emp_no) as emp_cnt from dept_emp group by dept_no )
select dept_name, cnt_by_dept.emp_cnt from departments join cnt_by_dept on (departments.dept_no=cnt_by_dept.dept_no);


--**Bonus**: Find the highest salary per department and department manager.
--Highest salary per department manager
with latest_manager_salaries as (
with latest_salaries as (
with latest_title as( 
select emp_no,
		max(from_date) as latest_appt 
		from salaries group by emp_no)
select latest_title.*, 
		salaries.salary 
		from salaries join latest_title 
		on salaries.emp_no=latest_title.emp_no 
		and salaries.from_date=latest_title.latest_appt
		order by emp_no),

current_managers as(
select dept_no, emp_no, from_date from dept_manager where to_date= '9999-01-01')
	
select current_managers.dept_no, 
		latest_salaries.emp_no, 
		latest_salaries.salary 
		from current_managers join
		latest_salaries on current_managers.emp_no=latest_salaries.emp_no)
select max(salary) from latest_manager_salaries


--Highest salary per department
with latest_title_salaries as (
with latest_title_date as(
with latest_title as (select emp_no, max(from_date) as from_date from dept_emp group by emp_no)
select latest_title.emp_no, 
		latest_title.from_date, 
		dept_emp.dept_no
		from latest_title join dept_emp 
		on latest_title.emp_no=dept_emp.emp_no
			and dept_emp.from_date=latest_title.from_date)
			select latest_title_date.emp_no,
					latest_title_date.dept_no,
					salaries.salary
					from latest_title_date join salaries
					on latest_title_date.emp_no=salaries.emp_no
					and latest_title_date.from_date=salaries.from_date
					order by emp_no)
		select dept_no, 
				max(salary) as highest_salary from
				latest_title_salaries
				group by dept_no
				order by dept_no 