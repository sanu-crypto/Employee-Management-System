CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    dept_count INT,
    location VARCHAR(50)
);
INSERT INTO departments VALUES
(201,'HR',4,'Delhi'),
(202,'IT',6,'Bangalore'),
(203,'Finance',3,'Mumbai'),
(204,'Marketing',5,'Chennai'),
(205,'Sales',4,'Hyderabad');


CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary INT,
    dept_id INT,
    hire_date DATE,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
INSERT INTO employee VALUES
(1,'Rahul',30,60000,201,'2018-05-10',101),
(2,'Priya',28,55000,202,'2019-06-15',102),
(3,'Amit',32,48000,203,'2021-03-20',103),
(4,'Sneha',26,29000,201,'2022-07-11',101),
(5,'Rohit',29,52000,202,'2020-08-25',102),
(6,'Anita',27,31000,204,'2019-01-10',104),
(7,'Vikram',35,75000,205,'2017-11-05',105),
(8,'Pooja',31,45000,203,'2018-09-12',103),
(9,'Karan',25,27000,202,'2023-02-18',102),
(10,'Meena',33,68000,201,'2016-04-30',101),
(11,'Ajay',28,35000,204,'2020-10-21',104),
(12,'Neha',30,41000,205,'2019-07-19',105),
(13,'Sanjay',34,90000,202,'2015-06-01',102),
(14,'Divya',26,24000,203,'2022-03-08',103),
(15,'Arjun',29,53000,201,'2018-12-15',101);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO customers VALUES
(1,'Ramesh','Delhi'),
(2,'Suresh','Mumbai'),
(3,'Anita','Kolkata'),
(4,'Raj','Chennai'),
(5,'Priya','Bangalore');


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount INT
);
INSERT INTO orders VALUES
(101,1,'2024-01-10',5000),
(102,2,'2024-02-15',7000),
(103,3,'2024-03-20',3000),
(104,4,'2024-04-11',8000),
(105,5,'2024-05-05',6500);

-- 1 Retrieve all employees
SELECT * FROM employee;

-- 2 Display employee name and salary
SELECT name, salary 
FROM employee;

-- 3 Salary greater than 50000
SELECT * 
FROM employee
WHERE salary > 50000;

-- 4 Employees working more than 5 years
SELECT * 
FROM employee
WHERE hire_date <= DATEADD(YEAR,-5,GETDATE());

-- 5 Employees in department 201
SELECT * 
FROM employee
WHERE dept_id = 201;

-- 6 Salary less than 30000
SELECT * 
FROM employee
WHERE salary < 30000;

-- 7 Sort employees by salary descending
SELECT * 
FROM employee
ORDER BY salary DESC;

-- 8 Average salary
SELECT AVG(salary) AS average_salary
FROM employee;

-- 9 Maximum salary
SELECT MAX(salary) AS max_salary
FROM employee;

-- 10 Departments having more than 3 employees
SELECT dept_id, COUNT(*) AS total_employees
FROM employee
GROUP BY dept_id
HAVING COUNT(*) > 3;

-- 11 Employees with maximum salary
SELECT *
FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee);

-- 12 Second highest salary
SELECT MAX(salary) AS second_highest_salary
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee);