Select product_name AS Product, company_name AS Company from Suppliers
INNER JOIN Products
ON Products.supplier_id=Suppliers.supplier_id
ORDER BY product_name, company_name;