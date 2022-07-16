use NorthwindOrders;
go

create or alter proc CreateUser
@username varchar(255),
@passwordHash binary(128),
@passwordSalt binary(128)
as
	declare @usernameExists int;
	set @usernameExists=0;
	select @usernameExists=count(*) from Users where Username=@username;
	if @usernameExists>0 begin raiserror('Username already exists.', 16, 1); return; end;

	insert into Users(Username, PasswordHash, PasswordSalt) values (@username, @passwordHash, @passwordSalt);
