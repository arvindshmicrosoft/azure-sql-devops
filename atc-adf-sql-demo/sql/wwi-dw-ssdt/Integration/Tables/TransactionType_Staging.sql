CREATE TABLE [Integration].[TransactionType_Staging] (
    [Transaction Type Staging Key] INT           IDENTITY (1, 1) NOT NULL,
    [WWI Transaction Type ID]      INT           NOT NULL,
    [Transaction Type]             NVARCHAR (50) NOT NULL,
    [Valid From]                   DATETIME2 (7) NOT NULL,
    [Valid To]                     DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_Integration_Transaction_Type_Staging] PRIMARY KEY NONCLUSTERED ([Transaction Type Staging Key] ASC)
)
;

