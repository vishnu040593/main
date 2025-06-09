-- Toss Winner vs Match Winner Summary

SELECT
  toss_winner,
  winner as match_winner,
  COUNT(*) AS match_count
FROM ipl_matches
GROUP BY toss_winner, winner
ORDER BY match_count DESC; -- What is the purpose of Ordering here?

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
ORDER BY wins DESC; -- Is it coorelated to the number of games played? 

-- Number of matches played per season

SELECT
  season,
  COUNT(*) AS match_count
FROM ipl_matches
GROUP BY season
ORDER BY season; -- By all teams together?  Is it changing based on the number of teams and time of the year?
