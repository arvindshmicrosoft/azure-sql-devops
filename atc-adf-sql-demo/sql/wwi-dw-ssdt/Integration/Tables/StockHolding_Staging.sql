CREATE TABLE [Integration].[StockHolding_Staging] (
    [Stock Holding Staging Key] BIGINT          IDENTITY (1, 1) NOT NULL,
    [Stock Item Key]            INT             NULL,
    [Quantity On Hand]          INT             NULL,
    [Bin Location]              NVARCHAR (20)   NULL,
    [Last Stocktake Quantity]   INT             NULL,
    [Last Cost Price]           DECIMAL (18, 2) NULL,
    [Reorder Level]             INT             NULL,
    [Target Stock Level]        INT             NULL,
    [WWI Stock Item ID]         INT             NULL,
    CONSTRAINT [PK_Integration_Stock_Holding_Staging] PRIMARY KEY NONCLUSTERED ([Stock Holding Staging Key] ASC)
)
;

