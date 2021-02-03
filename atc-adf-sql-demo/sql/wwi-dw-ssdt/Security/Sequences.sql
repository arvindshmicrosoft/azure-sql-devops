CREATE SCHEMA [Sequences]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Holds sequences used by all tables in the application', @level0type = N'SCHEMA', @level0name = N'Sequences';

