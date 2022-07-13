use NorthwindOrders;
go

create or alter proc AddToOrder
@orderID int,
@productID int,
@quantity int,
@discount real = 0
as
	declare @orderExists int, @productExists int, @itemExists int, @unitsInStock int;
	set @orderExists=0;
	set @productExists=0;
	set @itemExists=0;
	set @unitsInStock=0;
	select @productExists=count(*) from Products where ProductID=@productID;
	if @productExists<=0 begin raiserror('Product does not exist.', 16, 1); return; end;
	select @orderExists=count(*) from Orders where OrderID=@orderID;
	if @orderExists<=0 begin raiserror('Order does not exist.', 16, 1); return; end;
	select @itemExists=count(*) from [Order Details] where OrderID=@orderID and ProductID=@productID;
	if @quantity<=0 begin raiserror('Quantity must be greater than zero.', 16, 1); return; end;
	select @unitsInStock=UnitsInStock from Products where ProductID=@productID;	
	if @quantity > @unitsInStock begin raiserror('Not enough units in stock.', 16, 1); return; end;


	declare @unitPrice int;
	select @unitPrice=UnitPrice from Products where ProductID=@productID;
	if @itemExists=0 begin
		insert into [Order Details](OrderID, ProductID, UnitPrice, Quantity, Discount)
			values (@orderID, @productID, @unitPrice, @quantity, @discount);		
		end;
	else begin
		update [Order Details] set UnitPrice=@unitPrice, Quantity=Quantity+@quantity, Discount=@discount 
			where OrderID=@orderID and ProductID=@productID;		
		end;
	update Products set UnitsInStock=UnitsInStock-@quantity where ProductID=@productID;