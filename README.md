# Introduction

Deep dive into data job market! Foucing on data analyst role, this project explores top-paying job, in-demand skills, abd where high demand meets high salary in data analytics.

🔍SQL querires? Check them out here: [project_sql folder](/project_sql)

# Background

📊 Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in demand skills, stremlining others work to find optimal jobs.

Alot of thanx for 'Luke Barousse', he help me alot thorw his Youtube course [SQL Course](https://www.youtube.com/watch?v=7mz73uXD9DA&t=9809s)
it's packed with insights on job titles, salaries, locations, and essential skills.

## The questios I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs in Saudi Arabia?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used

For my deep dive into data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & Github:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis

Each query for this project aimed at investigating sepcific aspects of the data analyst job market. Here's how I approached each question:

### 1. Top Paying Data Analyst Jobs

This query identifies the **top 10 highest-paying Data Analyst roles** with available salary data by joining job postings with company information and sorting by annual salary.

```sql
SELECT
	job_id,
    job_title,
	job_title_short,
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
```

### 📊 Key Insights from Top Paying Data Analyst Roles

- **Leadership roles command the highest salaries :**
  Positions such as Director of Analytics and Principal Data Analyst dominate the top salary range, highlighting the strong link between seniority and compensation.

- **Job title alone does not limit earning potential :**
  Roles titled simply Data Analyst still appear among the highest-paying positions, indicating that company scope and responsibilities matter more than the title itself.

- **Remote and hybrid roles offer competitive pay :**
  Several high-paying roles are labeled Remote or Hybrid, showing that flexible work arrangements do not reduce salary potential.

![Top Paying Data Analyst Jobs](assets/top_paying_jobs_additional.png)

_Bar graph visualizing the salary fir the top 10 salaries for data analysts, ChatGPT gererated this graph from my SQL query results_

### 2. Skills for Top Paying Jobs

To understand what skills are required for top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-conpensation role.

```sql
WITH top_paying_jobs AS (
    SELECT job_id,
        job_title,
        name as company_name,
        salary_year_avg
    from job_postings_fact AS jpost
        LEFT JOIN company_dim AS cmp ON jpost.company_id = cmp.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT
	top_paying_jobs.*,
    skills
FROM
	top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
	salary_year_avg DESC;
```

Here's the breakdown of the most demanded skills for the top 10 highest paying data analyst jobs in 2023:

- **SQL** is leading with a bold count of 8.
- **Python** follows closely with a bold count of 7.
- **Tableau** is also highly sought after, with count if 6. other skills like **R, Snowflake, Pandas, and excel** show varying degrees of demand

![Top Paying Data Analyst Jobs](assets/any.png)

_Bar graph visualizing the salary fir the top 10 paying jobs for data analysts, ChatGPT gererated this graph from my SQL query results_

# 🎯🥇 What I Learned 🎉

Throughout this adventure, I've Turbocharged my SQL toolkit with some serious firepower:

- **Complex Query Crafting:** Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
- **📉 Data Aggregation:** Got excelant with GROUP BY and turned aggregate function like COUNT() and AVG() into my data-summarizing sidekicks.
- **📈 Analytical Wizard:** Leveled up my reat-world puzzle-solving skills, turning questions into actionable, insightfull SQL queries.

# Conclusions

This Project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to priortizing skill development and jog search efforts. aspiring data analysts can better postion themselves in cometivtive job market by focusing in high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the filed of data analytics.
