SELECT job_title_short AS Title,
    job_location AS Locatio,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS full_date,
    EXTRACT(
        DAY
        FROM job_posted_date
    ) AS date_day,
    EXTRACT(
        MONTH
        FROM job_posted_date
    ) AS date_month,
    EXTRACT(
        YEAR
        FROM job_posted_date
    ) AS date_year
FROM job_postings_fact
LIMIT 5;
-- How is job posting is trending form month to nonth ?
SELECT COUNT(job_id) AS job_posted_count,
    EXTRACT(
        MONTH
        FROM job_posted_date
    ) AS month
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY month
ORDER BY month DESC;
---------------------------------------------
/* Problem : Create Table From Other Tables
 - Create three table :
 * Jan 2023 jobs
 * Feb 2023 jobs
 * Mar 2023 jobs 
 */
CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 1;
SELECT *
FROM job_postings_fact;