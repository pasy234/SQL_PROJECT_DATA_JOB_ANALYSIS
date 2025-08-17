--5  What are the most optimal skill to learn?
   --a -- optimal
               --High demand and High paying?


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


/*

HERE ARE MY QUERY INSIGHTS


1. Most In-Demand Skills

Python (114k postings) – by far the most requested.

SQL (79k) – very high demand, a staple skill.

R (59k) – still strong in demand, especially in statistics-heavy roles.

Tableau (29k) – top visualization tool.

AWS (26k) – leading cloud skill in demand.

🔑 Observation: Employers still prioritize foundational skills (Python, SQL, R, Tableau) over specialized ones.

2. Highest Paying Skills

PyTorch ($125k) – specialized deep learning.

TensorFlow ($120k) – AI/ML heavy demand.

Scala ($115k) – big data & backend systems.

Hadoop ($110k) – big data framework.

Pandas ($110k) – popular Python library.

🔑 Observation: Niche AI/Big Data tools are the best-paying, even if demand is lower compared to Python/SQL.

3. Skills with Both High Demand & High Pay (Optimal Learning)

To find optimal skills, we look for balance between demand and salary.

Python → High demand, good salary ($101k).

SQL → Extremely high demand, decent salary ($96k).

AWS / Azure / GCP → Cloud skills, solid demand, salaries $105k–113k.

Spark → High salary ($113k), good demand (24k).

Git → Moderately demanded, but surprisingly well-paid ($112k).

Scikit-learn & Pandas → In-demand libraries with >$100k salaries.

4. Lower Salary but Still Important

Excel ($86k) – still widely requested but pays less.

Power BI ($92k) – growing visualization tool, lower salary vs Tableau.

SAS ($93k) – legacy tool, steady but declining compared to Python/R.

5. Key Insights

AI/ML frameworks (PyTorch, TensorFlow) → highest salaries, niche demand.

Big Data/Cloud (Spark, Hadoop, AWS, Azure, GCP, Databricks) → strong combination of pay + demand.

Core Analyst Skills (Python, SQL, Tableau, Excel) → most requested, essential foundation.

Visualization → Tableau > Power BI in pay.

✅ Recommendation for a Data Analyst / Scientist Path

Start with Python + SQL + Tableau (high demand).

Add Cloud (AWS/Azure/GCP) and Big Data (Spark, Hadoop, Databricks) for better salary.

Specialize in AI/ML (PyTorch, TensorFlow, Scikit-learn) for highest pay.

*/