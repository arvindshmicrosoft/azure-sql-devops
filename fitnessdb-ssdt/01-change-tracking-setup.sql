create schema web
go

create sequence dbo.Ids
as int
start with 1;
go

create table dbo.TrainingSession
(
    [Id] int primary key not null default(next value for dbo.Ids),
    [RecordedOn] datetimeoffset NOT NULL,
    [Type] varchar(50) NOT NULL,
    [Steps] int NOT NULL,
    [Distance] int NOT NULL, --Meters
    [Duration] int NOT NULL, --Seconds
    [Calories] int NOT NULL,
    [PostProcessedOn] datetimeoffset null,
    [AdjustedSteps] int null,
    [AdjustedDistance] decimal(9,6) null
);
go

alter table dbo.TrainingSession
enable change_tracking
go
