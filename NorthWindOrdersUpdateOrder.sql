use NorthwindOrders;
go

create or alter proc UpdateOrder
@orderID int,
@customerID nchar(5),
@requiredDate datetime,
@freight money,
@shipCity nvarchar(15),
@shipCountry nvarchar(15)
as
	declare @orderExist int, @customerExists int;
	set @orderExist=0;
	set @customerExists=0;
	select @orderExist=count(*) from Orders where OrderID=@orderID;
	if @orderExist<=0 begin raiserror('Order does not exist.', 16, 1); return; end;
	select @customerExists=count(*) from Customers where CustomerID=@customerID;
	if @customerExists<=0 begin raiserror('Customer does not exist.', 16, 1); return; end;
	
	update Orders set CustomerID=@customerID, RequiredDate=@requiredDate, Freight=@freight, 
					ShipCity=@shipCity, ShipCountry=@shipCountry where OrderID=@orderID;
		