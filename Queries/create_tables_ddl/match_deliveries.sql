CREATE TABLE match_deliveries (
    match_id INT,
    inning INT,
    batting_team VARCHAR(100),
    bowling_team VARCHAR(100),
    `over` INT,
    ball INT,
    batsman VARCHAR(100),
    non_striker VARCHAR(100),
    bowler VARCHAR(100),
    is_super_over BOOLEAN,
    wide_runs INT,
    bye_runs INT,
    legbye_runs INT,
    noball_runs INT,
    penalty_runs INT,
    batsman_runs INT,
    extra_runs INT,
    total_runs INT,
    player_dismissed VARCHAR(100),
    dismissal_kind VARCHAR(50),
    fielder VARCHAR(100)
);


-- Since there’s no primary key or unique ID column in match_deliveries table, Adding a new auto-increment id column to uniquely identify each row

ALTER TABLE match_deliveries
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;
