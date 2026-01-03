CREATE TABLE [dbo].[Sales](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [date] NOT NULL,
	[CustomerNumber] [numeric](10, 0) NOT NULL,
	[EmployeeNumber] [numeric](6, 0) NOT NULL,
	[PaymentDate] [date] NOT NULL,
	[ProductsTotalValue] [numeric](19, 6) NOT NULL,
	[VAT] [numeric](19, 6) NOT NULL,
	[FinalValue] [numeric](19, 6) NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]