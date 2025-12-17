/*
    Question: What are the top paying data analyst jobs?
    - Identify the top 10 highest-paying Data Analyst roles that are available remotely.
    - Fouses on job postings with specified salaries (remove nulls)
    - Why? highlight the top paying opportunities for Data Analyst, offering insights into 
 */
SELECT 
	job_id,
    job_title,
    job_location,
    name as company_name,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
from 
	job_postings_fact AS jpost
LEFT JOIN company_dim AS cmp 
	ON jpost.company_id = cmp.company_id
WHERE job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere' 
    AND salary_year_avg IS NOT NULL
ORDER BY 
	salary_year_avg DESC
LIMIT 10;


/*
Key Findings & Insights

- High salary potential : The highest-paying Data Analyst positions earn significantly more than the typical market average,
highlighting strong demand for senior or specialized skills.

- Employer concentration : Top salaries are offered by a relatively small number of companies,
showing that where you work has a major impact on compensation.

- Consistent high-paying demand : These roles appear across different job schedules and posting dates, 
indicating that high compensation is a consistent market trend rather than a short-term anomaly.
*/
