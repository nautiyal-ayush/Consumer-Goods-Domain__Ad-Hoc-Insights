-- Generate a report which contains the top 5 customers who received an
-- average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. 
-- The final output contains these fields,
-- customer_code  customer  average_discount_percentage

SELECT 
    customer_code,
    customer,
    pre_invoice_discount_pct AS average_discount_percentage
FROM
    fact_pre_invoice_deductions
JOIN
    dim_customer USING (customer_code)
WHERE
    fiscal_year = 2021 AND market = 'India'
ORDER BY average_discount_percentage DESC
LIMIT 5