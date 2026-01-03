CREATE TABLE [dbo].[Products](
	[Code] [char](18) NOT NULL,
	[Description] [char](60) NOT NULL,
	[FamilyCode] [int] NOT NULL,
	[Stock] [numeric](13, 3) NOT NULL,
	[UnitPrice] [numeric](19, 6) NOT NULL,
	[OrderPoint] [numeric](10, 3) NOT NULL,
	[MinimunStock] [numeric](13, 3) NOT NULL,
	[StartSellingDate] [date] NOT NULL,
	[Category] [varchar](25) NOT NULL,
 CONSTRAINT [pk_st] PRIMARY KEY NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]