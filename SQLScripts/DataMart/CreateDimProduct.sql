IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimProduct')
BEGIN
    CREATE TABLE [dbo].[DimProduct](
        [ProductKey] [int] IDENTITY(1,1) NOT NULL,
        [ProductID] [char](18) NOT NULL,
        [Description] [varchar](60) NOT NULL,
        [FamilyName] [varchar](60) NOT NULL,
        [Stock] [bigint] NOT NULL,
        [UnitPrice] [numeric](19, 2) NOT NULL,
        [OrderPoint] [bigint] NOT NULL,
        [StockLeftToOrder] [bigint] NOT NULL,
        [MinimumStock] [bigint] NOT NULL,
        [StartSellingDate] [date] NOT NULL,
        [Category] [varchar](25),
        [EffectiveDate] [datetime] NOT NULL,
        [ExpiredDate] [datetime] NULL,
        CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED ([ProductKey] ASC)
    ) ON [PRIMARY]
    CREATE NONCLUSTERED INDEX [NonClusteredIndex-ProductID] ON [dbo].[DimProduct]([ProductID] ASC)
END