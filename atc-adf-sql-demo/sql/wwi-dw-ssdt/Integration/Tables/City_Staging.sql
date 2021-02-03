CREATE TABLE [Integration].[City_Staging] (
    [City Staging Key]           INT               IDENTITY (1, 1) NOT NULL,
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
    CONSTRAINT [PK_Integration_City_Staging] PRIMARY KEY CLUSTERED ([City Staging Key] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Integration_City_Staging_WWI_City_ID]
    ON [Integration].[City_Staging]([WWI City ID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quickly locating by WWI City Key', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'City_Staging', @level2type = N'INDEX', @level2name = N'IX_Integration_City_Staging_WWI_City_ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'City staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'City_Staging';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Row ID within the staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'City_Staging', @level2type = N'COLUMN', @level2name = N'City Staging Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a city within the WWI database', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'City_Staging', @level2type = N'COLUMN', @level2name = N'WWI City ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Formal name of the city', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'City_Staging', @level2type = N'COLUMN', @level2name = N'City';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'State or province for this city', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'City_Staging', @level2type = N'COLUMN', @level2name = N'State Province';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Country name', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'City_Staging', @level2type = N'COLUMN', @level2name = N'Country';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Continent that this city is on', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'City_Staging', @level2type = N'COLUMN', @level2name = N'Continent';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Sales territory for this StateProvince', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'City_Staging', @level2type = N'COLUMN', @level2name = N'Sales Territory';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Name of the region', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'City_Staging', @level2type = N'COLUMN', @level2name = N'Region';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Name of the subregion', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'City_Staging', @level2type = N'COLUMN', @level2name = N'Subregion';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Geographic location of the city', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'City_Staging', @level2type = N'COLUMN', @level2name = N'Location';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Latest available population for the City', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'City_Staging', @level2type = N'COLUMN', @level2name = N'Latest Recorded Population';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid from this date and time', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'City_Staging', @level2type = N'COLUMN', @level2name = N'Valid From';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid until this date and time', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'City_Staging', @level2type = N'COLUMN', @level2name = N'Valid To';

