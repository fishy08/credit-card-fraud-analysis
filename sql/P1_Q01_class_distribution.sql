-- QUERY 1: Class Distribution

SELECT
  Class,
  COUNT(*) AS transaction_count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 4) AS percentage
FROM `fraud-analytics-project1.fraud_analysis.credit_card_transactions`
GROUP BY Class
ORDER BY Class;
