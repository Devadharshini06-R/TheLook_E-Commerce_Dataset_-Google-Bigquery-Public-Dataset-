SELECT
  o.order_id,
  o.user_id,
  u.gender,
  u.age,
  u.country,
  p.category AS product_category,
  p.brand AS product_brand,
  p.department AS product_department,
  p.retail_price,
  oi.sale_price,
  ROUND((p.retail_price - oi.sale_price), 2) AS discount_amount,
  ROUND(((p.retail_price - oi.sale_price)/p.retail_price)*100, 2) AS discount_percent,
  TIMESTAMP_DIFF(o.shipped_at, o.created_at, DAY) AS days_to_ship,
  TIMESTAMP_DIFF(o.delivered_at, o.shipped_at, DAY) AS shipping_duration,
  TIMESTAMP_DIFF(o.returned_at, o.delivered_at, DAY) AS days_to_return,
  CASE 
    WHEN o.returned_at IS NOT NULL THEN 1
    ELSE 0
  END AS is_returned,  
  o.status AS order_status,
  o.created_at AS order_date,
  EXTRACT(DAYOFWEEK FROM o.created_at) AS order_day_of_week,
  EXTRACT(MONTH FROM o.created_at) AS order_month,
  EXTRACT(YEAR FROM o.created_at) AS order_year
FROM
  `bigquery-public-data.thelook_ecommerce.orders` AS o
JOIN
  `bigquery-public-data.thelook_ecommerce.order_items` AS oi
ON
  o.order_id = oi.order_id
JOIN
  `bigquery-public-data.thelook_ecommerce.users` AS u
ON
  o.user_id = u.id
JOIN
  `bigquery-public-data.thelook_ecommerce.products` AS p
ON
  oi.product_id = p.id
WHERE
  o.status IN ('Complete', 'Returned') 
  AND u.age IS NOT NULL
  AND p.retail_price IS NOT NULL
LIMIT 10000; 