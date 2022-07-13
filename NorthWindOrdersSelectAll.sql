use NorthwindOrders;
go

create or alter proc SelectAllOrders
as
	select o.OrderID, o.CustomerID, c.CompanyName, o.OrderDate, o.RequiredDate, o.Freight, o.ShipCity, o.ShipCountry		
		from [Orders] o inner join [Customers] c on o.CustomerID=c.CustomerID 
		order by o.OrderDate desc;
