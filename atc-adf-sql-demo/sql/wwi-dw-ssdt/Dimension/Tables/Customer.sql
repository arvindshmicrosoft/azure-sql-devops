CREATE TABLE [Dimension].[Customer] (
    [Customer Key]     INT            CONSTRAINT [DF_Dimension_Customer_Customer_Key] DEFAULT (NEXT VALUE FOR [Sequences].[CustomerKey]) NOT NULL,
    [WWI Customer ID]  INT            NOT NULL,
    [Customer]         NVARCHAR (100) NOT NULL,
    [Bill To Customer] NVARCHAR (100) NOT NULL,
    [Category]         NVARCHAR (50)  NOT NULL,
    [Buying Group]     NVARCHAR (50)  NOT NULL,
    [Primary Contact]  NVARCHAR (50)  NOT NULL,
    [Postal Code]      NVARCHAR (10)  NOT NULL,
    [Valid From]       DATETIME2 (7)  NOT NULL,
    [Valid To]         DATETIME2 (7)  NOT NULL,
    [Lineage Key]      INT            NOT NULL,
    CONSTRAINT [PK_Dimension_Customer] PRIMARY KEY CLUSTERED ([Customer Key] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Dimension_Customer_WWICustomerID]
    ON [Dimension].[Customer]([WWI Customer ID] ASC, [Valid From] ASC, [Valid To] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quickly locating by WWI ID', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'INDEX', @level2name = N'IX_Dimension_Customer_WWICustomerID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Customer dimension', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Customer';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'DW key for the customer dimension', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'COLUMN', @level2name = N'Customer Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a customer within the WWI database', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'COLUMN', @level2name = N'WWI Customer ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer''s full name (usually a trading name)', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'COLUMN', @level2name = N'Customer';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Bill to customer''s full name', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'COLUMN', @level2name = N'Bill To Customer';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer''s category', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'COLUMN', @level2name = N'Category';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer''s buying group', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'COLUMN', @level2name = N'Buying Group';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Primary contact', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'COLUMN', @level2name = N'Primary Contact';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Delivery postal code for the customer', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'COLUMN', @level2name = N'Postal Code';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid from this date and time', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'COLUMN', @level2name = N'Valid From';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid until this date and time', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'COLUMN', @level2name = N'Valid To';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Lineage Key for the data load for this row', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'COLUMN', @level2name = N'Lineage Key';

