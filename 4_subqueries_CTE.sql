SELECT *
FROM(
        -- Subquery starts here
        SELECT *
        FROM job_postings_fact
        WHERE EXTRACT(
                MONTH
                FROM job_posted_date
            ) = 1
    ) AS Jan_jobs;
-- Subquery ends here
SELECT company_name As name,