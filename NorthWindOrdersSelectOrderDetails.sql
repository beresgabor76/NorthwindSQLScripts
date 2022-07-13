use NorthwindOrders;
go

create or alter proc SelectOrderItems
@orderID int
as
	select od.ProductID, p.ProductName, p.QuantityPerUnit, od.UnitPrice, od.Quantity
		from [Order Details] od inner join [Products] p on od.ProductID=p.ProductID 
		where od.OrderID=@orderID
		order by p.ProductID;