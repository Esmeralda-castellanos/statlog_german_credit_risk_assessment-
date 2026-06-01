# Credit Risk Assessment — German Credit Data

## Project Overview
This project analyses credit risk using the German Credit dataset (UCI Machine Learning Repository), containing 1,000 loan applicants and 20 features. The goal is to identify patterns in default behaviour and build a risk scoring model to classify borrowers as Low, Medium, or High Risk.

## Tools & Technologies
- **Google BigQuery** — data cleaning, exploration, and analysis queries
- **Microsoft Excel** — risk scoring model, visualisations, and dashboard

## Dataset
- **Source:** UCI Machine Learning Repository — Statlog (German Credit Data)
- **Size:** 1,000 rows, 20 features + 1 target variable (credit_risk: 1 = Good, 2 = Bad)
- **Link:** https://archive.ics.uci.edu/dataset/144/statlog+german+credit+data

## Project Structure
| File | Description |
|---|---|
| `german_credit_raw` | BigQuery table with cleaned dataset |
| `01_row_count_check.sql` | Row count and data preview |
| `02_null_check.sql` | Null value check across all 21 columns |
| `03_decode_risk_label.sql` | Decoding target variable (Good/Bad) |
| `04_default_by_purpose.sql` | Default rate by loan purpose |
| `05_default_by_age.sql` | Default rate by age group |
| `06_default_by_credit_history.sql` | Default rate by credit history |
| `07_avg_loan_by_risk_class.sql` | Average loan amount and duration by risk class |
| `credit_risk_analysis.xlsx` | Excel file with scoring model and dashboard |

## Key Findings
- Education loans have the highest default rate at 44%, despite having only 50 applicants
- Borrowers aged 18-25 represent 19% of total applicants but 27% of risky borrowers
- Applicants with no prior credits (62.5%) and fully repaid credits (57.1%) show the highest default rates — suggesting credit risk is multidimensional and cannot be assessed on payment history alone
- High risk borrowers take on average 32% more credit (€39,381 vs €29,855) and hold loans 30% longer (249 vs 192 months average duration)

## Risk Scoring Model
A weighted scorecard model was built in Excel using 5 factors:

| Factor | Weight |
|---|---|
| Credit History | 30% |
| Checking Account Status | 25% |
| Loan Duration | 20% |
| Savings Account | 15% |
| Age | 10% |

Each factor is scored 1–5 and combined into a composite score. Borrowers are classified as:
- **Low Risk** — score 4.0 and above
- **Medium Risk** — score 2.5 to 3.9
- **High Risk** — score below 2.5

## How to Use
1. Clone or download the repository
2. Upload `german_credit.csv` to BigQuery as `credit_risk_db.german_credit_raw`
3. Run SQL files in order (01 through 07)
4. Open `credit_risk_analysis.xlsx` to explore the scoring model and dashboard
