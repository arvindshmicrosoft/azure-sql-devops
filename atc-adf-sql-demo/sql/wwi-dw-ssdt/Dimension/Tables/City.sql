CREATE TABLE [Dimension].[City] (
    [City Key]                   INT               CONSTRAINT [DF_Dimension_City_City_Key] DEFAULT (NEXT VALUE FOR [Sequences].[CityKey]) NOT NULL,
    [WWI City ID]                INT               NOT NULL,
    [City]                       NVARCHAR (50)     NOT NULL,
    [State Province]             NVARCHAR (50)     NOT NULL,
    [Country]                    NVARCHAR (60)     NOT NULL,
    [Continent]                  NVARCHAR (30)     NOT NULL,
    [Sales Territory]            NVARCHAR (50)     NOT NULL,
    [Region]                     NVARCHAR (30)     NOT NULL,
    [Subregion]                  NVARCHAR (30)     NOT NULL,
    [Location]                   [sys].[geography] NULL,
    [Latest Recorded Population] BIGINT            NOT NULL,
    [Valid From]                 DATETIME2 (7)     NOT NULL,
    [Valid To]                   DATETIME2 (7)     NOT NULL,
    [Lineage Key]                INT               NOT NULL,
    CONSTRAINT [PK_Dimension_City] PRIMARY KEY CLUSTERED ([City Key] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Dimension_City_WWICityID]
    ON [Dimension].[City]([WWI City ID] ASC, [Valid From] ASC, [Valid To] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quickly locating by WWI ID', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City', @level2type = N'INDEX', @level2name = N'IX_Dimension_City_WWICityID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'City dimension', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'DW key for the city dimension', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City', @level2type = N'COLUMN', @level2name = N'City Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a city within the WWI database', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City', @level2type = N'COLUMN', @level2name = N'WWI City ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Formal name of the city', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City', @level2type = N'COLUMN', @level2name = N'City';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'State or province for this city', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City', @level2type = N'COLUMN', @level2name = N'State Province';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Country name', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City', @level2type = N'COLUMN', @level2name = N'Country';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Continent that this city is on', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City', @level2type = N'COLUMN', @level2name = N'Continent';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Sales territory for this StateProvince', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City', @level2type = N'COLUMN', @level2name = N'Sales Territory';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Name of the region', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City', @level2type = N'COLUMN', @level2name = N'Region';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Name of the subregion', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City', @level2type = N'COLUMN', @level2name = N'Subregion';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Geographic location of the city', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City', @level2type = N'COLUMN', @level2name = N'Location';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Latest available population for the City', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City', @level2type = N'COLUMN', @level2name = N'Latest Recorded Population';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid from this date and time', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City', @level2type = N'COLUMN', @level2name = N'Valid From';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid until this date and time', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City', @level2type = N'COLUMN', @level2name = N'Valid To';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Lineage Key for the data load for this row', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'City', @level2type = N'COLUMN', @level2name = N'Lineage Key';

