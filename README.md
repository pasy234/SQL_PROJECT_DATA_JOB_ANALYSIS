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


### 2. What are the skills required for the top paying jobs?
This query dentifies top-paying "Data Analyst" jobs.
Filters job postings for the role "Data Analyst" with location = "Anywhere".
Keeps only postings with salary data.
Selects the top 10 highest-paying positions (LIMIT 10).

```sql
WITH top_paying_jobs AS (
SELECT 
    job_id,
    name AS company_name,
    job_title,
    salary_year_avg
FROM job_postings_fact
LEFT JOIN company_dim ON
 job_postings_fact.company_id = company_dim.company_id
WHERE job_title = 'Data Analyst' 
AND job_location = 'Anywhere'
AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
)

SELECT 
     top_paying_jobs.*, skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON 
top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON 
skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
```

![Alt text](assets\photo_2025-08-18_13-57-40.jpg)

### 3.  What are the most demand skills for my role?
This qurry identifies the core skillset employers expect from Data Scientists.
Focuses on a role → Filters job postings for Data Scientist (job_title_short = 'Data Scientist').

Joins with skills data → Uses skills_job_dim and skills_dim to find the skills associated with those jobs.
Counts skill demand → Groups by skill and counts how often each appears.
Ranks top 25 → Orders results by frequency (demand_skills) and limits to the top 25 most in-demand skills.

```sql
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
```

![Alt text](assets\photo_2025-08-18_14-27-23.jpg)


### 4.  What are the top skills base on salary for my role?

This query Focuses on the "Data Analyst" role:

Filters job postings where job_title_short = 'Data Analyst'.

Keeps only jobs with salary information.

Joins with skills data:

Uses skills_job_dim and skills_dim to connect jobs to the skills required.

Calculates salary averages by skill:

Groups by each skill.

Computes the average annual salary of jobs that require that skill.

Ranks skills by earning potential:

Orders results by highest average salary.

Shows the top 25 highest-paying skills for Data Analysts.

### 📊 Insights from this query

- AI/ML & Data Engineering skills (like TensorFlow, PyTorch, Spark, Hadoop) → consistently linked with higher salaries.

- Blockchain skills (e.g., Solidity) → niche but extremely lucrative where required.

- Cloud & DevOps skills (AWS, GCP, Kubernetes, Docker) → strong salary boosters, reflecting industry demand for scalable data infrastructure.

- Rare/legacy technologies (SVN, Perl, etc.) → surprisingly high average salaries, not because they’re future-proof, but because few people still know them, so scarcity drives up pay.

- Core analyst stack (SQL, Excel, Tableau, Power BI) → still valuable, but they don’t rank as high in salary uplift compared to more advanced/technical skills.

```sql

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
```
![Alt text](assets\photo_2025-08-18_14-40-15.jpg)


### 5. What are the most optimal skill to learn?
This query Identifies Most In-Demand Skills.
Step 1 – Demand (CTE: demand)

Looks at Data Scientist job postings.

Counts how many times each skill appears (demand_skills).

Shows which skills are most requested by employers.

Step 2 – Salary (CTE: salary)

Looks at Data Analyst job postings.

Calculates the average salary for jobs requiring each skill.

Shows which skills are the highest-paying.

Step 3 – Combine

Joins demand and salary by skill_id.

Produces a table of skills that shows both:

How in-demand the skill is

What average salary it commands

Orders results by highest demand, then salary.

Limits to top 25 skills.

# 📊 Insights from the query
1. Most In-Demand Skills

Python (114k postings) → the clear leader.

SQL (79k) → extremely high demand.

R (59k) → strong in data/statistics-heavy roles.

Tableau (29k) → top visualization tool.

AWS (26k) → leading cloud skill.

👉 These are foundational and appear across the majority of job postings.

```sql
WITH demand AS (
SELECT 
s.skill_id,
job_title_short, 
s.skills, 
count(*) AS demand_skills
FROM job_postings_fact j
INNER JOIN skills_job_dim sj on j.job_id = sj.job_id
INNER JOIN skills_dim s on sj.skill_id = s.skill_id
WHERE job_title_short = 'Data Scientist'
GROUP BY s.skills, job_title_short, s.skill_id
ORDER BY demand_skills DESC
),

 salary AS (
SELECT 
s.skill_id,
s.skills,
ROUND(avg(salary_year_avg),0) AS avg_salary
FROM job_postings_fact j
INNER JOIN skills_job_dim sj on j.job_id = sj.job_id
INNER JOIN skills_dim s on sj.skill_id = s.skill_id
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
GROUP BY s.skills,s.skill_id
ORDER BY avg_salary DESC
)


SELECT   
       d.skills,
       d.demand_skills,
       s.avg_salary
FROM demand d
INNER JOIN salary s ON d.skill_id = s.skill_id
ORDER BY d.demand_skills DESC, s.avg_salary DESC
LIMIT 25;

```

![Alt text](assets\photo_2025-08-18_14-54-19.jpg)



- # What I learn
What I Can Take Away

- Start with foundation: Python + SQL + Tableau/Excel.

- Boost with cloud & big data: AWS, Spark, Hadoop, GCP.

- Specialize for premium pay: TensorFlow, PyTorch, Scikit-learn (AI/ML).

- Balance is key: The optimal path is learning skills that are both high demand and high salary → Python, SQL, AWS, Spark, Scikit-learn.

- Strategy: Think in layers:

- Core skills → Get hired.

- Cloud/Big Data → Earn more.

- AI/ML specialization → Reach top salaries.

- # Conclusions

📌 Conclusions

Core skills are non-negotiable

Python + SQL are the backbone of Data roles → highest demand across postings and solid salaries.

Tableau/Excel remain essential for data communication, though they pay less compared to technical/cloud skills.

Cloud & Big Data drive higher salaries

Skills like AWS, GCP, Spark, Hadoop, Kubernetes show up consistently in top-paying jobs.

These are increasingly expected in senior analyst/scientist roles.

AI/ML frameworks are premium skills

PyTorch, TensorFlow, Scikit-learn offer the highest salary boost, though demand is smaller.

These are great differentiators if you want to move toward data science or ML engineering.

Balance matters (Optimal skills)

The best strategy is to build a mix:

High demand + steady salary → Python, SQL, Tableau.

Moderate demand + high salary → AWS, Spark, Hadoop.

Niche + very high salary → PyTorch, TensorFlow.

Legacy skills can still pay, but aren’t future-proof

Tools like SAS, Perl, SVN pay surprisingly well due to scarcity.

However, they are declining, so not a good long-term investment.

🎯 Final Takeaway

Step 1: Master Python + SQL (foundation).

Step 2: Add a visualization tool (Tableau/Power BI) to communicate insights.

Step 3: Learn Cloud + Big Data (AWS, Spark, Hadoop) to access higher salary tiers.

Step 4: Specialize in AI/ML frameworks (TensorFlow, PyTorch) if you want to move into cutting-edge, top-paying roles.

👉 The queries together form a career roadmap: start broad with high-demand fundamentals, then layer on high-paying specializations.
