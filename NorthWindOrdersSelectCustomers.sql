use NorthwindOrders;
go

create or alter proc SelectAllCustomers
as
	select * from Customers;