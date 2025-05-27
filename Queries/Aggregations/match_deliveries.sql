-- Total runs scored per match

SELECT
  match_id,
  SUM(total_runs) AS total_runs
FROM match_deliveries
GROUP BY match_id
ORDER BY match_id;
