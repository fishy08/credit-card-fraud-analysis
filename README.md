# credit-card-fraud-analysis
Credit card fraud pattern analysis using SQL, Python and Power BI — rule-based detection models achieving above UK Finance 2024 industry benchmark

## Project Overview
A fraud data analytics project analysing 284,806 credit card transactions to identify fraud patterns and build detection models. The analysis is framed around a real-world scenario: acting as a fraud data analyst at a UK digital bank investigating an increase in card transaction fraud.

**Tools:** Python | SQL (BigQuery) | Google Cloud Storage | Power BI  
**Dataset:** Credit Card Fraud Detection — Worldline/ULB (Kaggle)  
**Date:** 2026

---

## Business Context
- 284,806 transactions over two days — European cardholders, September 2013
- 492 confirmed fraud cases (0.17% fraud rate)
- Total fraud value: £60,127 across two days
- Annualised fraud loss estimate: £10.97 million against £4.59 billion total transaction value

---

## Project Structure
credit-card-fraud-analysis/
│
├── notebooks/
│   └── Credit_Card_Fraud_Analysis.ipynb
├── dashboard/
│   └── Credit_Card_Fraud_Pattern_Analysis.pdf
├── charts/
│   ├── class_distribution.png
│   ├── amount_distribution.png
│   ├── fraud_by_hour.png
│   ├── correlation_matrix.png
│   ├── v_feature_separation.png
│   ├── best_model_comparison.png
│   ├── all_models_f1_precision_recall.png
│   └── all_models_t3_t8.png
└── README.md

---

## Four Phase Approach

### Phase 1 — Data Ingestion & Quality Checks (SQL)
- Uploaded raw CSV to Google Cloud Storage (europe-west2, London)
- Ingested 284,806 transactions into BigQuery
- SQL quality checks: null validation, duplicate analysis, class distribution
- Key finding: Zero nulls across all 31 columns — data complete

### Phase 2 — Exploratory Fraud Pattern Analysis (Python)
- Class imbalance confirmed: 0.17% fraud rate
- Fraud concentrates in £0-£10 amount range (50.6% of all fraud)
- 2am fraud rate is 10x the daily average — overnight attack pattern
- Zero-amount transactions have 9x higher fraud rate than legitimate
- Key fraud behaviours identified: card testing, BIN attacks, threshold avoidance

### Phase 3 — Fraud Profiling & Detection Model Development (Python)
Built and compared three fraud detection scoring models:

| Model | Best Threshold | Fraud Caught | Flagged | Recall | Precision | F1 Score |
|---|---|---|---|---|---|---|
| Fixed Threshold | T8 | 371 | 548 | 75.4% | 67.7% | 0.713 |
| Tiered Variable | T7 | 329 | 424 | 66.9% | 77.6% | **0.718** |
| Tiered Proportional | T4 | 315 | 406 | 64.0% | 77.6% | 0.702 |

**All three models exceed the UK Finance 2024 industry benchmark of 67p in every £1 of attempted fraud prevented.**

**Recommended model:** Tiered Variable at Threshold 7 — best F1 score (0.718), highest precision (77.6%), 58% fewer alerts than Fixed Threshold model.

### Phase 4 — Stakeholder Dashboard (Power BI)
Three-page interactive dashboard:
- **Executive Summary** — KPI cards, class distribution, fraud by amount band, fraud by hour
- **Fraud Pattern Analysis** — average amount comparison, transaction distribution, fraud rate by hour
- **Model Performance** — model comparison table, precision vs recall, F1 score across thresholds

---

## Key Findings

| Finding | Detail |
|---|---|
| Card testing signal | £0-£1 transactions show 100% fraud rate in coordinated attack windows |
| Overnight risk | 2am fraud rate = 1.7% — 10x the dataset average of 0.17% |
| Threshold avoidance | Max fraud amount £2,125 vs £25,691 legitimate — fraudsters self-limit |
| Zero amount fraud | 5.49% of fraud transactions are zero-amount — card verification precursors |
| Undetectable fraud | 29 fraud cases (5.9%) score zero across all rules — statistically indistinguishable from legitimate |

---

## Detection Rules Developed

1. **Card Testing Velocity Rule** — Flag cards with 2+ transactions under £1 within 60 seconds
2. **Zero Amount Precursor Rule** — Flag zero-amount transactions preceding high-value transactions
3. **Overnight Risk Rule** — Apply risk multiplier to transactions between midnight and 5am
4. **V Feature Extreme Rule** — V9/V10/V17 values below threshold have 77-100% fraud rates

---

## Industry Benchmark Comparison
- UK Finance 2024: banks prevented 67p in every £1 of attempted unauthorised fraud
- This project's best model: **Tiered Variable T7 — 77.6% precision, F1 score 0.718**
- Annualised undetected fraud at recommended threshold: £2.25M against £4.59B total (0.049%)

---

## Dataset
- **Source:** [Credit Card Fraud Detection — Kaggle](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud)
- **Credit:** Worldline and ULB Machine Learning Group
- **Note:** V1-V28 features are PCA-transformed for confidentiality. Transaction type (CNP vs card-present) is not specified — fraud patterns observed are consistent with Card Not Present unauthorised fraud based on operational domain knowledge

---

## Author
**Peter Francis Muthukkalai**  
Fraud Specialist | Aspiring Fraud Data Analyst  
[GitHub](https://github.com/fishy08)
