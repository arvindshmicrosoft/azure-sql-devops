CREATE TABLE [Dimension].[Payment Method] (
    [Payment Method Key]    INT           CONSTRAINT [DF_Dimension_Payment_Method_Payment_Method_Key] DEFAULT (NEXT VALUE FOR [Sequences].[PaymentMethodKey]) NOT NULL,
    [WWI Payment Method ID] INT           NOT NULL,
    [Payment Method]        NVARCHAR (50) NOT NULL,
    [Valid From]            DATETIME2 (7) NOT NULL,
    [Valid To]              DATETIME2 (7) NOT NULL,
    [Lineage Key]           INT           NOT NULL,
    CONSTRAINT [PK_Dimension_Payment_Method] PRIMARY KEY CLUSTERED ([Payment Method Key] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Dimension_Payment_Method_WWIPaymentMethodID]
    ON [Dimension].[Payment Method]([WWI Payment Method ID] ASC, [Valid From] ASC, [Valid To] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quickly locating by WWI ID', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Payment Method', @level2type = N'INDEX', @level2name = N'IX_Dimension_Payment_Method_WWIPaymentMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'PaymentMethod dimension', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Payment Method';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'DW key for the payment method dimension', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Payment Method', @level2type = N'COLUMN', @level2name = N'Payment Method Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID for the payment method in the WWI database', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Payment Method', @level2type = N'COLUMN', @level2name = N'WWI Payment Method ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Payment method name', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Payment Method', @level2type = N'COLUMN', @level2name = N'Payment Method';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid from this date and time', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Payment Method', @level2type = N'COLUMN', @level2name = N'Valid From';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid until this date and time', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Payment Method', @level2type = N'COLUMN', @level2name = N'Valid To';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Lineage Key for the data load for this row', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Payment Method', @level2type = N'COLUMN', @level2name = N'Lineage Key';

