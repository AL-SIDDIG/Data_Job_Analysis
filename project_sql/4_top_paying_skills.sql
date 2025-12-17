/*
	Answer: What are the top skills based on salary?
	- Look at the average salary associated with each skill for data analyst positions
	- Foucses on roles with specified salaries, regardless of location
	- Why? It reveals how different skills impact salary levels for Data Analyst and
		help identify the most financally rewarding skills to acquire or improve
*/

SELECT 
	skills,
	ROUND(AVG(salary_year_avg), 0) AS avg_sal
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
	job_title_short = 'Data Analyst' AND
	-- salary_year_avg IS NOT NULL AND
	job_country = 'Saudi Arabia'
GROUP BY 
	skills
ORDER BY 
	avg_sal DESC
LIMIT 25;