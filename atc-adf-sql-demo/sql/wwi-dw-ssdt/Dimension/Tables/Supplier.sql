CREATE TABLE [Dimension].[Supplier] (
    [Supplier Key]       INT            CONSTRAINT [DF_Dimension_Supplier_Supplier_Key] DEFAULT (NEXT VALUE FOR [Sequences].[SupplierKey]) NOT NULL,
    [WWI Supplier ID]    INT            NOT NULL,
    [Supplier]           NVARCHAR (100) NOT NULL,
    [Category]           NVARCHAR (50)  NOT NULL,
    [Primary Contact]    NVARCHAR (50)  NOT NULL,
    [Supplier Reference] NVARCHAR (20)  NULL,
    [Payment Days]       INT            NOT NULL,
    [Postal Code]        NVARCHAR (10)  NOT NULL,
    [Valid From]         DATETIME2 (7)  NOT NULL,
    [Valid To]           DATETIME2 (7)  NOT NULL,
    [Lineage Key]        INT            NOT NULL,
    CONSTRAINT [PK_Dimension_Supplier] PRIMARY KEY CLUSTERED ([Supplier Key] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Dimension_Supplier_WWISupplierID]
    ON [Dimension].[Supplier]([WWI Supplier ID] ASC, [Valid From] ASC, [Valid To] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quickly locating by WWI ID', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Supplier', @level2type = N'INDEX', @level2name = N'IX_Dimension_Supplier_WWISupplierID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Supplier dimension', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Supplier';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'DW key for the supplier dimension', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Supplier', @level2type = N'COLUMN', @level2name = N'Supplier Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a supplier within the WWI database', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Supplier', @level2type = N'COLUMN', @level2name = N'WWI Supplier ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier''s full name (usually a trading name)', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Supplier', @level2type = N'COLUMN', @level2name = N'Supplier';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier''s category', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Supplier', @level2type = N'COLUMN', @level2name = N'Category';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Primary contact', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Supplier', @level2type = N'COLUMN', @level2name = N'Primary Contact';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier reference for our organization (might be our account number at the supplier)', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Supplier', @level2type = N'COLUMN', @level2name = N'Supplier Reference';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Number of days for payment of an invoice (ie payment terms)', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Supplier', @level2type = N'COLUMN', @level2name = N'Payment Days';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Delivery postal code for the supplier', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Supplier', @level2type = N'COLUMN', @level2name = N'Postal Code';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid from this date and time', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Supplier', @level2type = N'COLUMN', @level2name = N'Valid From';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid until this date and time', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Supplier', @level2type = N'COLUMN', @level2name = N'Valid To';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Lineage Key for the data load for this row', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Supplier', @level2type = N'COLUMN', @level2name = N'Lineage Key';

