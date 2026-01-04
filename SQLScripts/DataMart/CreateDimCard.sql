IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimCustomer')
BEGIN
    CREATE TABLE [dbo].[DimCustomer](
        [CustomerKey] [int] IDENTITY(1,1) NOT NULL,
        [CustomerBK] [numeric](10, 0) NOT NULL,
        [CustomerName] [nvarchar](55) NOT NULL,
        [City] [nvarchar](33) NULL,
        [Region] [nvarchar](43) NOT NULL,
        [CustomerType] [nvarchar](20) NOT NULL,
        [EffectiveDate] [datetime] NOT NULL,
        [ExpiredDate] [datetime] NULL,
        [IsCurrent] [bit] DEFAULT 1
        CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED ([CustomerKey] ASC)
    ) ON [PRIMARY]
    CREATE NONCLUSTERED INDEX [IX_DimCustomer_CustomerBK] ON [dbo].[DimCustomer]([CustomerBK] ASC)
END