-- Get the Top 3 products in each division that have a high
-- total_sold_quantity in the fiscal_year 2021? 
-- The final output contains these fields,
-- division product_code  product  total_sold_quantity  rank_order


WITH top_products AS
(
SELECT
	division, product_code, product,
	SUM(sold_quantity) AS total_sold_quantity,
	RANK() OVER(PARTITION BY division ORDER BY sum(sold_quantity) DESC) AS rank_order
    
FROM dim_product
JOIN fact_sales_monthly
USING (product_code)
WHERE fiscal_year=2021
GROUP BY division, product_code, product
)

SELECT	 *
FROM top_products
WHERE rank_order <=3;
