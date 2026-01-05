IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimProduct')
BEGIN
    CREATE TABLE [dbo].[DimProduct](
        [ProductKey] [int] IDENTITY(1,1) NOT NULL,
        [ProductCode] [char](18) NOT NULL,
        [ProductDescription] [nvarchar](60) NOT NULL,
        [FamilyName] [nvarchar](60) NOT NULL,
        [Stock] [numeric](13, 3) NOT NULL,
        [UnitPrice] [numeric](19, 6) NOT NULL,
        [OrderPoint] [numeric](10, 3) NOT NULL,
        [MinimumStock] [numeric](13, 3) NOT NULL,
        [StartSellingDate] [date] NOT NULL,
        [Category] [nvarchar](25),
        [EffectiveDate] [datetime] NOT NULL,
        [ExpiredDate] [datetime] NULL,
        [IsCurrent] [bit] DEFAULT 1
        CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED ([ProductKey] ASC)
    ) ON [PRIMARY]
    CREATE NONCLUSTERED INDEX [IX_DimProduct_ProductCode] ON [dbo].[DimProduct]([ProductCode] ASC)
END
