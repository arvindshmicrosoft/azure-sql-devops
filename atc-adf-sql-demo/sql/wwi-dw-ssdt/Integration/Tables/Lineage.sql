CREATE TABLE [Integration].[Lineage] (
    [Lineage Key]               INT           CONSTRAINT [DF_Integration_Lineage_Lineage_Key] DEFAULT (NEXT VALUE FOR [Sequences].[LineageKey]) NOT NULL,
    [Data Load Started]         DATETIME2 (7) NOT NULL,
    [Table Name]                [sysname]     NOT NULL,
    [Data Load Completed]       DATETIME2 (7) NULL,
    [Was Successful]            BIT           NOT NULL,
    [Source System Cutoff Time] DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_Integration_Lineage] PRIMARY KEY CLUSTERED ([Lineage Key] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Details of data load attempts', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Lineage';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'DW key for lineage data', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Lineage', @level2type = N'COLUMN', @level2name = N'Lineage Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Time when the data load attempt began', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Lineage', @level2type = N'COLUMN', @level2name = N'Data Load Started';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Name of the table for this data load event', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Lineage', @level2type = N'COLUMN', @level2name = N'Table Name';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Time when the data load attempt completed (successfully or not)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Lineage', @level2type = N'COLUMN', @level2name = N'Data Load Completed';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Was the attempt successful?', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Lineage', @level2type = N'COLUMN', @level2name = N'Was Successful';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Time that rows from the source system were loaded up until', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Lineage', @level2type = N'COLUMN', @level2name = N'Source System Cutoff Time';

