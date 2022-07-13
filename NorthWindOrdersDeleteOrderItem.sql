use NorthwindOrders;
go

create or alter proc DeleteOrderItem
@orderID int,
@productID int
as
	declare @orderExists int, @productExists int;
	set @orderExists=0;
	set @productExists=0;
	select @orderExists=count(*) from Orders where OrderID=@orderID;
	if @orderExists<=0 begin raiserror('Order does not exist.', 16, 1); return; end;
	select @productExists=count(*) from [Order Details] where OrderID=@orderID and ProductID=@productID;
	if @productExists<=0 begin raiserror('Item does not exist in the given order.', 16, 1); return; end;
	
	delete from [Order Details] where OrderID=@orderID and ProductID=@productID;