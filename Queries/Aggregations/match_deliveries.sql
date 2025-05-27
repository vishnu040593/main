-- Total runs scored per match

SELECT
  match_id,
  SUM(total_runs) AS total_runs
FROM match_deliveries
GROUP BY match_id
ORDER BY match_id;

-- Top batsman by runs per match

SELECT
  match_id,
  batsman,
  SUM(batsman_runs) AS runs_scored
FROM match_deliveries
GROUP BY match_id, batsman
ORDER BY match_id, runs_scored DESC;

-- Wickets taken by each bowler per match

SELECT
  match_id,
  bowler,
  COUNT(*) AS wickets
FROM match_deliveries
WHERE dismissal_kind IS NOT NULL
GROUP BY match_id, bowler
ORDER BY match_id, wickets DESC;
