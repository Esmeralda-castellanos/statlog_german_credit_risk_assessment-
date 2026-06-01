--- Analysis C: Default rate by credit history
SELECT
  credit_history,
  COUNT(*) AS total_applicants,
  COUNTIF(credit_risk = 2) AS bad_count,
  ROUND(COUNTIF(credit_risk = 2) / COUNT(*) * 100, 1) AS default_rate
FROM `credit-risk-assessment-497916.credit_risk_db.german_credit_raw`
GROUP BY credit_history
ORDER BY default_rate DESC;
