-- Write a recursive query to generate an organizational chart that includes all
-- employees, their managers, and their "Level" in the hierarchy (where the CEO
-- is Level 1, direct reports to the CEO are Level 2, and so on).

-- Step 1: Define the CTE
WITH RECURSIVE EmployeeHierarchy AS (

    -- Step 2: The Anchor Member (Find the top of the hierarchy)
    SELECT 
        EmployeeID, 
        FirstName, 
        LastName, 
        ManagerID, 
	1 AS Level
    FROM Employees
    WHERE ManagerID IS NULL

    UNION  -- Step 3: Combine the anchor and recursive queries

    -- Step 4: The Recursive Member (Find direct reports of the people already found)
    SELECT 
        e.EmployeeID, 
        e.FirstName, 
        e.LastName, 
        e.ManagerID, 
        eh.Level + 1
    FROM Employees  e
    JOIN EmployeeHierarchy eh 
        ON e.ManagerID = eh.EmployeeID

)
-- Step 5: Execute the CTE
SELECT * FROM EmployeeHierarchy
ORDER BY Level, ManagerID;


-- Thanks to Google Gemini --- nice example
