IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'FactSales')
BEGIN
    CREATE TABLE [dbo].[FactSales](
        [DateKey] [int] NOT NULL,
        [ProductKey] [int] NOT NULL,
        [CustomerKey] [int] NOT NULL,
        [EmployeeKey] [int] NOT NULL,
        [InvoiceID] [int] NOT NULL,
        [LineNumber] [int] NOT NULL,
        [Quantity] [bigint] NOT NULL,
        [UnitPrice] [numeric](19, 2) NOT NULL,
        [TotalAmount] [numeric](19, 2) NOT NULL,
    ) ON [PRIMARY]
END