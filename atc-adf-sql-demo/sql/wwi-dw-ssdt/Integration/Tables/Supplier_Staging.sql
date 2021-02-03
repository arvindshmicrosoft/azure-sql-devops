CREATE TABLE [Integration].[Supplier_Staging] (
    [Supplier Staging Key] INT            IDENTITY (1, 1) NOT NULL,
    [WWI Supplier ID]      INT            NOT NULL,
    [Supplier]             NVARCHAR (100) NOT NULL,
    [Category]             NVARCHAR (50)  NOT NULL,
    [Primary Contact]      NVARCHAR (50)  NOT NULL,
    [Supplier Reference]   NVARCHAR (20)  NULL,
    [Payment Days]         INT            NOT NULL,
    [Postal Code]          NVARCHAR (10)  NOT NULL,
    [Valid From]           DATETIME2 (7)  NOT NULL,
    [Valid To]             DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_Integration_Supplier_Staging] PRIMARY KEY NONCLUSTERED ([Supplier Staging Key] ASC)
)
;

