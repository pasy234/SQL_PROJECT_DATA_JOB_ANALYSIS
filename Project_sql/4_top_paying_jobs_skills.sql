--1 What are the top paying jobs for my role?
--2 what are the skills required for those top paying jobs?
--3 What are the most demand skills for my role?
--4 What are the top skills base on salary for my role?



SELECT 
    s.skills,
    ROUND(AVG(j.salary_year_avg),0) AS avg_salary
FROM job_postings_fact j
INNER JOIN skills_job_dim sj ON j.job_id = sj.job_id
INNER JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE j.job_title_short = 'Data Analyst'
  AND j.salary_year_avg IS NOT NULL
GROUP BY s.skills
ORDER BY avg_salary DESC
LIMIT 25;


/*
This is my analysis of this data Overall trends

AI/ML + Data Engineering = consistently high salaries.

Blockchain (Solidity) = high potential, still niche but lucrative.

Cloud & DevOps Automation = strong upward trend.

Rare/Legacy Tech (SVN, Perl) = high salaries due to scarcity, but not future-proof.
*/