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
        CONSTRAINT [FK_FactSaleDimDate] FOREIGN KEY([DateKey]) REFERENCES [dbo].[DimDate] ([DateKey]),
        CONSTRAINT [FK_FactSaleDimCustomer] FOREIGN KEY([CustomerKey]) REFERENCES [dbo].[DimCustomer] ([CustomerKey]),
        CONSTRAINT [FK_FactSaleDimProduct] FOREIGN KEY([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey]),
        CONSTRAINT [FK_FactSaleDimEmployee] FOREIGN KEY([EmployeeKey]) REFERENCES [dbo].[DimEmployee] ([EmployeeKey])
    ) ON [PRIMARY]
END