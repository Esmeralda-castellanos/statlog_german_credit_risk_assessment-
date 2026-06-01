--- Analysis D: Average credit amount by risk class
SELECT
  CASE WHEN credit_risk = 1 THEN 'Good' ELSE 'Bad' END AS risk_label,
  ROUND(AVG(credit_amount), 1) AS avg_credit_amount,
  ROUND(AVG(duration_months), 1) AS avg_duration_month,
  COUNT(*) AS count
FROM `credit_risk_db.german_credit_raw`
GROUP BY risk_label;
