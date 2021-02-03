
CREATE PROCEDURE Integration.GetLastETLCutoffTime
@TableName sysname
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    SELECT [Cutoff Time] AS CutoffTime
    FROM Integration.[ETL Cutoff]
    WHERE [Table Name] = @TableName;

    IF @@ROWCOUNT = 0
    BEGIN
        PRINT N'Invalid ETL table name';
        THROW 51000, N'Invalid ETL table name', 1;
        RETURN -1;
    END;

    RETURN 0;
END;
