use NorthwindOrders;
go

create or alter proc SelectCurrentOrders
as
	select o.OrderID, o.CustomerID, c.CompanyName, o.OrderDate, o.RequiredDate, o.Freight, o.ShipCity, o.ShipCountry		
		from [Orders] o inner join [Customers] c on o.CustomerID=c.CustomerID
		where ABS(DATEDIFF(day, o.OrderDate, GETDATE())) <= 15
		order by o.OrderDate desc;
