CREATE SCHEMA [Fact]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Dimensional model fact tables', @level0type = N'SCHEMA', @level0name = N'Fact';

