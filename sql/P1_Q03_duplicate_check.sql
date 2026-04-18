-- P1_Q03_duplicate_check


SELECT
  Time,
  Amount,
  Class,
  COUNT(*) AS duplicate_count
FROM `fraud-analytics-project1.fraud_analysis.credit_card_transactions`
GROUP BY Time, Amount, Class
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC
LIMIT 20;