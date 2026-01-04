IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimEmployee')
BEGIN
    CREATE TABLE [dbo].[DimEmployee](
        [EmployeeKey] [int] IDENTITY(1,1) NOT NULL,
        [EmployeeBK] [numeric](6, 0) NOT NULL,
        [FullName] [nvarchar](100) NOT NULL,
        [DepartmentName] [nvarchar](50) NOT NULL,
        [Email] [nvarchar](100) NULL,
        [EffectiveDate] [datetime] NOT NULL,
        [ExpiredDate] [datetime] NULL,
        [IsCurrent] [bit] DEFAULT 1
        CONSTRAINT [PK_DimEmployee] PRIMARY KEY CLUSTERED ([EmployeeKey] ASC)
    ) ON [PRIMARY]

    CREATE NONCLUSTERED INDEX [IX_DimEmployee_EmployeeBK] ON [dbo].[DimEmployee]([EmployeeBK] ASC)
END