CREATE TABLE [Integration].[Transaction_Staging] (
    [Transaction Staging Key]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [Date Key]                    DATE            NULL,
    [Customer Key]                INT             NULL,
    [Bill To Customer Key]        INT             NULL,
    [Supplier Key]                INT             NULL,
    [Transaction Type Key]        INT             NULL,
    [Payment Method Key]          INT             NULL,
    [WWI Customer Transaction ID] INT             NULL,
    [WWI Supplier Transaction ID] INT             NULL,
    [WWI Invoice ID]              INT             NULL,
    [WWI Purchase Order ID]       INT             NULL,
    [Supplier Invoice Number]     NVARCHAR (20)   NULL,
    [Total Excluding Tax]         DECIMAL (18, 2) NULL,
    [Tax Amount]                  DECIMAL (18, 2) NULL,
    [Total Including Tax]         DECIMAL (18, 2) NULL,
    [Outstanding Balance]         DECIMAL (18, 2) NULL,
    [Is Finalized]                BIT             NULL,
    [WWI Customer ID]             INT             NULL,
    [WWI Bill To Customer ID]     INT             NULL,
    [WWI Supplier ID]             INT             NULL,
    [WWI Transaction Type ID]     INT             NULL,
    [WWI Payment Method ID]       INT             NULL,
    [Last Modified When]          DATETIME2 (7)   NULL,
    CONSTRAINT [PK_Integration_Transaction_Staging] PRIMARY KEY NONCLUSTERED ([Transaction Staging Key] ASC)
)
;

