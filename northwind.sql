
SELECT Company from (Select Suppliers.company_name AS Company, COUNT(Suppliers.supplier_id) AS Products FROM Suppliers
INNER JOIN Products
ON Products.supplier_id=Suppliers.supplier_id
GROUP BY Suppliers.supplier_id
HAVING COUNT(Suppliers.supplier_id)=5
ORDER BY COUNT(Suppliers.supplier_id) DESC, Suppliers.company_name) AS Company;
