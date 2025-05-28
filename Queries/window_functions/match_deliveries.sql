-- To identify the top scorer in each match.

SELECT *
FROM (
    SELECT 
        match_id,
        batsman,
        SUM(batsman_runs) AS total_batsman_runs,
        ROW_NUMBER() OVER (PARTITION BY match_id ORDER BY SUM(batsman_runs) DESC) AS row_num
    FROM match_deliveries
    GROUP BY match_id, batsman
) ranked
WHERE row_num = 1;

-- To see top 10 highest run scorers overall, ranked.

SELECT *
FROM (
    SELECT 
        batsman,
        SUM(batsman_runs) AS total_runs,
        RANK() OVER (ORDER BY SUM(batsman_runs) DESC) AS batsman_rank
    FROM match_deliveries
    GROUP BY batsman
) ranked
WHERE batsman_rank <= 10;

-- To Rank bowlers by total wickets by applying dense rank function.

SELECT *
FROM (
    SELECT 
        bowler,
        COUNT(player_dismissed) AS wickets,
        DENSE_RANK() OVER (ORDER BY COUNT(player_dismissed) DESC) AS bowler_rank
    FROM match_deliveries
    WHERE player_dismissed IS NOT NULL
    GROUP BY bowler
) ranked
WHERE bowler_rank <= 10;

-- To find the most economical over bowled by each bowler in every match by applying row number function.

SELECT *
FROM (
    SELECT 
        match_id,
        bowler,
        `over`,
        SUM(total_runs) AS runs_conceded,
        ROW_NUMBER() OVER (PARTITION BY match_id, bowler ORDER BY SUM(total_runs)) AS best_over_rank
    FROM match_deliveries
    GROUP BY match_id, bowler, `over`
) ranked
WHERE best_over_rank = 1;

--  To Identify which player scored most runs in powerplay in each inning of every match by applying rank function.

SELECT *
FROM (
    SELECT 
        match_id,
        inning,
        batsman,
        SUM(batsman_runs) AS powerplay_runs,
        RANK() OVER (PARTITION BY match_id, inning ORDER BY SUM(batsman_runs) DESC) AS pp_rank
    FROM match_deliveries
    WHERE `over` BETWEEN 1 AND 6
    GROUP BY match_id, inning, batsman
) ranked
WHERE pp_rank = 1;
