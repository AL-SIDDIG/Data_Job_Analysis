/*
	Question: what are the most in-demand skills for data analyst in Saudi Arabia?
	- Join job posting to inner join table similer to qury 2
	- identify the top 5 in-demand skills for a data analyst
	- Focus of all job postings. 
 */
SELECT 
	skills,
	COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
	job_title_short = 'Data Analyst' AND
	job_country = 'Saudi Arabia'
GROUP BY 
	skills
ORDER BY demand_count DESC
LIMIT 5;


SELECT
	job_country,
	job_location
FROM job_postings_fact
WHERE
	job_country LIKE 'Saudi Arabia'
LIMIT 1000;