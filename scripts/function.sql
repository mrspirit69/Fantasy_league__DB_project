--Функция: get_player_age(player_id INT) → INT, Возвращает возраст игрока--
CREATE OR REPLACE FUNCTION fantasy_league.get_player_age(pid INT)
RETURNS INT AS $$
DECLARE
    bdate DATE;
BEGIN
    SELECT BirthDate INTO bdate
    FROM fantasy_league.Players
    WHERE PlayerID = pid;

    RETURN EXTRACT(YEAR FROM AGE(CURRENT_DATE, bdate))::INT;
END;
$$ LANGUAGE plpgsql;

--Функция: get_team_total_goals(team_id INT) → INT, Возвращает суммарные голы команды (и дома, и в гостях)--
CREATE OR REPLACE FUNCTION fantasy_league.get_team_total_goals(tid INT)
RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COALESCE(SUM(
        CASE 
            WHEN HomeTeamID = tid THEN HomeScore 
            WHEN AwayTeamID = tid THEN AwayScore 
        END
    ), 0) INTO total
    FROM fantasy_league.Matches
    WHERE HomeTeamID = tid OR AwayTeamID = tid;

    RETURN total;
END;
$$ LANGUAGE plpgsql;
