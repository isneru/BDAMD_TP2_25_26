CREATE TABLE [dbo].[Employees](
	[Number] [numeric](6, 0) NOT NULL,
	[Initials] [varchar](3) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Forename] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Group] [varchar](20) NOT NULL,
	[Department] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
 CONSTRAINT [pk_us] PRIMARY KEY NONCLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]