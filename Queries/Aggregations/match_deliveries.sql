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

-- Top 10 Highest individual scores in a single match

SELECT
  match_id,
  batsman,
  SUM(batsman_runs) AS runs
FROM match_deliveries
GROUP BY match_id, batsman
ORDER BY runs DESC
LIMIT 10;

-- Top 10 Batsmen with highest strike rate (min 100 balls)

SELECT
  batsman,
  SUM(batsman_runs) AS total_runs,
  COUNT(*) AS balls_faced,
  ROUND((SUM(batsman_runs) * 100.0) / COUNT(*), 2) AS strike_rate
FROM match_deliveries
WHERE wide_runs = 0  -- don't count wides as balls faced
GROUP BY batsman
HAVING COUNT(*) >= 100
ORDER BY strike_rate DESC
LIMIT 10;

-- Top 10 Bowlers with best economy rate (min 60 balls bowled)

SELECT
  bowler,
  COUNT(*) AS balls_bowled,
  SUM(total_runs) AS runs_conceded,
  ROUND((SUM(total_runs) * 6.0) / COUNT(*), 2) AS economy
FROM match_deliveries
WHERE wide_runs = 0 AND noball_runs = 0
GROUP BY bowler
HAVING balls_bowled >= 60
ORDER BY economy ASC
LIMIT 10;

-- Most 3+ wicket hauls per match

SELECT
  match_id,
  bowler,
  COUNT(*) AS wickets
FROM match_deliveries
WHERE dismissal_kind IS NOT NULL
GROUP BY match_id, bowler
HAVING COUNT(*) >= 3
ORDER BY COUNT(*) DESC;
