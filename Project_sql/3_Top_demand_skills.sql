/*
     EXAMPLE 1
     Example 1 = "What are the most in-demand skills for Data Scientist jobs overall?

WITH top_demand_skills AS (SELECT
     skills_dim.skills AS demand_skills,
     count(skills_job_dim.job_id) AS skill_count     
FROM job_postings_fact j
INNER JOIN skills_job_dim ON 
j.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON 
skills_job_dim.skill_id = skills_dim.skill_id
WHERE j.job_title_short = 'Data Scientist'
GROUP BY skills_dim.skills, j.job_title_short
ORDER BY skill_count DESC
LIMIT 10)

SELECT 
top_demand_skills.*
 FROM top_demand_skills 
 
 
 */


-- Example 2
-- What are the most in-demand skills for Data Scientist jobs, broken down by company (and only for remote roles


 WITH top_demand_skills AS (
    SELECT
        c.name AS company_name,
        j.job_title_short,
        s.skills,
        COUNT(*) AS skill_count
    FROM job_postings_fact j
    INNER JOIN skills_job_dim sj 
        ON j.job_id = sj.job_id
    INNER JOIN company_dim c ON j.company_id = c.company_id
    INNER JOIN skills_dim s 
        ON sj.skill_id = s.skill_id
    WHERE j.job_title_short = 'Data Scientist' AND 
    job_work_from_home = TRUE
    GROUP BY j.job_title_short, s.skills, c.name
    ORDER BY skill_count DESC
    LIMIT 10
)
SELECT *
FROM top_demand_skills;
