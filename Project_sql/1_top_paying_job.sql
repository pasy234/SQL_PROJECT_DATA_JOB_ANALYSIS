SELECT 
    job_id,
    name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    job_posted_date AT TIME ZONE 'UTC' 
                    AT TIME ZONE 'EST'
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title = 'Data Engineer' 
AND job_location = 'Anywhere'
AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;

   