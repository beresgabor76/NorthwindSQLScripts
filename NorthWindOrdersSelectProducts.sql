use NorthwindOrders;
go

create or alter proc SelectAllProducts
as
	select * from Products;