USE Superstore;


-- Task 1:
WITH segments_complete AS (
SELECT
	'Total' AS Segmentation,
	COUNT(DISTINCT Member_Account_Code) AS 'Total no. of clients',
	ROUND(SUM(Sales_Amt) * 0.00003858,0) AS 'Total Sales', -- convert VND to USD
	COUNT(DISTINCT Invoice) AS 'Total No. of Transactions',
	SUM(Sales_Qty) AS 'Total Items Sold',
	(
	SELECT
	COUNT(Invoice)
	FROM
	(
	SELECT 
		Invoice
	FROM
		[Test-Assesment]
	GROUP BY Invoice
	HAVING SUM(Sales_Qty) > 1
	) t0 ) AS trans_2_items,
	ROUND(SUM(Sales_Amt) * 0.00003858 / COUNT(DISTINCT Invoice),0) AS ATV, -- Average Transaction Value
	ROUND(SUM(Sales_Qty) / COUNT(DISTINCT Invoice),2) AS UPT -- Unit per transaction
FROM
	[Test-Assesment]
UNION
SELECT
	'Plantinum' AS Segmentation,
	COUNT(DISTINCT Member_Account_Code) AS 'Total no. of clients',
	ROUND(SUM(Sales_Amt)* 0.00003858,0) AS 'Total Sales',
	COUNT(DISTINCT Invoice) AS 'Total No.of Transactions',
	SUM(Sales_Qty) AS 'Total Items Sold',
	(
	SELECT
		COUNT(Invoice)
	FROM (
	SELECT
		Invoice
	FROM
		[Test-Assesment]
	WHERE Member_Account_Code IN (
		SELECT
			Member_Account_Code
		FROM
			[Test-Assesment]
		GROUP BY Member_Account_Code
		HAVING SUM(Sales_Amt)*0.00003858 > 50000
		)
	GROUP BY Invoice
	HAVING SUM(Sales_Qty) > 1
	) t1
	) AS trans_2_items,
	ROUND(SUM(Sales_Amt) * 0.00003858 / COUNT(DISTINCT Invoice),0) AS ATV, -- Average Transaction Value
	ROUND(SUM(Sales_Qty) / COUNT(DISTINCT Invoice),2) AS UPT -- Unit per transaction
FROM
	[Test-Assesment]
WHERE Member_Account_Code IN (
SELECT
	Member_Account_Code
FROM
	[Test-Assesment]
GROUP BY Member_Account_Code
HAVING SUM(Sales_Amt)*0.00003858 > 50000
)
UNION
SELECT
	'Gold' AS Segmentation,
	COUNT(DISTINCT Member_Account_Code) AS 'Total no. of clients',
	ROUND(SUM(Sales_Amt)* 0.00003858,0) AS 'Total Sales',
	COUNT(DISTINCT Invoice) AS 'Total No.of Transactions',
	SUM(Sales_Qty) AS 'Total Items Sold',
	(
	SELECT
		COUNT(Invoice)
	FROM (
	SELECT
		Invoice
	FROM
		[Test-Assesment]
	WHERE Member_Account_Code IN (
	SELECT
		Member_Account_Code
	FROM
		[Test-Assesment]
	GROUP BY Member_Account_Code
	HAVING SUM(Sales_Amt)*0.00003858 > 25000 AND SUM(Sales_Amt)*0.00003858 <= 50000	
	)
	GROUP BY Invoice
	HAVING SUM(Sales_Amt) > 1
	) AS t2
	) AS trans_2_items,
	ROUND(SUM(Sales_Amt) * 0.00003858 / COUNT(DISTINCT Invoice),0) AS ATV, -- Average Transaction Value
	ROUND(SUM(Sales_Qty) / COUNT(DISTINCT Invoice),2) AS UPT -- Unit per transaction
FROM
	[Test-Assesment]
WHERE Member_Account_Code IN (
SELECT
	Member_Account_Code
FROM
	[Test-Assesment]
GROUP BY Member_Account_Code
HAVING SUM(Sales_Amt)*0.00003858 > 25000 AND SUM(Sales_Amt)*0.00003858 <= 50000
)
UNION
SELECT
	'Silver' AS Segmentation,
	COUNT(DISTINCT Member_Account_Code) AS 'Total no. of clients',
	ROUND(SUM(Sales_Amt)* 0.00003858,0) AS 'Total Sales',
	COUNT(DISTINCT Invoice) AS 'Total No.of Transactions',
	SUM(Sales_Qty) AS 'Total Items Sold',
	(
	SELECT
		COUNT(Invoice)
	FROM (
	SELECT
		Invoice
	FROM
		[Test-Assesment]
	WHERE Member_Account_Code IN (
	SELECT
		Member_Account_Code
	FROM
		[Test-Assesment]
	GROUP BY Member_Account_Code
	HAVING SUM(Sales_Amt)*0.00003858 > 10000 AND SUM(Sales_Amt)*0.00003858 <= 25000	
	)
	GROUP BY Invoice
	HAVING SUM(Sales_Amt) > 1
	) AS t2
	) AS trans_2_items,
	ROUND(SUM(Sales_Amt) * 0.00003858 / COUNT(DISTINCT Invoice),0) AS ATV, -- Average Transaction Value
	ROUND(SUM(Sales_Qty) / COUNT(DISTINCT Invoice),2) AS UPT -- Unit per transaction
FROM
	[Test-Assesment]
WHERE Member_Account_Code IN (
SELECT
	Member_Account_Code
FROM
	[Test-Assesment]
GROUP BY Member_Account_Code
HAVING SUM(Sales_Amt)*0.00003858 > 10000 AND SUM(Sales_Amt)*0.00003858 <= 25000
)
UNION
SELECT
	'CT' AS Segmentation,
	COUNT(DISTINCT Member_Account_Code) AS 'Total no. of clients',
	ROUND(SUM(Sales_Amt)* 0.00003858,0) AS 'Total Sales',
	COUNT(DISTINCT Invoice) AS 'Total No.of Transactions',
	SUM(Sales_Qty) AS 'Total Items Sold',
	(
	SELECT
		COUNT(Invoice)
	FROM (
	SELECT
		Invoice
	FROM
		[Test-Assesment]
	WHERE Member_Account_Code IN (
	SELECT
		Member_Account_Code
	FROM
		[Test-Assesment]
	GROUP BY Member_Account_Code
	HAVING SUM(Sales_Amt)*0.00003858 > 3000 AND SUM(Sales_Amt)*0.00003858 <= 10000	
	)
	GROUP BY Invoice
	HAVING SUM(Sales_Amt) > 1
	) AS t2
	) AS trans_2_items,
	ROUND(SUM(Sales_Amt) * 0.00003858 / COUNT(DISTINCT Invoice),0) AS ATV, -- Average Transaction Value
	ROUND(SUM(Sales_Qty) / COUNT(DISTINCT Invoice),2) AS UPT -- Unit per transaction
FROM
	[Test-Assesment]
WHERE Member_Account_Code IN (
SELECT
	Member_Account_Code
FROM
	[Test-Assesment]
GROUP BY Member_Account_Code
HAVING SUM(Sales_Amt)*0.00003858 > 3000 AND SUM(Sales_Amt)*0.00003858 <= 10000
)
UNION
SELECT
	'Others' AS Segmentation,
	COUNT(DISTINCT Member_Account_Code) AS 'Total no. of clients',
	ROUND(SUM(Sales_Amt)* 0.00003858,0) AS 'Total Sales',
	COUNT(DISTINCT Invoice) AS 'Total No.of Transactions',
	SUM(Sales_Qty) AS 'Total Items Sold',
	(
	SELECT
		COUNT(Invoice)
	FROM (
	SELECT
		Invoice
	FROM
		[Test-Assesment]
	WHERE Member_Account_Code IN (
	SELECT
		Member_Account_Code
	FROM
		[Test-Assesment]
	GROUP BY Member_Account_Code
	HAVING SUM(Sales_Amt)*0.00003858 <= 3000	
	)
	GROUP BY Invoice
	HAVING SUM(Sales_Amt) > 1
	) AS t2
	) AS trans_2_items,
	ROUND(SUM(Sales_Amt) * 0.00003858 / COUNT(DISTINCT Invoice),0) AS ATV, -- Average Transaction Value
	ROUND(SUM(Sales_Qty) / COUNT(DISTINCT Invoice),2) AS UPT -- Unit per transaction
FROM
	[Test-Assesment]
WHERE Member_Account_Code IN (
SELECT
	Member_Account_Code
FROM
	[Test-Assesment]
GROUP BY Member_Account_Code
HAVING  SUM(Sales_Amt)*0.00003858 <= 3000
)
)
SELECT * FROM segments_complete ORDER BY Segmentation DESC;




