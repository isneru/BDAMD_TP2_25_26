IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimCustomer')
BEGIN
    CREATE TABLE [dbo].[DimCustomer](
        [CustomerKey] [int] IDENTITY(1,1) NOT NULL,
        [CustomerID] [numeric](10, 0) NOT NULL,
        [Name] [varchar](55) NOT NULL,
        [TaxpayerNumber] [varchar](20) NOT NULL,
        [Fax] [varchar](60) NULL,
        [Phone] [varchar](60) NOT NULL,
        [Contact] [varchar](30) NULL,
        [Address] [varchar](55) NULL,
        [ZipCode] [varchar](10) NULL,
        [City] [varchar](50) NULL,
        [Location] [varchar](50) NULL,
        [Type] [varchar](20) NOT NULL,
        [Email] [varchar](45) NOT NULL,
        [EffectiveDate] [datetime] NOT NULL,
        [ExpiredDate] [datetime] NULL,
        CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED ([CustomerKey] ASC)
    ) ON [PRIMARY]
    CREATE NONCLUSTERED INDEX [NonClusteredIndex-CustomerID] ON [dbo].[DimCustomer]([CustomerID] ASC)
END
