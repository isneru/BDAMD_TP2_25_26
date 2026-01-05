IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimCustomer')
BEGIN
    CREATE TABLE [dbo].[DimCustomer](
        [CustomerKey] [int] IDENTITY(1,1) NOT NULL,
        [CustomerID] [numeric](10, 0) NOT NULL,
        [Name] [varchar](55) NOT NULL,
        [TaxpayerNumber] [varchar](20) NOT NULL,
        [Fax] [varchar](60) NOT NULL,
        [Phone] [varchar](60) NOT NULL,
        [Contact] [varchar](30) NOT NULL,
        [Address] [varchar](55) NOT NULL,
        [ZipCode] [varchar](10) NOT NULL,
        [City] [varchar](33) NULL,
        [Location] [varchar](43) NOT NULL,
        [Type] [varchar](20) NOT NULL,
        [Email] [varchar](45) NOT NULL,
        [EffectiveDate] [datetime] NOT NULL,
        [ExpiredDate] [datetime] NULL,
        CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED ([CustomerKey] ASC)
    ) ON [PRIMARY]
    CREATE NONCLUSTERED INDEX [IX_DimCustomer_CustomerID] ON [dbo].[DimCustomer]([CustomerID] ASC)
END
