CREATE TABLE [Integration].[PaymentMethod_Staging] (
    [Payment Method Staging Key] INT           IDENTITY (1, 1) NOT NULL,
    [WWI Payment Method ID]      INT           NOT NULL,
    [Payment Method]             NVARCHAR (50) NOT NULL,
    [Valid From]                 DATETIME2 (7) NOT NULL,
    [Valid To]                   DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_Integration_Payment_Method_Staging] PRIMARY KEY NONCLUSTERED ([Payment Method Staging Key] ASC)
)
;

