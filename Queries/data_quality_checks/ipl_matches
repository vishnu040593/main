// Check for NULL or empty values in important columns in ipl_matches

SELECT
  COUNT(*) AS total_rows,
  COUNT(CASE WHEN id IS NULL THEN 1 END) AS null_id,
  COUNT(CASE WHEN season IS NULL THEN 1 END) AS null_season,
  COUNT(CASE WHEN date IS NULL THEN 1 END) AS null_date,
  COUNT(CASE WHEN team1 IS NULL OR team1 = '' THEN 1 END) AS null_team1,
  COUNT(CASE WHEN team2 IS NULL OR team2 = '' THEN 1 END) AS null_team2,
  COUNT(CASE WHEN winner IS NULL OR winner = '' THEN 1 END) AS null_winner
FROM ipl_matches;

// Check for invalid runs or wickets in ipl_matches

SELECT *
FROM ipl_matches
WHERE win_by_runs < 0 OR win_by_wickets < 0;
