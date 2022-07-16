use NorthwindOrders;
go

create or alter proc UpdateOrderItem
@orderID int,
@productID int,
@quantity int,
@discount decimal
as
	declare @orderItemExists int;
	set @orderItemExists=0;
	select @orderItemExists=count(*) from [Order Details] where OrderID=@orderID and ProductID=@productID;
	if @orderItemExists<=0 begin raiserror('Item does not exist in the order.', 16, 1); return; end;
	
	update [Order Details] set Quantity=@quantity, Discount=@discount where OrderID=@orderID and ProductID=@productID;
