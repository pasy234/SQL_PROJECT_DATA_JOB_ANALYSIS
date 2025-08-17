- # Introduction
Dive into the data market! Focusing on data scientist roles, this project focus on  in_demand skills, Top_paying jobs and where high demand meets high salary in data analytics. Check them out here: [Project_sql folder](/Project_sql/)
- # Backgroun
The purpose of these SQL queries is to analyze Data Analyst and Data Scientist job postings to uncover:
The highest paying roles for Data Analysts.
The skills required for those top-paying roles.
The most in-demand skills across postings.
top skills base on salary and optimal skill to learn.
This helps align career development with both market demand and compensation trends.

- # Tools I used
For my deep dive into data analyst job market, I hardness the power of several key tools

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to editor for making data querries.
- **Git & Github:** Essential for version control and sharing my SQL scripts and analysis also for easy collaboration.

- # The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market.
Her's how I approached each question:

### 1. Top paying Data Scientist Jobs
This query identifies the top 10 highest-paying Data Scientist jobs by selecting job title, company name, and average salary.
It filters for jobs titled Data Scientist with salary data available.
Results are sorted by salary_year_avg DESC, giving a clear ranking of compensation.
Insight: Provides a benchmark for salary expectations and highlights which companies pay the most for Data Scientist roles.

```sql
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
```

![Alt text](assets\download.png)


- # What I learn

- # Conclusions
