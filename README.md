# IPL Data Analysis Project

This project analyzes the Indian Premier League (IPL) matches and ball-by-ball delivery datasets to uncover key player, team, and match insights using SQL.

---

## Dataset Overview

Two primary tables are used from the IPL dataset (sourced from Kaggle):

### `ipl_matches`
Contains match-level information.

| Column            | Description                          |
|-------------------|--------------------------------------|
| id                | Unique match ID                      |
| season            | IPL season year                      |
| city              | City where match was played          |
| date              | Match date                           |
| team1, team2      | Competing teams                      |
| toss_winner       | Team that won the toss               |
| toss_decision     | Bat or field decision                |
| result            | Match result type                    |
| dl_applied        | DLS method applied (0/1)             |
| winner            | Match winner                         |
| win_by_runs       | Win margin (runs)                    |
| win_by_wickets    | Win margin (wickets)                 |
| player_of_match   | MVP of the match                     |
| venue             | Stadium name                         |
| umpire1/2/3       | Umpires officiating the match        |

### `match_deliveries`
Contains ball-by-ball delivery information.

| Column             | Description                          |
|--------------------|--------------------------------------|
| match_id           | Match ID (foreign key to `ipl_matches.id`) |
| inning             | Innings number                       |
| batting_team       | Team batting                         |
| bowling_team       | Team bowling                         |
| over, ball         | Over and ball numbers                |
| batsman            | Batsman facing the ball              |
| bowler             | Bowler delivering the ball           |
| is_super_over      | Whether it's a super over (0/1)      |
| various *_runs     | Runs breakdown: wide, bye, no-ball...|
| total_runs         | Total runs for the delivery          |
| player_dismissed   | Dismissed player name                |
| dismissal_kind     | Type of dismissal                    |
| fielder            | Fielder involved                     |

---

## Data Quality Checks

I performed the following:

- Identify and handle missing or NULL values in key columns.
- Validate data types and constraints.

## Analysis and Insights

We use SQL queries to uncover valuable insights, categorized below:

Match-Level Insights
Total runs scored per match.
Toss winner vs match winner correlation.
Match summaries by season and venue.

Player-Level Insights
Top batsmen by total runs.
Players with highest strike rates (min 100 balls).
Top bowlers by wickets taken and economy rate.

Team-Level Insights
Team win percentages.
Team performance across seasons.
Toss decision impact on winning.

Season Trends
Total runs scored per season.
Number of matches played per season.

## Tools Used

My SQL WorkBench

