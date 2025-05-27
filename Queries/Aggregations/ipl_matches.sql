-- Toss Winner vs Match Winner Summary

SELECT
  toss_winner,
  winner as match_winner,
  COUNT(*) AS match_count
FROM ipl_matches
GROUP BY toss_winner, winner
ORDER BY match_count DESC;
