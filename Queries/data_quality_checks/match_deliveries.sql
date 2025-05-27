-- Check for missing match_id in deliveries

SELECT COUNT(*) AS unmatched_deliveries
FROM match_deliveries d
LEFT JOIN ipl_matches m ON d.match_id = m.id
WHERE m.id IS NULL;

-- To check Exact Duplicate Deliveries (if any)

SELECT *
FROM match_deliveries
WHERE id NOT IN (
  SELECT MIN(id)
  FROM match_deliveries
  GROUP BY match_id, inning, `over`, ball, batsman, bowler
);
