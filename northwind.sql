Select product_name AS Product, company_name AS Company from Suppliers
INNER JOIN Products
ON Products.supplier_id=Suppliers.supplier_id
ORDER BY product_name, company_name;


Select Suppliers.company_name AS Company, COUNT(Suppliers.supplier_id) AS Products FROM Suppliers
INNER JOIN Products
ON Products.supplier_id=Suppliers.supplier_id
GROUP BY Suppliers.supplier_id
ORDER BY COUNT(Suppliers.supplier_id) DESC, Suppliers.company_name;



SELECT Company from (Select Suppliers.company_name AS Company, COUNT(Suppliers.supplier_id) AS Products FROM Suppliers
INNER JOIN Products
ON Products.supplier_id=Suppliers.supplier_id
GROUP BY Suppliers.supplier_id
HAVING COUNT(Suppliers.supplier_id)=5
ORDER BY COUNT(Suppliers.supplier_id) DESC, Suppliers.company_name) AS Company;



SELECT Customers.company_name as Company, string_agg(Order_IDs,',') as Order_IDs FROM Customers
INNER JOIN (SELECT Orders.customer_id as CID, CONCAT(Order_details.product_id) AS Order_IDs from Orders
	INNER JOIN Order_details
	ON Order_details.order_id=Orders.order_id
	ORDER BY Orders.customer_id) as F
ON Customers.customer_id=CID
GROUP BY Customers.company_name;



SELECT Suppliers.company_name as Company, Products.product_name as Product,
		MAX(Products.unit_price) as Price FROM Suppliers
INNER JOIN Products
ON Suppliers.supplier_id=Products.supplier_id
GROUP BY Suppliers.company_name,Products.product_name
ORDER BY Price DESC;