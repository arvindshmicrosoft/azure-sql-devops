CREATE TABLE [Integration].[ETL Cutoff] (
    [Table Name]  [sysname]     NOT NULL,
    [Cutoff Time] DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_Integration_ETL_Cutoff] PRIMARY KEY CLUSTERED ([Table Name] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'ETL Cutoff Times', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'ETL Cutoff';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Table name', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'ETL Cutoff', @level2type = N'COLUMN', @level2name = N'Table Name';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Time up to which data has been loaded', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'ETL Cutoff', @level2type = N'COLUMN', @level2name = N'Cutoff Time';

