LOAD DATA LOCAL INFILE '/Users/vishnuvardhanreddy/Downloads/matches.csv'
INTO TABLE ipl_matches
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
@id,
@season,
@city,
@date,
@team1,
@team2,
@toss_winner,
@toss_decision,
@result,
@dl_applied,
@winner,
@win_by_runs,
@win_by_wickets,
@player_of_match,
@venue,
@umpire1,
@umpire2,
@umpire3
)
SET
  id = NULLIF(@id, ''),
  season = NULLIF(@season, ''),
  city = NULLIF(@city, ''),
  date = IF(@date = '', NULL, STR_TO_DATE(@date, '%m/%d/%Y')),
  team1 = NULLIF(@team1, ''),
  team2 = NULLIF(@team2, ''),
  toss_winner = NULLIF(@toss_winner, ''),
  toss_decision = NULLIF(@toss_decision, ''),
  result = NULLIF(@result, ''),
  dl_applied = NULLIF(@dl_applied, ''),
  winner = NULLIF(@winner, ''),
  win_by_runs = NULLIF(@win_by_runs, ''),
  win_by_wickets = NULLIF(@win_by_wickets, ''),
  player_of_match = NULLIF(@player_of_match, ''),
  venue = NULLIF(@venue, ''),
  umpire1 = NULLIF(@umpire1, ''),
  umpire2 = NULLIF(@umpire2, ''),
  umpire3 = NULLIF(@umpire3, '');
