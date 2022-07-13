use NorthwindOrders;
go

create or alter proc CreateOrder
@customerID nchar(5),
@requiredDate datetime,
@freight money,
@shipCity nvarchar(15),
@shipCountry nvarchar(15)
as
	declare @customerExists int;
	set @customerExists=0;
	select @customerExists=count(*) from Customers where CustomerID=@customerID;
	if @customerExists<=0 begin raiserror('Customer does not exist.', 16, 1); return; end;

	insert into Orders(CustomerID, OrderDate, RequiredDate, Freight, ShipCity, ShipCountry)
		values (@customerID, GETDATE(), @requiredDate, @freight, @shipCity, @shipCountry);
