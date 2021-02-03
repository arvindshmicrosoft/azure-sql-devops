CREATE TABLE [Integration].[Customer_Staging] (
    [Customer Staging Key] INT            IDENTITY (1, 1) NOT NULL,
    [WWI Customer ID]      INT            NOT NULL,
    [Customer]             NVARCHAR (100) NOT NULL,
    [Bill To Customer]     NVARCHAR (100) NOT NULL,
    [Category]             NVARCHAR (50)  NOT NULL,
    [Buying Group]         NVARCHAR (50)  NOT NULL,
    [Primary Contact]      NVARCHAR (50)  NOT NULL,
    [Postal Code]          NVARCHAR (10)  NOT NULL,
    [Valid From]           DATETIME2 (7)  NOT NULL,
    [Valid To]             DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_Integration_Customer_Staging] PRIMARY KEY NONCLUSTERED ([Customer Staging Key] ASC)
)
;

