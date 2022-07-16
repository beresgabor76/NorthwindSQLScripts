use NorthwindOrders;
go

create table Users(Id int identity primary key, Username varchar(255) not null, 
				   PasswordHash binary(128) not null, PasswordSalt binary(128) not null);