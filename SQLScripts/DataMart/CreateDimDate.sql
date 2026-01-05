IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimDate')
BEGIN
    CREATE TABLE [dbo].[DimDate](
        [DateKey] [int] IDENTITY(1,1) NOT NULL,
        [FullDate] [datetime] NOT NULL,
        [Year] [int] NOT NULL,
        [Semester] [tinyint] NOT NULL,
        [Quarter] [tinyint] NOT NULL,
        [Month] [tinyint] NOT NULL,
        [MonthName] [varchar](10) NOT NULL,
        [Week] [tinyint] NOT NULL,
        [DayNumberOfYear] [int] NOT NULL,
        [DayNumberOfMonth] [tinyint] NOT NULL,
        [DayNumberOfWeek] [tinyint] NOT NULL,
        [DayOfWeek] [varchar](10) NOT NULL,
        [Weekend] [varchar](3) NOT NULL,
        CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED ([DateKey] ASC)
    ) ON [PRIMARY]
END
