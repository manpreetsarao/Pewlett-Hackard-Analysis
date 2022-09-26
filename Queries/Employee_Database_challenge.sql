-- Creating Retirement table
SELECT em.emp_no,
     em.first_name,
	 em.last_name,
     ti.title,
	 ti.from_date,
	 ti.to_date
INTO ret_title	 
FROM employees as em
INNER JOIN titles as ti
ON em.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_title 
FROM ret_title as rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

-- Creating retireing title count table
SELECT COUNT(ut.title) as "count", ut.title 
INTO retiring_titles
FROM unique_title as ut
GROUP BY ut.title 
ORDER BY "count" DESC;
----------------------------
--Creating Mentorship table
SELECT DISTINCT ON (em.emp_no) em.emp_no,
     em.first_name,
	 em.last_name,
	 em.birth_date,
	 dem.from_date,
	 dem.to_date,
	 ti.title
INTO ment_elig
FROM employees as em
INNER JOIN dept_emp as dem
ON (em.emp_no = dem.emp_no)
INNER JOIN titles as ti
ON (em.emp_no = ti.emp_no)
WHERE (dem.to_date = ('9999-01-01'))
AND(em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY em.emp_no;
	 
