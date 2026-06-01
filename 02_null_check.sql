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
