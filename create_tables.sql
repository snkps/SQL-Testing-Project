USE SportsDB;
GO


IF OBJECT_ID('Sportsman', 'U') IS NOT NULL DROP TABLE Sportsman;
GO

CREATE TABLE Sportsman (
    SportID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Unit NVARCHAR(50) NOT NULL,
    WorldRecord NVARCHAR(100),
    RecordDate DATE
);
CREATE UNIQUE INDEX idx_Sportsman_Name ON Sportsman(Name);


IF OBJECT_ID('Athlete', 'U') IS NOT NULL DROP TABLE Athlete;
GO

CREATE TABLE Athlete (
    AthleteID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    BirthYear INT,
    Rank NVARCHAR(50),
    Team NVARCHAR(100),
    Status NVARCHAR(50) DEFAULT 'Active',
    CoachName NVARCHAR(100) NULL
);
CREATE INDEX idx_Athlete_Team ON Athlete(Team);


IF OBJECT_ID('Result', 'U') IS NOT NULL DROP TABLE Result;
GO

CREATE TABLE Result (
    ResultID INT IDENTITY(1,1) PRIMARY KEY,
    CompetitionName NVARCHAR(100) NOT NULL,
    CompetitionDate DATE,
    Location NVARCHAR(100),
    SportID INT NOT NULL,
    AthleteID INT NOT NULL,
    Score DECIMAL(10,2),
    CONSTRAINT FK_Result_Sport FOREIGN KEY (SportID)
        REFERENCES Sportsman(SportID),
    CONSTRAINT FK_Result_Athlete FOREIGN KEY (AthleteID)
        REFERENCES Athlete(AthleteID),
    CONSTRAINT CHK_Score CHECK (Score >= 0 AND Score <= 1000)
);
CREATE INDEX idx_Result_SportID ON Result(SportID);
CREATE INDEX idx_Result_AthleteID ON Result(AthleteID);

ALTER TABLE Athlete ADD Email NVARCHAR(100) NULL;

ALTER TABLE Athlete
DROP COLUMN CoachName;