/* using join */

SELECT 
    t.stock_code
FROM 
    price_today t
JOIN 
    price_tomorrow tm 
    ON t.stock_code = tm.stock_code
WHERE 
    tm.price > t.price
ORDER BY 
    t.stock_code COLLATE "C" ASC;

/* using subquery*/

SELECT DISTINCT
    stock_code
FROM 
    price_today t
WHERE 
    (SELECT price FROM price_tomorrow tm WHERE tm.stock_code = t.stock_code) > t.price
ORDER BY 
    stock_code ASC;
