CREATE SCHEMA [Website]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Views and stored procedures that provide the only access for the application website', @level0type = N'SCHEMA', @level0name = N'Website';

