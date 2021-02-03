CREATE TABLE [Dimension].[Transaction Type] (
    [Transaction Type Key]    INT           CONSTRAINT [DF_Dimension_Transaction_Type_Transaction_Type_Key] DEFAULT (NEXT VALUE FOR [Sequences].[TransactionTypeKey]) NOT NULL,
    [WWI Transaction Type ID] INT           NOT NULL,
    [Transaction Type]        NVARCHAR (50) NOT NULL,
    [Valid From]              DATETIME2 (7) NOT NULL,
    [Valid To]                DATETIME2 (7) NOT NULL,
    [Lineage Key]             INT           NOT NULL,
    CONSTRAINT [PK_Dimension_Transaction_Type] PRIMARY KEY CLUSTERED ([Transaction Type Key] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Dimension_Transaction_Type_WWITransactionTypeID]
    ON [Dimension].[Transaction Type]([WWI Transaction Type ID] ASC, [Valid From] ASC, [Valid To] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quickly locating by WWI ID', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Transaction Type', @level2type = N'INDEX', @level2name = N'IX_Dimension_Transaction_Type_WWITransactionTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'TransactionType dimension', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Transaction Type';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'DW key for the transaction type dimension', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Transaction Type', @level2type = N'COLUMN', @level2name = N'Transaction Type Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a transaction type within the WWI database', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Transaction Type', @level2type = N'COLUMN', @level2name = N'WWI Transaction Type ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full name of the transaction type', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Transaction Type', @level2type = N'COLUMN', @level2name = N'Transaction Type';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid from this date and time', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Transaction Type', @level2type = N'COLUMN', @level2name = N'Valid From';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid until this date and time', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Transaction Type', @level2type = N'COLUMN', @level2name = N'Valid To';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Lineage Key for the data load for this row', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Transaction Type', @level2type = N'COLUMN', @level2name = N'Lineage Key';

