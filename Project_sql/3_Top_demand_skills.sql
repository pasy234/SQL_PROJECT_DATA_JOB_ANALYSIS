
    -- Example 1 = "What are the most in-demand skills for my role?

SELECT 
job_title_short, 
s.skills, 
count(*) AS demand_skills
FROM job_postings_fact j
INNER JOIN skills_job_dim sj on j.job_id = sj.job_id
INNER JOIN skills_dim s on sj.skill_id = s.skill_id
WHERE job_title_short = 'Data Scientist'
GROUP BY s.skills, job_title_short
ORDER BY demand_skills DESC
LIMIT 25




 
