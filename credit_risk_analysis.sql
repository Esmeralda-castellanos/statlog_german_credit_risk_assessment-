SELECT * FROM `credit-risk-assessment-497916.credit_risk_db.german_credit_raw` LIMIT 10;
SELECT COUNT(*) AS total_rows 
FROM `credit-risk-assessment-497916.credit_risk_db.german_credit_raw`;

--- checking for null values in all columns
SELECT
  COUNTIF(checking_account_status IS NULL) AS checking_account_status_nulls,
  COUNTIF(duration_months IS NULL) AS duration_months_nulls,
  COUNTIF(credit_history IS NULL) AS credit_history_nulls,
  COUNTIF(purpose IS NULL) AS credit_amount_nulls,
  COUNTIF(credit_amount IS NULL) AS credit_amount_nulls,
  COUNTIF(savings_account IS NULL) AS savings_account_nulls,
  COUNTIF(employment_since IS NULL) AS employment_since_nulls,
  COUNTIF(installment_rate_pct IS NULL) AS installment_rate_pct_nulls,
  COUNTIF(personal_status_sex IS NULL) AS personal_status_sex_nulls,
  COUNTIF(other_debtors IS NULL) AS other_debtors_nulls,
  COUNTIF(residence_since IS NULL) AS residence_since_nulls,
  COUNTIF(property IS NULL) AS residence_since_nulls,
  COUNTIF(age_years IS NULL) AS age_years_nulls,
  COUNTIF(other_installment_plans IS NULL) AS other_installment_plans_nulls,
  COUNTIF(housing IS NULL) AS housing_nulls,
  COUNTIF(existing_credits IS NULL) AS existing_credits_nulls,
  COUNTIF(job IS NULL) AS job_nulls,
  COUNTIF(liable_people IS NULL) AS liable_people_nulls,
  COUNTIF(telephone IS NULL) AS telephone_nulls,
  COUNTIF(foreign_worker IS NULL) AS foreign_worker_nulls,
  COUNTIF(credit_risk IS NULL) AS credit_risk_nulls
FROM `credit-risk-assessment-497916.credit_risk_db.german_credit_raw`;

--- Decoding the Good and Bad variables
SELECT
  credit_risk,
  CASE WHEN credit_risk = 1 THEN 'Good' ELSE 'Bad' END AS risk_label,
  COUNT(*) AS count
FROM `credit-risk-assessment-497916.credit_risk_db.german_credit_raw`
GROUP BY credit_risk, risk_label;

--- Analysis A: Default rate by loan purpose
SELECT
  purpose,
  COUNT(*) AS total_applicants,
  COUNTIF(credit_risk = 2) AS bad_count,
  ROUND(COUNTIF(credit_risk = 2) / COUNT(*) * 100, 1) AS default_rate
FROM `credit-risk-assessment-497916.credit_risk_db.german_credit_raw`
GROUP BY purpose
ORDER BY default_rate DESC;

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
FROM `credit-risk-assessment-497916.credit_risk_db.german_credit_raw`
GROUP BY age_group
ORDER BY age_group;

--- Analysis C: Default rate by credit history
SELECT
  credit_history,
  COUNT(*) AS total_applicants,
  COUNTIF(credit_risk = 2) AS bad_count,
  ROUND(COUNTIF(credit_risk = 2) / COUNT(*) * 100, 1) AS default_rate
FROM `credit-risk-assessment-497916.credit_risk_db.german_credit_raw`
GROUP BY credit_history
ORDER BY default_rate DESC;

--- Analysis D: Average credit amount by risk class
SELECT
  CASE WHEN credit_risk = 1 THEN 'Good' ELSE 'Bad' END AS risk_label,
  ROUND(AVG(credit_amount), 1) AS avg_credit_amount,
  ROUND(AVG(duration_months), 1) AS avg_duration_month,
  COUNT(*) AS count
FROM `credit-risk-assessment-497916.credit_risk_db.german_credit_raw`
GROUP BY risk_label;

