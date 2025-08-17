-- This SQL query retrieves the top 10 highest paying jobs for Data Scientists
SELECT 
    j.job_id,
    c.name AS company_name,
    j.job_title_short,
    j.salary_year_avg,
    j.job_location
FROM job_postings_fact j
LEFT JOIN company_dim c 
    ON j.company_id = c.company_id
WHERE j.job_title_short = 'Data Scientist'
  AND j.salary_year_avg IS NOT NULL
ORDER BY j.salary_year_avg DESC
LIMIT 10;
