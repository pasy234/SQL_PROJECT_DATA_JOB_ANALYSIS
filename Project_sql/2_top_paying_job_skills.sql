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

/*Top Skills by Frequency

Python – 14.6% of postings

SQL – 12.5%

R – 10.4%

Tableau, Looker, Excel – 6.25% each

-- Others like SAS, AWS, Power BI, Pandas – ~4.17% each



[
  {
    "job_id": 1246069,
    "company_name": "Plexus Resource Solutions",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_id": 1246069,
    "company_name": "Plexus Resource Solutions",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "mysql"
  },
  {
    "job_id": 1246069,
    "company_name": "Plexus Resource Solutions",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "aws"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "sql"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "r"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "sas"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "matlab"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "pandas"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "tableau"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "looker"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "sas"
  },
  {
    "job_id": 456042,
    "company_name": "Get It Recruit - Healthcare",
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "skills": "sql"
  },
  {
    "job_id": 456042,
    "company_name": "Get It Recruit - Healthcare",
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "skills": "python"
  },
  {
    "job_id": 456042,
    "company_name": "Get It Recruit - Healthcare",
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "skills": "r"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "python"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "java"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "r"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "javascript"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "c++"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "tableau"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "power bi"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "qlik"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "sql"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "python"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "r"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "golang"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "elasticsearch"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "aws"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "gcp"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "pandas"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "looker"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 1090975,
    "company_name": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "sql"
  },
  {
    "job_id": 1090975,
    "company_name": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "python"
  },
  {
    "job_id": 1090975,
    "company_name": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "r"
  },
  {
    "job_id": 1090975,
    "company_name": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "swift"
  },
  {
    "job_id": 1090975,
    "company_name": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "excel"
  },
  {
    "job_id": 1090975,
    "company_name": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1090975,
    "company_name": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "looker"
  },
  {
    "job_id": 1482852,
    "company_name": "Overmind",
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "skills": "sql"
  },
  {
    "job_id": 1482852,
    "company_name": "Overmind",
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "skills": "python"
  },
  {
    "job_id": 479965,
    "company_name": "InvestM Technology LLC",
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "sql"
  },
  {
    "job_id": 479965,
    "company_name": "InvestM Technology LLC",
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "excel"
  },
  {
    "job_id": 479965,
    "company_name": "InvestM Technology LLC",
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1326467,
    "company_name": "EPIC Brokers",
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "excel"
  }
]

*/




