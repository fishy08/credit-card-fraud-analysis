-- P1_Q02_null_check

SELECT
  COUNTIF(Time IS NULL) AS null_time,
  COUNTIF(V1 IS NULL) AS null_v1,
  COUNTIF(V2 IS NULL) AS null_v2,
  COUNTIF(Amount IS NULL) AS null_amount,
  COUNTIF(Class IS NULL) AS null_class,
  COUNT(*) AS total_rows
FROM `fraud-analytics-project1.fraud_analysis.credit_card_transactions`;