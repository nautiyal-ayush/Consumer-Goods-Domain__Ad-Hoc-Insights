-- Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month.
-- This analysis helps to get an idea of low and
-- high-performing months and take strategic decisions.
-- The final report contains these columns:
-- Month  Year  Gross sales Amount


SELECT 
    s.month,
    s.fiscal_year,
    round(SUM(gross_price * sold_quantity)/1000000,2) AS gross_sales_amount_mln
FROM
    fact_sales_monthly s
JOIN
    fact_gross_price  USING (product_code)
JOIN
    dim_customer USING (customer_code)
WHERE
    customer = 'AtliQ Exclusive'
GROUP BY s.month , s.fiscal_year
ORDER BY s.fiscal_year