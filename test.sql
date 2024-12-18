-- Create the tables
CREATE TABLE inactive_bets (
    id INT PRIMARY KEY,
    user_id INT,
    game_id INT,
    value DECIMAL(10, 2),
    multiplier DECIMAL(10, 2),
    profit DECIMAL(10, 2),
    created_at DATETIME,
    status VARCHAR(50),
    active BOOLEAN
);

CREATE TABLE active_sportsbook_bet (
    id INT PRIMARY KEY,
    user_id INT,
    game_id INT,
    value DECIMAL(10, 2),
    multiplier DECIMAL(10, 2),
    profit DECIMAL(10, 2),
    created_at DATETIME,
    status VARCHAR(50),
    active BOOLEAN
);

CREATE TABLE inactive_sportsbook_bet (
    id INT PRIMARY KEY,
    user_id INT,
    game_id INT,
    value DECIMAL(10, 2),
    multiplier DECIMAL(10, 2),
    profit DECIMAL(10, 2),
    created_at DATETIME,
    status VARCHAR(50),
    active BOOLEAN
);

-- Insert Data Test
-- Insert data into inactive_bets
INSERT INTO inactive_bets (id, user_id, game_id, value, multiplier, profit, created_at, status, active)
VALUES 
(1, 101, 1, 100.00, 1.5, 50.00, '2024-12-13 10:00:00', 'settled', false),
(2, 102, 2, 200.00, 2.0, 100.00, '2024-12-17 11:00:00', 'settled', false),
(3, 103, 3, 150.00, 1.8, 75.00, '2024-12-12 12:00:00', 'cancelled', true),
(4, 104, 4, 50.00, 1.2, 10.00, '2024-12-16 09:00:00', 'settled', false),
(5, 105, 5, 250.00, 1.3, 70.00, '2024-12-17 13:30:00', 'settled', false),
(6, 106, 6, 500.00, 2.5, 125.00, '2024-12-17 14:00:00', 'confirmed', false);

-- Insert data into active_sportsbook_bet
INSERT INTO active_sportsbook_bet (id, user_id, game_id, value, multiplier, profit, created_at, status, active)
VALUES 
(7, 107, 7, 300.00, 1.5, 100.00, '2024-12-157 12:15:00', 'settled', false),
(8, 108, 8, 200.00, 2.0, 150.00, '2024-12-16 14:30:00', 'settled', false),
(9, 109, 9, 100.00, 1.1, 10.00, '2024-12-17 15:45:00', 'settled', false),
(10, 110, 10, 450.00, 1.8, 180.00, '2024-12-18 16:00:00', 'confirmed', true),
(11, 111, 11, 120.00, 1.7, 50.00, '2024-12-17 17:00:00', 'settled', false);

-- Insert data into inactive_sportsbook_bet
INSERT INTO inactive_sportsbook_bet (id, user_id, game_id, value, multiplier, profit, created_at, status, active)
VALUES 
(12, 112, 12, 90.00, 1.3, 30.00, '2024-12-17 10:30:00', 'settled', false),
(13, 113, 13, 70.00, 1.4, 28.00, '2024-12-14 11:45:00', 'settled', false),
(14, 114, 14, 350.00, 2.2, 140.00, '2024-12-13 13:00:00', 'cancelled', true),
(15, 115, 15, 500.00, 1.6, 200.00, '2024-12-12 14:20:00', 'settled', false),
(16, 116, 16, 150.00, 1.9, 90.00, '2024-12-17 15:30:00', 'confirmed', true);
