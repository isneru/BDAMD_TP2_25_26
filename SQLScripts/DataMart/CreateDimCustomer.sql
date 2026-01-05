IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimCustomer')
BEGIN
    CREATE TABLE [dbo].[DimCustomer](
        [CustomerKey] [int] IDENTITY(1,1) NOT NULL,
        [CustomerNumber] [numeric](10, 0) NOT NULL,
        [Name] [nvarchar](55) NOT NULL,
        [TaxpayerNumber] [nvarchar](20) NOT NULL,
        [Fax] [nvarchar](60) NOT NULL,
        [Phone] [nvarchar](60) NOT NULL,
        [Contact] [nvarchar](30) NOT NULL,
        [Address] [nvarchar](55) NOT NULL,
        [ZipCode] [nvarchar](10) NOT NULL,
        [City] [nvarchar](33) NULL,
        [Location] [nvarchar](43) NOT NULL,
        [CustomerType] [nvarchar](20) NOT NULL,
        [Email] [nvarchar](45) NOT NULL,
        [EffectiveDate] [datetime] NOT NULL,
        [ExpiredDate] [datetime] NULL,
        [IsCurrent] [bit] DEFAULT 1
        CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED ([CustomerKey] ASC)
    ) ON [PRIMARY]
    CREATE NONCLUSTERED INDEX [IX_DimCustomer_CustomerNumber] ON [dbo].[DimCustomer]([CustomerNumber] ASC)
END
