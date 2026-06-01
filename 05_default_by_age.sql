--- Analysis B: Default rate by age group
SELECT
  CASE
    WHEN age_years BETWEEN 18 AND 25 THEN '18-25'
    WHEN age_years BETWEEN 26 AND 35 THEN '26-35'
    WHEN age_years BETWEEN 36 AND 50 THEN '36-50'
    ELSE '51+'
  END AS age_group,
  COUNT(*) AS total_applicants,
  COUNTIF(credit_risk = 2) AS bad_count,
  ROUND(COUNTIF(credit_risk = 2) / COUNT(*) * 100, 1) AS default_rate
FROM `credit_risk_db.german_credit_raw`
GROUP BY age_group
ORDER BY age_group;
