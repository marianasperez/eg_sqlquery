SELECT DISTINCT 
    id, user_id, game_id, value, multiplier, profit, created_at, status, active
FROM (
    -- Bets from the inactive_bets table
    SELECT 
        id, user_id, game_id, value, multiplier, profit, created_at, status, active,
        'inactive_bets' AS data_origin
    FROM inactive_bets
    WHERE DATE(created_at) = CURDATE() - INTERVAL 1 DAY

    UNION

    -- Bets from the active_sportsbook_bet table (settled bets only)
    SELECT 
        id, user_id, game_id, value, multiplier, profit, created_at, status, active,
        'active_sportsbook_bet' AS data_origin
    FROM active_sportsbook_bet
    WHERE DATE(created_at) = CURDATE() - INTERVAL 1 DAY
      AND status = 'settled'
      AND active = false

    UNION

    -- Bets from the inactive_sportsbook_bet table
    SELECT 
        id, user_id, game_id, value, multiplier, profit, created_at, status, active,
        'inactive_sportsbook_bet' AS data_origin
    FROM inactive_sportsbook_bet
    WHERE DATE(created_at) = CURDATE() - INTERVAL 1 DAY
) AS consolidated_bets;
