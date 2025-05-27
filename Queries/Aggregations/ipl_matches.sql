-- Toss Winner vs Match Winner Summary

SELECT
  toss_winner,
  winner as match_winner,
  COUNT(*) AS match_count
FROM ipl_matches
GROUP BY toss_winner, winner
ORDER BY match_count DESC;

-- Toss Decision Impact on Winning

SELECT
  toss_decision,
  COUNT(*) AS total_matches,
  SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) AS toss_and_match_win,
  ROUND(SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS win_percentage
FROM ipl_matches
GROUP BY toss_decision;

-- Total wins by each team

SELECT
  winner AS team,
  COUNT(*) AS wins
FROM ipl_matches
GROUP BY winner
ORDER BY wins DESC;

-- Number of matches played per season

SELECT
  season,
  COUNT(*) AS match_count
FROM ipl_matches
GROUP BY season
ORDER BY season;
