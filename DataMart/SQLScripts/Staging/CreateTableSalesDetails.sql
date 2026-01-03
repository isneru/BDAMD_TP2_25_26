CREATE TABLE [dbo].[SalesDetails](
	[SaleID] [int] NOT NULL,
	[SaleLineID] [int] NOT NULL,
	[ProductCode] [char](18) NOT NULL,
	[Quantity] [numeric](14, 4) NOT NULL,
	[VATRate] [numeric](4, 2) NOT NULL,
	[UnitPrice] [numeric](19, 6) NOT NULL,
	[LineValue] [numeric](19, 6) NOT NULL,
 CONSTRAINT [PK_SalesDetails] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC,
	[SaleLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]