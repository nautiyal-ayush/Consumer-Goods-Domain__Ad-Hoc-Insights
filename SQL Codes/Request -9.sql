-- Which channel helped to bring more gross sales in the fiscal year 2021
-- and the percentage of contribution? The final output contains these fields,
-- channel  gross_sales_mln  percentage

WITH temp AS
(
SELECT 
    channel,
    ROUND(SUM(gross_price * sold_quantity) / 1000000,2) AS gross_sales_mln
FROM
    fact_sales_monthly s
JOIN
    fact_gross_price USING (product_code)
JOIN
    dim_customer USING (customer_code)
WHERE
    s.fiscal_year = 2021
GROUP BY channel
)

SELECT 
	channel,
    gross_sales_mln,
	round(gross_sales_mln/sum(gross_sales_mln) over()*100.0,2) AS percentage
FROM temp
ORDER BY percentage DESC