--query 1
SELECT ItemName, Price, [Availability]
FROM Menu
WHERE Category = 'Italian'
ORDER BY ItemName

--query 2
SELECT 
    M.ItemName, 
    M.Category, 
    SUM(O.TotalAmount) AS TotalSales
FROM [Order] O
JOIN Menu M ON O.ListOfItems LIKE '%' + M.ItemName + '%'
WHERE CAST(O.CreationDate AS DATE) = '2025-03-03'
GROUP BY M.ItemName, M.Category
Order by TotalSales DESC; 

-- query 3
SELECT 
    R.TableNumber, 
    P.FullName, 
    P.Email,  
    R.[Status]
FROM Reservation R
JOIN Person P ON R.CustomerID = P.ID
WHERE CAST(R.CreationDate AS DATE) = '2025-03-03'
ORDER BY R.TableNumber; 

--query 4
SELECT 
    P.FullName, 
    P.[Role], 
    P.ShiftTimings, 
    COUNT(DISTINCT CAST(O.CreationDate AS DATE)) AS DaysWorked
FROM Person P
JOIN [Order] O ON P.ID = O.CustomerID
WHERE CAST(O.CreationDate AS DATE) BETWEEN '2025-03-01' AND '2025-03-31'
GROUP BY P.FullName, P.Role, P.ShiftTimings
ORDER BY DaysWorked DESC; 