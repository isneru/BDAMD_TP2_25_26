IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimProduct')
BEGIN
    CREATE TABLE [dbo].[DimProduct](
        [ProductKey] [int] IDENTITY(1,1) NOT NULL,
        [ProductID] [char](18) NOT NULL,
        [Description] [varchar](60) NOT NULL,
        [FamilyName] [varchar](60) NOT NULL,
        [Stock] [numeric](13, 3) NOT NULL,
        [UnitPrice] [numeric](19, 6) NOT NULL,
        [OrderPoint] [numeric](10, 3) NOT NULL,
        [MinimumStock] [numeric](13, 3) NOT NULL,
        [StartSellingDate] [date] NOT NULL,
        [Category] [varchar](25),
        [EffectiveDate] [datetime] NOT NULL,
        [ExpiredDate] [datetime] NULL,
        CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED ([ProductKey] ASC)
    ) ON [PRIMARY]
    CREATE NONCLUSTERED INDEX [NonClusteredIndex-ProductID] ON [dbo].[DimProduct]([ProductID] ASC)
END
