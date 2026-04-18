-- P1_Q05_amount_distribution


SELECT
  Class,
  COUNT(*) AS transaction_count,
  ROUND(MIN(Amount), 2) AS min_amount,
  ROUND(MAX(Amount), 2) AS max_amount,
  ROUND(AVG(Amount), 2) AS avg_amount,
  ROUND(SUM(Amount), 2) AS total_amount
FROM `fraud-analytics-project1.fraud_analysis.credit_card_transactions`
GROUP BY Class
ORDER BY Class;