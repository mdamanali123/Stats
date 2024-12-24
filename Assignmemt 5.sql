create database company3;
use company3;
create table employees (emp_id int,emp_name varchar(40),department_id int);
insert into employees(emp_id, emp_name,department_id)
values(1,"Alice",10),
	  (2,"BOb",20), 
      (3,"Charlie",30),
      (4,"David",10),
      (5,"Eve",40);                        
select * from employees;                        
create table  department(department_id int,department_name varchar(40) );                  
insert into department(department_id,department_name)
values(10,"HR"),
	  (20,"Finance"),
	  (30,"IT"),
	  (40,"Admin"),
	  (50,"Marketing");
select * from department;
select emp_id,emp_name, department_name from employees join department on department.department_id = employees.department_id;                      
create table project(project_id int,emp_id int,project_name varchar(40));
insert into project(project_id,emp_id,project_name)
values (101,1,"Alpha"),
	   (102,2,"Beta"),
       (103,3,"Gamma"),
       (104,4,"Delta");        
select * from project;
#1. Write a query to get Employee and Department details using join. 
select  * from department join employees on department.department_id = employees.department_id;
select  emp_id,emp_name, department_name from department join employees on department.department_id = employees.department_id;
select e.emp_name,d.department_name from employees e inner join department d on e.department_id = d.department_id;
#2. Write a query to retrieve all employees with their departments, even if the department is missing.
select emp_id,emp_name, department_name from employees join department on department.department_id = employees.department_id order by emp_id;  
select e.emp_id, e.emp_name, d.department_name from employees e left join department d on e.department_id = d.department_id;
#3. Write a query to get department details even if there are no employees in that department. 
select emp_id, emp_name,department_name from department left join employees on department.department_id = employees.department_id;
#4. Write a query to get all employees and departments, whether matched or not. 
select emp_id,emp_name,department_name from employees right join department on department.department_id = employees.department_id union
select emp_id,emp_name,department_name from employees left join department on department.department_id = employees.department_id ;
#5. JOIN three tables (Employees, Departments, Projects) to get employee, department, and project information. 
select employees.emp_id, employees.emp_name,department.department_name from employees join department on department.department_id = employees.department_id union
select emp_name, project_id,project_name from employees join project on employees.emp_id = project.emp_id; 
select employees.emp_id, employees.emp_name,department.department_name,project.project_name from employees left join department on department.department_id = employees.department_id 
left join project on employees.emp_id = project.emp_id;
#6. Find employees who are not assigned to any projects.
select emp_name,project_name from employees left join project on employees.emp_id = project.emp_id where project_name is null;  
#7. Find departments with no employees using a RIGHT JOIN. 
select department_name,emp_name from employees right join department on department.department_id = employees.department_id where emp_name is null;
#8. Write a query to get Employee and Department details using join with aliases. 
select * from employees join department on department.department_id = employees.department_id;
select emp_id,department.department_id, emp_name as Employee,  department_name as Department from employees right join department on department.department_id = employees.department_id;
#9. Write a query to find employees in the same department as other employees. 
select department_name , emp_name  from employees join department on  department.department_id = employees.department_id order by department_name; #wrong command#

select a.emp_name,b.emp_name from employees a join employees b on a.department_id = b.department_id and a.emp_id != b.emp_id;

#10. Write a query to find projects managed by employees in the 'IT' department. 
select department.department_name,project.project_name,employees.emp_name from employees join project on employees.emp_id = project.emp_id
join department on department.department_id = employees.department_id where department_name = "IT";
#11. Write a query to show employees and their project information (even if not assigned to a project). 
select * from project right join employees on employees.emp_id = project.emp_id;
#12. Find employees who work in departments with names starting with 'A'. 
select emp_name, department_name from employees join department on department.department_id = employees.department_id where department_name regexp '^A';
#13. Find the total number of employees in each department using GROUP BY and JOIN. 
select department_name , count(emp_id) as number_of_employee from employees
  right join department on  department.department_id = employees.department_id  group by department_name;
#14. Get the list of departments with more than one employee. 
select department_name , count(emp_id) as number_of_employee from employees
 join department on  department.department_id = employees.department_id  group by department_name having number_of_employee > 1;