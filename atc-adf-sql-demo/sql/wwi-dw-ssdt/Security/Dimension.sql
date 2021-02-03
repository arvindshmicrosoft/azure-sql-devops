CREATE SCHEMA [Dimension]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Dimensional model dimension tables', @level0type = N'SCHEMA', @level0name = N'Dimension';

