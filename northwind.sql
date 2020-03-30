SELECT Suppliers.company_name as Company, Products.product_name as Product,
		MAX(Products.unit_price) as Price FROM Suppliers
INNER JOIN Products
ON Suppliers.supplier_id=Products.supplier_id
GROUP BY Suppliers.company_name,Products.product_name
ORDER BY Price DESC;
