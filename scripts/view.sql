--общее число голов по игрокам--
CREATE VIEW fantasy_league.view_total_goals AS
SELECT 
    p.PlayerID,
    p.First_name,
    p.Last_name,
    SUM(s.Goals) AS total_goals
FROM fantasy_league.Player_Stats s
JOIN fantasy_league.Players p ON s.PlayerID = p.PlayerID
GROUP BY p.PlayerID, p.First_name, p.Last_name;

--общее число ассистов по игрокам--
CREATE VIEW fantasy_league.view_total_assists AS
SELECT 
    p.PlayerID,
    p.First_name,
    p.Last_name,
    SUM(s.Assists) AS total_assists
FROM fantasy_league.Player_Stats s
JOIN fantasy_league.Players p ON s.PlayerID = p.PlayerID
GROUP BY p.PlayerID, p.First_name, p.Last_name;