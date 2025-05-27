LOAD DATA LOCAL INFILE '/Users/vishnuvardhanreddy/Downloads/deliveries.csv'
INTO TABLE match_deliveries
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES
(
@match_id,
@inning,
@batting_team,
@bowling_team,
@over,
@ball,
@batsman,
@non_striker,
@bowler,
@is_super_over,
@wide_runs,
@bye_runs,
@legbye_runs,
@noball_runs,
@penalty_runs,
@batsman_runs,
@extra_runs,
@total_runs,
@player_dismissed,
@dismissal_kind,
@fielder
)
SET
  match_id = NULLIF(@match_id, ''),
  inning = NULLIF(@inning, ''),
  batting_team = NULLIF(@batting_team, ''),
  bowling_team = NULLIF(@bowling_team, ''),
  over = NULLIF(@over, ''),
  ball = NULLIF(@ball, ''),
  batsman = NULLIF(@batsman, ''),
  non_striker = NULLIF(@non_striker, ''),
  bowler = NULLIF(@bowler, ''),
  is_super_over = NULLIF(@is_super_over, ''),
  wide_runs = NULLIF(@wide_runs, ''),
  bye_runs = NULLIF(@bye_runs, ''),
  legbye_runs = NULLIF(@legbye_runs, ''),
  noball_runs = NULLIF(@noball_runs, ''),
  penalty_runs = NULLIF(@penalty_runs, ''),
  batsman_runs = NULLIF(@batsman_runs, ''),
  extra_runs = NULLIF(@extra_runs, ''),
  total_runs = NULLIF(@total_runs, ''),
  player_dismissed = NULLIF(@player_dismissed, ''),
  dismissal_kind = NULLIF(@dismissal_kind, ''),
  fielder = NULLIF(@fielder, '');
