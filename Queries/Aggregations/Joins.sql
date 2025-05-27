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
