# Pewlett-Hackard-Analysis


## Overview of the Pewlett-Hackard-Analysis: 
Bobby has proven his SQL chops, his manager has given  two more assignments: determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Then,  write a report that summarizes  analysis and helps prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement.



## Results: 

Using the ERD I created in this module as a reference and  knowledge of SQL queries, I created a Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955. Because some employees may have multiple titles in the database—for example, due to promotions I  need to use the DISTINCT ON statement to create a table that contains the most recent title of each employee. Then, use the COUNT() function to create a table that has the number of retirement-age employees by most recent job title. Finally, because we want to include only current employees in our analysis, I exclude those employees who have already left the company.

###  The Number of Retiring Employees by Title
Using the sql query file []()  and three csv file [](), [](), []() I got the below results :
![]()
 
 

1. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.

Retrieved csv file[retirement_info]()
![retirement_info]()

2. There are duplicate entries for some employees because they have switched titles over the years and we need to remove these duplicates and keep only the most recent title of each employee.[unique_titles]()
![unique_titles]()



3. I retrieved the number of employees by their most recent job title who are about to retire.
[retiring_titles]()
![retiring_titles]()

### The Employees Eligible for the Mentorship Program

Using the ERD I created in this module as a reference and knowledge of SQL queries, I created a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965 and  are eligible to participate in a mentorship program.

[mentorship_eligibility]()
![mentorship_eligibility]()
Retrieved csv file[]()
![]()


### Summary:
[]()

* How many roles will need to be filled as the "silver tsunami" begins to make an impact?
A total of 72458 positions need to be filled where 25916 positions for Senior Engineer, 24926 positions for Senior Staff, 9285 positions for Engineer, 7636 positions for Staff, 3603 positions for Technique Leader, 1090 positions for Assistant Engineer and 2 Manager.
* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

Yes, from the analysis of retirement ready employees we found that a total of 1549 employees who can mentor next generation of Pewlett Hackard employees who hold different senior titles who born in 1965 and will have time to train new employees before they retire.

[]()
 
 ![]()

  
 ![]()















