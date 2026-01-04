IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'FactSales')	
BEGIN
    CREATE TABLE [dbo].[FactSales](
        [SalesKey] [bigint] IDENTITY(1,1) NOT NULL,
        [DateKey] [int] NOT NULL,
        [ProductKey] [int] NOT NULL,
        [CustomerKey] [int] NOT NULL,
        [EmployeeKey] [int] NOT NULL,
        [InvoiceID] [int] NOT NULL,
        [LineNumber] [int] NOT NULL,
        [Quantity] [numeric](14, 4) NOT NULL,
        [UnitPrice] [numeric](19, 6) NOT NULL,
        [TotalAmount] [numeric](19, 6) NOT NULL,
        CONSTRAINT [PK_FactSales] PRIMARY KEY CLUSTERED ([SalesKey] ASC)
    ) ON [PRIMARY]
END