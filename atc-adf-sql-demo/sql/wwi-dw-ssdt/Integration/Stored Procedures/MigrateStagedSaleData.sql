
CREATE PROCEDURE Integration.MigrateStagedSaleData
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRAN;

    DECLARE @LineageKey int = (SELECT TOP(1) [Lineage Key]
                               FROM Integration.Lineage
                               WHERE [Table Name] = N'Sale'
                               AND [Data Load Completed] IS NULL
                               ORDER BY [Lineage Key] DESC);

    -- Find the dimension keys required

    UPDATE s
        SET s.[City Key] = COALESCE((SELECT TOP(1) c.[City Key]
                                     FROM Dimension.City AS c
                                     WHERE c.[WWI City ID] = s.[WWI City ID]
                                     AND s.[Last Modified When] > c.[Valid From]
                                     AND s.[Last Modified When] <= c.[Valid To]
									 ORDER BY c.[Valid From]), 0),
            s.[Customer Key] = COALESCE((SELECT TOP(1) c.[Customer Key]
                                           FROM Dimension.Customer AS c
                                           WHERE c.[WWI Customer ID] = s.[WWI Customer ID]
                                           AND s.[Last Modified When] > c.[Valid From]
                                           AND s.[Last Modified When] <= c.[Valid To]
									       ORDER BY c.[Valid From]), 0),
            s.[Bill To Customer Key] = COALESCE((SELECT TOP(1) c.[Customer Key]
                                                 FROM Dimension.Customer AS c
                                                 WHERE c.[WWI Customer ID] = s.[WWI Bill To Customer ID]
                                                 AND s.[Last Modified When] > c.[Valid From]
                                                 AND s.[Last Modified When] <= c.[Valid To]
									             ORDER BY c.[Valid From]), 0),
            s.[Stock Item Key] = COALESCE((SELECT TOP(1) si.[Stock Item Key]
                                           FROM Dimension.[Stock Item] AS si
                                           WHERE si.[WWI Stock Item ID] = s.[WWI Stock Item ID]
                                           AND s.[Last Modified When] > si.[Valid From]
                                           AND s.[Last Modified When] <= si.[Valid To]
									       ORDER BY si.[Valid From]), 0),
            s.[Salesperson Key] = COALESCE((SELECT TOP(1) e.[Employee Key]
                                            FROM Dimension.Employee AS e
                                            WHERE e.[WWI Employee ID] = s.[WWI Salesperson ID]
                                            AND s.[Last Modified When] > e.[Valid From]
                                            AND s.[Last Modified When] <= e.[Valid To]
									        ORDER BY e.[Valid From]), 0)
    FROM Integration.Sale_Staging AS s;

    -- Remove any existing entries for any of these invoices

    DELETE s
    FROM Fact.Sale AS s
    WHERE s.[WWI Invoice ID] IN (SELECT [WWI Invoice ID] FROM Integration.Sale_Staging);

    -- Insert all current details for these invoices

    INSERT Fact.Sale
        ([City Key], [Customer Key], [Bill To Customer Key], [Stock Item Key], [Invoice Date Key], [Delivery Date Key],
         [Salesperson Key], [WWI Invoice ID], [Description], Package, Quantity, [Unit Price], [Tax Rate],
         [Total Excluding Tax], [Tax Amount], Profit, [Total Including Tax], [Total Dry Items], [Total Chiller Items], [Lineage Key])
    SELECT [City Key], [Customer Key], [Bill To Customer Key], [Stock Item Key], [Invoice Date Key], [Delivery Date Key],
           [Salesperson Key], [WWI Invoice ID], [Description], Package, Quantity, [Unit Price], [Tax Rate],
           [Total Excluding Tax], [Tax Amount], Profit, [Total Including Tax], [Total Dry Items], [Total Chiller Items], @LineageKey
    FROM Integration.Sale_Staging;

    UPDATE Integration.Lineage
        SET [Data Load Completed] = SYSDATETIME(),
            [Was Successful] = 1
    WHERE [Lineage Key] = @LineageKey;

    UPDATE Integration.[ETL Cutoff]
        SET [Cutoff Time] = (SELECT [Source System Cutoff Time]
                             FROM Integration.Lineage
                             WHERE [Lineage Key] = @LineageKey)
    FROM Integration.[ETL Cutoff]
    WHERE [Table Name] = N'Sale';

    COMMIT;

    RETURN 0;
END;
