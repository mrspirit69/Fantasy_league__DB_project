--Индекс на Player_Stats(PlayerID) — ускоряет JOIN--
CREATE INDEX idx_player_stats_player_id
ON fantasy_league.Player_Stats (PlayerID);

--Составной индекс на Matches(HomeTeamID, AwayTeamID) — ускоряет JOIN и фильтрацию по команде--
CREATE INDEX idx_matches_teams
ON fantasy_league.Matches (HomeTeamID, AwayTeamID);