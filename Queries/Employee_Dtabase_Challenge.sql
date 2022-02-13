DROP TABLE employees CASCADE;
CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);
SELECT * FROM employees;


DROP TABLE titles CASCADE;

CREATE TABLE titles (
     emp_no INT NOT NULL,
     title VARCHAR NOT NULL,
	 from_date DATE NOT NULL,
     to_date DATE NOT NULL,
	 --PRIMARY KEY (emp_no)
	 FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM titles;

DROP TABLE retirement_info CASCADE;

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');

SELECT * FROM retirement_info;

SELECT retirement_info.emp_no,
     retirement_info.first_name,
     retirement_info.last_name,
	 titles.title,
	 titles.from_date,
	 titles.to_date
INTO retirement_titles
FROM retirement_info
INNER JOIN titles
ON retirement_info.emp_no = titles.emp_no
ORDER BY retirement_info.emp_no;

SELECT * FROM retirement_titles;

DROP TABLE unique_titles CASCADE;
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	to_date,
	title		
INTO unique_titles
FROM retirement_titles
WHERE (retirement_titles.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC; 

SELECT * FROM unique_titles;

DROP TABLE retiring_titles CASCADE;

SELECT  unique_titles.title, COUNT(*)
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY COUNT(*) DESC;
SELECT * FROM retiring_titles;

CREATE TABLE dept_emp (
     emp_no INT NOT NULL,
	 dept_no VARCHAR(4) NOT NULL,
     from_date DATE NOT NULL,
     to_date DATE NOT NULL,
     FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
     --FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
     PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM dept_emp
DROP TABLE mentorship_eligibility1 CASCADE;
SELECT employees.emp_no,
     employees.first_name,
     employees.last_name,
	 employees.birth_date,
	 dept_emp.from_date,
	 dept_emp.to_date,
	 titles.title	 
INTO mentorship_eligibility1
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
--FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (dept_emp.to_date = '9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no,to_date DESC;

SELECT * FROM mentorship_eligibility1
DROP TABLE mentorship_eligibility CASCADE;
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	birth_date,
	from_date,
	to_date,
	title
INTO mentorship_eligibility
FROM mentorship_eligibility1
ORDER BY emp_no; 


SELECT * FROM mentorship_eligibility
