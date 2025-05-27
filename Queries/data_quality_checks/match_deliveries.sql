-- Check for missing match_id in deliveries

SELECT COUNT(*) AS unmatched_deliveries
FROM match_deliveries d
LEFT JOIN ipl_matches m ON d.match_id = m.id
WHERE m.id IS NULL;