-- Task 2: 
-- 2.1. List top 10 Member Account 
-- By Sales Quantity 
SELECT TOP 10
	Member_Account_Code,
	SUM(Sales_Qty) AS 'Sales Quantity',
	ROUND(SUM(Sales_Amt)*0.00003858,0) AS 'Sales Amount'
FROM
	[Test-Assesment]
GROUP BY Member_Account_Code
ORDER BY 'Sales Quantity' DESC;


-- By Sales Amount
SELECT TOP 10
	Member_Account_Code,
	SUM(Sales_Qty) AS 'Sales Quantity',
	ROUND(SUM(Sales_Amt)*0.00003858,0) AS 'Sales Amount'
FROM
	[Test-Assesment]
GROUP BY Member_Account_Code
ORDER BY 'Sales Amount' DESC;

-- 2.2. List top 10 Items by Sales Quantity & Sales Amount
SELECT TOP 10
	Item_Name,
	SUM(Sales_Qty) AS 'Sales Quantity',
	ROUND(SUM(Sales_Amt)*0.00003858,0) AS 'Sales Amount'
FROM
	[Test-Assesment]
GROUP BY Item_Name
ORDER BY 'Sales Quantity' DESC;

SELECT TOP 10
	Item_Name,
	SUM(Sales_Qty) AS 'Sales Quantity',
	ROUND(SUM(Sales_Amt)*0.00003858,0) AS 'Sales Amount'
FROM
	[Test-Assesment]
GROUP BY Item_Name
ORDER BY 'Sales Amount' DESC;
