Create table dbo.RAWTinderData(
	ID VARCHAR(50) NOT NULL PRIMARY KEY,
	Sum_App_Opens INT,
	No_Of_Days INT,
	No_Of_Conversations INT,
	LongestConversation INT,
	LongestConversationInDays INT,
	AverageConversationLength FLOAT,
	AverageConversationLengthInDays FLOAT,
	MedianConversationLength INT,
	MedainConversationLengthInDays FLOAT,
	No_Of_One_Message_Conversations INT,
	PercentOfOneMessageConversations FLOAT,
	No_Of_GhostingsAfterInitialMessage INT,
	No_Of_Matches INT,
	No_Of_Messages_Sent INT,
	No_Of_Messages_Received INT,
	Swipe_Likes INT,
	Swipe_Passes INT,
	BirthDate DATE,
	AgeFilterMin INT,
	AgeFilterMax INT,
	CityName VARCHAR(50),
	Country VARCHAR(40),
	CreateDate DATE,
	Education TEXT,
	Gender CHAR,
	InterestedIn VARCHAR(10),
	Instagram VARCHAR(5),
	Spotify VARCHAR(5),
	JobTitle VARCHAR(40),
	UserAge INT
);

ALTER TABLE dbo.RAWTinderData ALTER COLUMN UserAge VARCHAR(50);

CREATE TABLE dbo.StageTinderData(
	ID VARCHAR(50) NOT NULL PRIMARY KEY,
	Sum_App_Opens INT,
	No_Of_Days INT,
	No_Of_Conversations INT,
	LongestConversation INT,
	LongestConversationInDays INT,
	AverageConversationLength FLOAT,
	AverageConversationLengthInDays FLOAT,
	MedianConversationLength INT,
	MedainConversationLengthInDays FLOAT,
	No_Of_One_Message_Conversations INT,
	PercentOfOneMessageConversations FLOAT,
	No_Of_GhostingsAfterInitialMessage INT,
	No_Of_Matches INT,
	No_Of_Messages_Sent INT,
	No_Of_Messages_Received INT,
	Swipe_Likes INT,
	Swipe_Passes INT,
	BirthDate DATE,
	CreateDate DATE,
	AgeFilterMin INT,
	AgeFilterMax INT,
	Gender CHAR,
	InterestedIn VARCHAR(10),
	Instagram VARCHAR(5),
	Spotify VARCHAR(5),
	JobTitle VARCHAR(40),
	UserAge INT
);


Select TOP(10)* FROM dbo.StageTinderData

ALTER TABLE dbo.StageTinderData ADD ApproxDuration AS DATEDIFF(MONTH,CreateDate,GETDATE())/12.0


Select No_Of_Days, CreateDate, DurationSinceCreation from dbo.StageTinderData Order By DurationSinceCreation DESC;


Select MAX(DATEADD(DAY,No_Of_Days, CreateDate)) as EstimatedDays from dbo.StageTinderData;


ALTER TABLE dbo.StageTinderData DROP COLUMN ApproxDuration;

-- ALTER TABLE dbo.StageTinderData 
-- ADD ApproxDuration as 
--	DATEDIFF(MONTH,CreateDate, 
--		(SELECT MAX(DATEADD(DAY,No_Of_Days, CreateDate)) FROM dbo.StageTinderData))/12.0;

DECLARE @AdjustedEndDate DATE;
SELECT @AdjustedEndDate = MAX(DATEADD(DAY,No_Of_Days,CreateDate))
FROM dbo.StageTinderData
ALTER TABLE dbo.StageTinderData ADD DurationSinceCreation FLOAT;
UPDATE dbo.StageTinderData SET DurationSinceCreation = DATEDIFF(MONTH,CreateDate, @AdjustedEndDate)/12.0;


SELECT 
    MAX(DATEADD(DAY, No_Of_days, CreateDate)) AS MaxAdjustedEndDate
FROM dbo.StageTinderData;

EXEC sp_rename 'dbo.StageTinderData.DurationSinceCreation', 'EstimatedDurationSinceCreation','COLUMN';
