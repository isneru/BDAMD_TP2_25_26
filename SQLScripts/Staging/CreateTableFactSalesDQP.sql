IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'FactSalesDQP')
	CREATE TABLE [dbo].[FactSalesDQP](
		[SaleID] [int],
		[SaleDate] [date],
		[CustomerNumber] [numeric](10, 0),
		[EmployeeNumber] [numeric](6, 0),
		[PaymentDate] [date],
		[ProductsTotalValue] [numeric](19, 6),
		[VAT] [numeric](19, 6),
		[FinalValue] [numeric](19, 6),
		[DQP] [varchar](500)
	)
ELSE
	TRUNCATE TABLE FactSalesDQP