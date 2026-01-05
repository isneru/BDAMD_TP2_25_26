IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'Departments')
	CREATE TABLE [dbo].[Departments](
		[Code] [int],
		[Department] [varchar](50),
	)
ELSE
	TRUNCATE TABLE Departments
