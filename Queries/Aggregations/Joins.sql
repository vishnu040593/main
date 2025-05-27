-- Join matches and deliveries for detailed info

SELECT
  m.id AS match_id,
  m.date,
  m.team1,
  m.team2,
  d.inning,
  d.over,
  d.ball,
  d.batsman,
  d.bowler,
  d.total_runs,
  d.player_dismissed,
  d.dismissal_kind
FROM ipl_matches m
JOIN match_deliveries d ON m.id = d.match_id
WHERE m.id = 1
ORDER BY d.inning, d.over, d.ball;

-- Total runs per season

SELECT
  m.season,
  SUM(d.total_runs) AS total_runs
FROM match_deliveries d
JOIN ipl_matches m ON d.match_id = m.id
GROUP BY m.season
ORDER BY m.season;
