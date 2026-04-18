-- P1_Q04_duplicate_fraud_check


SELECT
  Time,
  Amount,
  Class,
  COUNT(*) AS duplicate_count,
  SUM(Class) AS fraud_hits,
  ROUND(SUM(Class) * 100.0 / COUNT(*), 2) AS fraud_rate_pct
FROM `fraud-analytics-project1.fraud_analysis.credit_card_transactions`
GROUP BY Time, Amount, Class
HAVING COUNT(*) > 1 AND SUM(Class) >= 1
ORDER BY fraud_hits DESC
LIMIT 20;