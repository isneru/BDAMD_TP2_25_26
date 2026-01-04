IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimProduct')
BEGIN
    CREATE TABLE [dbo].[DimProduct](
        [ProductKey] [int] IDENTITY(1,1) NOT NULL,
        [ProductBK] [char](18) NOT NULL,
        [ProductDescription] [nvarchar](60) NOT NULL,
        [FamilyName] [nvarchar](60) NOT NULL,
        [Category] [nvarchar](25) NOT NULL,
        [UnitPrice] [numeric](19, 6) NULL,
        [EffectiveDate] [datetime] NOT NULL,
        [ExpiredDate] [datetime] NULL,
        [IsCurrent] [bit] DEFAULT 1
        CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED ([ProductKey] ASC)
    ) ON [PRIMARY]
    CREATE NONCLUSTERED INDEX [IX_DimProduct_ProductBK] ON [dbo].[DimProduct]([ProductBK] ASC)
END