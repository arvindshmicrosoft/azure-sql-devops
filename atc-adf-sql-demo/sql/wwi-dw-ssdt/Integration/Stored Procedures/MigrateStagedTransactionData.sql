
CREATE PROCEDURE Integration.MigrateStagedTransactionData
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRAN;

    DECLARE @LineageKey int = (SELECT TOP(1) [Lineage Key]
                               FROM Integration.Lineage
                               WHERE [Table Name] = N'Transaction'
                               AND [Data Load Completed] IS NULL
                               ORDER BY [Lineage Key] DESC);

    -- Find the dimension keys required

    UPDATE t
        SET t.[Customer Key] = COALESCE((SELECT TOP(1) c.[Customer Key]
                                         FROM Dimension.Customer AS c
                                         WHERE c.[WWI Customer ID] = t.[WWI Customer ID]
                                         AND t.[Last Modified When] > c.[Valid From]
                                         AND t.[Last Modified When] <= c.[Valid To]
									     ORDER BY c.[Valid From]), 0),
            t.[Bill To Customer Key] = COALESCE((SELECT TOP(1) c.[Customer Key]
                                                 FROM Dimension.Customer AS c
                                                 WHERE c.[WWI Customer ID] = t.[WWI Bill To Customer ID]
                                                 AND t.[Last Modified When] > c.[Valid From]
                                                 AND t.[Last Modified When] <= c.[Valid To]
									             ORDER BY c.[Valid From]), 0),
            t.[Supplier Key] = COALESCE((SELECT TOP(1) s.[Supplier Key]
                                         FROM Dimension.Supplier AS s
                                         WHERE s.[WWI Supplier ID] = t.[WWI Supplier ID]
                                         AND t.[Last Modified When] > s.[Valid From]
                                         AND t.[Last Modified When] <= s.[Valid To]
									     ORDER BY s.[Valid From]), 0),
            t.[Transaction Type Key] = COALESCE((SELECT TOP(1) tt.[Transaction Type Key]
                                                 FROM Dimension.[Transaction Type] AS tt
                                                 WHERE tt.[WWI Transaction Type ID] = t.[WWI Transaction Type ID]
                                                 AND t.[Last Modified When] > tt.[Valid From]
                                                 AND t.[Last Modified When] <= tt.[Valid To]
									             ORDER BY tt.[Valid From]), 0),
            t.[Payment Method Key] = COALESCE((SELECT TOP(1) pm.[Payment Method Key]
                                                 FROM Dimension.[Payment Method] AS pm
                                                 WHERE pm.[WWI Payment Method ID] = t.[WWI Payment Method ID]
                                                 AND t.[Last Modified When] > pm.[Valid From]
                                                 AND t.[Last Modified When] <= pm.[Valid To]
									             ORDER BY pm.[Valid From]), 0)
    FROM Integration.Transaction_Staging AS t;

    -- Insert all the transactions

    INSERT Fact.[Transaction]
        ([Date Key], [Customer Key], [Bill To Customer Key], [Supplier Key], [Transaction Type Key],
         [Payment Method Key], [WWI Customer Transaction ID], [WWI Supplier Transaction ID],
         [WWI Invoice ID], [WWI Purchase Order ID], [Supplier Invoice Number], [Total Excluding Tax],
         [Tax Amount], [Total Including Tax], [Outstanding Balance], [Is Finalized], [Lineage Key])
    SELECT [Date Key], [Customer Key], [Bill To Customer Key], [Supplier Key], [Transaction Type Key],
         [Payment Method Key], [WWI Customer Transaction ID], [WWI Supplier Transaction ID],
         [WWI Invoice ID], [WWI Purchase Order ID], [Supplier Invoice Number], [Total Excluding Tax],
         [Tax Amount], [Total Including Tax], [Outstanding Balance], [Is Finalized], @LineageKey
    FROM Integration.Transaction_Staging;

    UPDATE Integration.Lineage
        SET [Data Load Completed] = SYSDATETIME(),
            [Was Successful] = 1
    WHERE [Lineage Key] = @LineageKey;

    UPDATE Integration.[ETL Cutoff]
        SET [Cutoff Time] = (SELECT [Source System Cutoff Time]
                             FROM Integration.Lineage
                             WHERE [Lineage Key] = @LineageKey)
    FROM Integration.[ETL Cutoff]
    WHERE [Table Name] = N'Transaction';

    COMMIT;

    RETURN 0;
END;
