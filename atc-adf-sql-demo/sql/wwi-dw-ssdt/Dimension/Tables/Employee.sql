CREATE TABLE [Dimension].[Employee] (
    [Employee Key]    INT             CONSTRAINT [DF_Dimension_Employee_Employee_Key] DEFAULT (NEXT VALUE FOR [Sequences].[EmployeeKey]) NOT NULL,
    [WWI Employee ID] INT             NOT NULL,
    [Employee]        NVARCHAR (50)   NOT NULL,
    [Preferred Name]  NVARCHAR (50)   NOT NULL,
    [Is Salesperson]  BIT             NOT NULL,
    [Photo]           VARBINARY (MAX) NULL,
    [Valid From]      DATETIME2 (7)   NOT NULL,
    [Valid To]        DATETIME2 (7)   NOT NULL,
    [Lineage Key]     INT             NOT NULL,
    CONSTRAINT [PK_Dimension_Employee] PRIMARY KEY CLUSTERED ([Employee Key] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Dimension_Employee_WWIEmployeeID]
    ON [Dimension].[Employee]([WWI Employee ID] ASC, [Valid From] ASC, [Valid To] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quickly locating by WWI ID', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'INDEX', @level2name = N'IX_Dimension_Employee_WWIEmployeeID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Employee dimension', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Employee';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'DW key for the employee dimension', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'COLUMN', @level2name = N'Employee Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID (PersonID) in the WWI database', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'COLUMN', @level2name = N'WWI Employee ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full name for this person', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'COLUMN', @level2name = N'Employee';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Name that this person prefers to be called', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'COLUMN', @level2name = N'Preferred Name';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is this person a staff salesperson?', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'COLUMN', @level2name = N'Is Salesperson';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Photo of this person', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'COLUMN', @level2name = N'Photo';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid from this date and time', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'COLUMN', @level2name = N'Valid From';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid until this date and time', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'COLUMN', @level2name = N'Valid To';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Lineage Key for the data load for this row', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'COLUMN', @level2name = N'Lineage Key';

