CREATE TABLE [Integration].[Purchase_Staging] (
    [Purchase Staging Key]  BIGINT        IDENTITY (1, 1) NOT NULL,
    [Date Key]              DATE          NULL,
    [Supplier Key]          INT           NULL,
    [Stock Item Key]        INT           NULL,
    [WWI Purchase Order ID] INT           NULL,
    [Ordered Outers]        INT           NULL,
    [Ordered Quantity]      INT           NULL,
    [Received Outers]       INT           NULL,
    [Package]               NVARCHAR (50) NULL,
    [Is Order Finalized]    BIT           NULL,
    [WWI Supplier ID]       INT           NULL,
    [WWI Stock Item ID]     INT           NULL,
    [Last Modified When]    DATETIME2 (7) NULL,
    CONSTRAINT [PK_Integration_Purchase_Staging] PRIMARY KEY NONCLUSTERED ([Purchase Staging Key] ASC)
)
;

