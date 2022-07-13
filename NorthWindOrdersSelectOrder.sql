use NorthwindOrders;
go

create or alter proc SelectOrder
@orderID int
as
	declare @orderExist int;
	set @orderExist=0;
	select @orderExist=count(*) from Orders where OrderID=@orderID;
	if @orderExist=0 begin raiserror('Order does not exist', 16, 1); return; end;
	select o.OrderID, o.CustomerID, c.CompanyName, o.OrderDate, o.RequiredDate, o.Freight, o.ShipCity, o.ShipCountry
		from [Orders] o inner join [Customers] c on o.CustomerID=c.CustomerID 
		where o.OrderID=@orderID;