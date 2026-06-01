--- Decoding the Good and Bad variables
SELECT
  credit_risk,
  CASE WHEN credit_risk = 1 THEN 'Good' ELSE 'Bad' END AS risk_label,
  COUNT(*) AS count
FROM `credit-risk-assessment-497916.credit_risk_db.german_credit_raw`
GROUP BY credit_risk, risk_label;
