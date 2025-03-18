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

exec sp_columns RAWTinderData;

SELECT TOP(10) * FROM dbo.RAWTinderData ;
