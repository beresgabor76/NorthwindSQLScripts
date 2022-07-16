use NorthwindOrders;
go

create or alter proc SelectUser
@username varchar(255)
as
	select * from Users where Username=@username;