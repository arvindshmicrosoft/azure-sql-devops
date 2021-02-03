CREATE TABLE [Integration].[Employee_Staging] (
    [Employee Staging Key] INT             IDENTITY (1, 1) NOT NULL,
    [WWI Employee ID]      INT             NOT NULL,
    [Employee]             NVARCHAR (50)   NOT NULL,
    [Preferred Name]       NVARCHAR (50)   NOT NULL,
    [Is Salesperson]       BIT             NOT NULL,
    [Photo]                VARBINARY (MAX) NULL,
    [Valid From]           DATETIME2 (7)   NOT NULL,
    [Valid To]             DATETIME2 (7)   NOT NULL,
    CONSTRAINT [PK_Integration_Employee_Staging] PRIMARY KEY NONCLUSTERED ([Employee Staging Key] ASC)
)
;

