if user_id('ETLUser') is null 
begin
    create user ETLUser with password = '$(ETLUserPassword)';
    alter role db_owner add member ETLUser
end
go

if user_id('AppUser') is null 
begin
    create user AppUser with password = '$(AppUserPassword)';
end
go
