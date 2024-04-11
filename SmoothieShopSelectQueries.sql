
-- THIS ALLOWS YOU TO SEE WHICH CUSTOMERS WERE ASSOCIATED WITH WHICH ORDERIDS
SELECT C.CustomerID,
	   CONCAT(C.CustomerFirstName,' ', C.CustomerLastName) AS CustomerName,
	   O.OrderID
FROM Customers AS C
INNER JOIN Orders AS O 
	ON C.CustomerID = O.CustomerID

-- THIS ALLOWS YOU TO SEARCH WHICH EMPLOYEES LIVE IN WHICH CITIES
SELECT EmployeeID,
	CONCAT( EmployeeFirstName, ' ' , EmployeeLastName) AS EmployeeName,
	City, State
FROM Employee
WHERE City = 'Aurora'

-- THIS ALLOWS YOU TO SEE WHAT THE HIGHEST SELLING SMOOTHIES ARE
SELECT COUNT(S.SmoothieID) AS SmoothieCount,
 S.SmoothieName, SA.OrderID
FROM Smoothie AS S
INNER JOIN Smoothie_AddIns AS SA
	ON S.SmoothieID = SA.SmoothieID
GROUP BY S.SmoothieName, SA.OrderID
ORDER BY SmoothieCount DESC;

-- THIS ALLOWS YOU TO SEE WHICH VENDORS PROVIDE WHICH INGREDIENTS
SELECT V.VendorName, I.VendorID, I.IngredientName
FROM Vendors AS V
INNER JOIN Ingredient AS I
	 ON V.VendorID = I.VendorID
WHERE I.IngredientName = 'strawberry'

