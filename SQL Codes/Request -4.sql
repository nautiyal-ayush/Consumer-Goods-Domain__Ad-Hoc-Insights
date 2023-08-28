-- Which segment had the most increase in unique products in 2021 vs 2020? 
-- The final output contains these fields,
-- segment product_count_2020 product_count_2021 difference

WITH cte1 AS
(
SELECT 
		segment, 
		count(distinct product_code) AS product_count_2020 
FROM	fact_gross_price
JOIN	dim_product
USING	(product_code)
WHERE	fiscal_year='2020' 
GROUP BY	segment,fiscal_year
),
cte2 as 
(
SELECT 
		segment, 
		count(distinct product_code) AS product_count_2021
FROM	fact_gross_price
JOIN	dim_product
USING	(product_code)
WHERE	fiscal_year='2021' 
GROUP BY	segment,fiscal_year
)

SELECT
	cte1.segment,
	product_count_2020,
	product_count_2021,	
	(product_count_2021-product_count_2020) AS difference
FROM cte1
JOIN cte2
USING (segment)
ORDER BY difference DESC