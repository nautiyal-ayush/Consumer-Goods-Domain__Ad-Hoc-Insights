-- What is the percentage of unique product increase in 2021 vs. 2020? 
-- The final output contains these fields,
-- unique_products_2020  unique_products_2021  percentage_chg

SELECT 
    unique_products_2020, 
    unique_products_2021,
    round(100.0*(unique_products_2021-unique_products_2020)/unique_products_2020,2) AS percentage_chg
    
FROM
    (SELECT COUNT(DISTINCT product_code) AS unique_products_2020 FROM fact_gross_price
    WHERE fiscal_year = 2020) AS A, 
    (SELECT COUNT(DISTINCT product_code) AS unique_products_2021 FROM fact_gross_price 
    WHERE fiscal_year = 2021) AS B


