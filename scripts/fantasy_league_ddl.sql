CREATE SCHEMA IF NOT EXISTS fantasy_league;

DROP TABLE IF EXISTS fantasy_league.Player_Stats;
DROP TABLE IF EXISTS fantasy_league.Player_History;
DROP TABLE IF EXISTS fantasy_league.Players;
DROP TABLE IF EXISTS fantasy_league.Matches;
DROP TABLE IF EXISTS fantasy_league.Managers;
DROP TABLE IF EXISTS fantasy_league.Teams;

CREATE TABLE fantasy_league.Teams (
    TeamID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Stadium VARCHAR(100) NOT NULL,
    Networth INT NOT NULL
);

CREATE TABLE fantasy_league.Managers (
    ManagerID INT PRIMARY KEY,
    First_name VARCHAR(100) NOT NULL,
    Last_name VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES fantasy_league.Teams(TeamID)
);

CREATE TABLE fantasy_league.Players (
    PlayerID INT PRIMARY KEY,
    First_name VARCHAR(100) NOT NULL,
    Last_name VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    Position VARCHAR(100) NOT NULL,
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES fantasy_league.Teams(TeamID)
);

CREATE TABLE fantasy_league.Player_History (
    HistoryID INT PRIMARY KEY,
    PlayerID INT,
    TeamID INT,
    Start_contract DATE NOT NULL,
    End_contract DATE NOT NULL,
    FOREIGN KEY (PlayerID) REFERENCES fantasy_league.Players(PlayerID),
    FOREIGN KEY (TeamID) REFERENCES fantasy_league.Teams(TeamID)
);

CREATE TABLE fantasy_league.Matches (
    MatchID INT PRIMARY KEY,
    HomeTeamID INT,
    AwayTeamID INT,
    HomeScore INT NOT NULL,
    AwayScore INT NOT NULL,
    match_date DATE NOT NULL,
    FOREIGN KEY (HomeTeamID) REFERENCES fantasy_league.Teams(TeamID),
    FOREIGN KEY (AwayTeamID) REFERENCES fantasy_league.Teams(TeamID)
);

CREATE TABLE fantasy_league.Player_Stats (
    StatsID INT PRIMARY KEY,
    PlayerID INT,
    MatchID INT,
    Goals INT NOT NULL,
    Assists INT NOT NULL,
    YellowCards INT NOT NULL,
    RedCards INT NOT NULL,
    FOREIGN KEY (PlayerID) REFERENCES fantasy_league.Players(PlayerID),
    FOREIGN KEY (MatchID) REFERENCES fantasy_league.Matches(MatchID)
);
