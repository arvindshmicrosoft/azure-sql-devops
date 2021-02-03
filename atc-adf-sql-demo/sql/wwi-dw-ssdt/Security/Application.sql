CREATE SCHEMA [Application]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Application configuration code', @level0type = N'SCHEMA', @level0name = N'Application';

