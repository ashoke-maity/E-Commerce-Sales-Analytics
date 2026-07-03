-- finding nulls and duplicate values of each table

--clean_products
select * from clean_products;

-- finding duplicates
select product_id, COUNT(*)
from clean_products group by product_id
having COUNT(*) > 1;

--comparing values of the duplicate entries
select * from staging.clean_products where product_id = 'zoQWl4tXSOlT';

--showing the rows that are duplicated and will be removed.
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY product_id) AS rn
    FROM staging.clean_products
) t
WHERE rn > 1;

-- deleting the duplicates
DELETE FROM staging.clean_products
WHERE ctid IN (
    SELECT ctid
    FROM (
        SELECT ctid,
               ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY product_id) AS rn
        FROM staging.clean_products
    ) t
    WHERE rn > 1
);

--verify if the duplicate columns exists or not
SELECT product_id,
       COUNT(*)
FROM staging.clean_products
GROUP BY product_id
HAVING COUNT(*) > 1;


-- finding null values
select * from staging.clean_orders;

UPDATE staging.clean_orders
SET order_approved_at = NULL
WHERE TRIM(order_approved_at) = '';

-- updating all the hidden string '' to null if exist
UPDATE staging.clean_orders 
SET order_delivered_timestamp = NULL 
WHERE order_delivered_timestamp = '';

select * from staging.clean_orders;

-- searching for the duplicates order_id inside the orderitems table
SELECT order_id, product_id,
       COUNT(*)
FROM staging.clean_orderitems
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;
