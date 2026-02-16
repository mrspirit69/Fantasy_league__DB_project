--Процедура: transfer_player(p_id INT, new_team_id INT), Меняет команду игрока и добавляет запись в историю--
CREATE OR REPLACE PROCEDURE fantasy_league.transfer_player(p_id INT, new_team_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    old_team INT;
BEGIN
    SELECT TeamID INTO old_team FROM fantasy_league.Players WHERE PlayerID = p_id;

    UPDATE fantasy_league.Players
    SET TeamID = new_team_id
    WHERE PlayerID = p_id;

    INSERT INTO fantasy_league.Player_History(PlayerID, TeamID, Start_contract, End_contract)
    VALUES (p_id, old_team, CURRENT_DATE - INTERVAL '1 year', CURRENT_DATE);
END;
$$;