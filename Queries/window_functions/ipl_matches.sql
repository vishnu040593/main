-- To get the match with the highest win_by_runs per season

SELECT 
    season,
    winner,
    ROW_NUMBER() OVER (PARTITION BY season ORDER BY win_by_runs DESC) AS row_num
FROM ipl_matches;

-- Rank matches by number of wickets won per season

SELECT 
    season,
    winner,
    win_by_wickets,
    RANK() OVER (PARTITION BY season ORDER BY win_by_wickets DESC) AS `rank`
FROM ipl_matches;

-- Rank teams per season by run margin, keeping sequential ranks even for ties.

SELECT 
    season,
    winner,
    DENSE_RANK() OVER (PARTITION BY season ORDER BY win_by_runs DESC) AS `dense_rank`
FROM ipl_matches;

-- This returns the top 3 biggest victories by run margin for each IPL season.

SELECT *
FROM (
    SELECT 
        season,
        winner,
        win_by_runs,
        RANK() OVER (PARTITION BY season ORDER BY win_by_runs DESC) AS `rank`
    FROM ipl_matches
) ranked
WHERE `rank` <= 3;

-- Players by how many times they've won the "Player of the Match" award in the IPL matches and applying rank, dense rank and row number functions on it

-- Applying rank function on the count of player of the match awards

SELECT *
FROM (
    SELECT 
        player_of_match,
        COUNT(*) AS awards,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS player_rank
    FROM ipl_matches
    GROUP BY player_of_match
) ranked
WHERE player_rank <= 10;

-- Applying dense rank function on the count of player of the match awards

SELECT *
FROM (
    SELECT 
        player_of_match,
        COUNT(*) AS awards,
        DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS player_rank
    FROM ipl_matches
    GROUP BY player_of_match
) ranked
WHERE player_rank <= 10;

-- Applying row number function on the count of player of the match awards

SELECT *
FROM (
    SELECT 
        player_of_match,
        COUNT(*) AS awards,
        ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_num
    FROM ipl_matches
    GROUP BY player_of_match
) ranked
WHERE row_num <= 10;
