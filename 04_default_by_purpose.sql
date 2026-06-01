--- Analysis A: Default rate by loan purpose
SELECT
  purpose,
  COUNT(*) AS total_applicants,
  COUNTIF(credit_risk = 2) AS bad_count,
  ROUND(COUNTIF(credit_risk = 2) / COUNT(*) * 100, 1) AS default_rate
FROM `credit_risk_db.german_credit_raw`
GROUP BY purpose
ORDER BY default_rate DESC;
