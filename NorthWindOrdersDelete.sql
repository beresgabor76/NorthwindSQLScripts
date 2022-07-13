use NorthwindOrders;
go

create or alter proc DeleteOrder
@orderID int
as
	declare @orderExists int;
	set @orderExists=0;
	select @orderExists=count(*) from [Orders] where OrderID=@orderID;
	if @orderExists<=0 begin raiserror('Order does not exist.', 16, 1); return; end;
	delete from [Order Details] where OrderID=@orderID;
	delete from [Orders] where OrderID=@orderID;