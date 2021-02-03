CREATE SCHEMA [Integration]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Objects needed for ETL integration', @level0type = N'SCHEMA', @level0name = N'Integration';

