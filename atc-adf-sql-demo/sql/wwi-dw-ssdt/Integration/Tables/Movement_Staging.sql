CREATE TABLE [Integration].[Movement_Staging] (
    [Movement Staging Key]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [Date Key]                      DATE          NULL,
    [Stock Item Key]                INT           NULL,
    [Customer Key]                  INT           NULL,
    [Supplier Key]                  INT           NULL,
    [Transaction Type Key]          INT           NULL,
    [WWI Stock Item Transaction ID] INT           NULL,
    [WWI Invoice ID]                INT           NULL,
    [WWI Purchase Order ID]         INT           NULL,
    [Quantity]                      INT           NULL,
    [WWI Stock Item ID]             INT           NULL,
    [WWI Customer ID]               INT           NULL,
    [WWI Supplier ID]               INT           NULL,
    [WWI Transaction Type ID]       INT           NULL,
    [Last Modifed When]             DATETIME2 (7) NULL,
    CONSTRAINT [PK_Integration_Movement_Staging] PRIMARY KEY NONCLUSTERED ([Movement Staging Key] ASC)
)
;

