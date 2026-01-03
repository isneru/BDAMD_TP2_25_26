CREATE TABLE [dbo].[Customers](
	[Name] [varchar](55) NOT NULL,
	[Number] [numeric](10, 0) NOT NULL,
	[TaxpayerNumber] [varchar](20) NOT NULL,
	[Fax] [varchar](60) NOT NULL,
	[Phone] [varchar](60) NOT NULL,
	[Contact] [varchar](30) NOT NULL,
	[Address] [varchar](55) NOT NULL,
	[ZipCode] [varchar](10) NOT NULL,
	[City] [varchar](33) NULL,
	[Location] [varchar](43) NOT NULL,
	[CustomerType] [int] NOT NULL,
	[Email] [varchar](45) NOT NULL,
 CONSTRAINT [PK_clientes_1] PRIMARY KEY CLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]