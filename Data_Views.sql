CREATE OR ALTER VIEW vw_customers_cleaned AS
SELECT
    customer_id,
    customer_unique_id,
    UPPER(LEFT(TRIM(customer_city), 1)) +
        LOWER(SUBSTRING(TRIM(customer_city), 2, LEN(TRIM(customer_city)))) AS customer_city,
    UPPER(LEFT(TRIM(customer_state), 1)) +
        LOWER(SUBSTRING(TRIM(customer_state), 2, LEN(TRIM(customer_state)))) AS customer_state,
    FORMAT(customer_zip_code_prefix, '00000') AS customer_zip_code_prefix
FROM olist_customers_dataset;
GO


CREATE OR ALTER VIEW vw_geolocation_cleaned AS
SELECT
    geolocation_zip_code_prefix,
    ISNULL(geolocation_lat, 0) AS geolocation_lat,
    ISNULL(geolocation_lng, 0) AS geolocation_lng,
    UPPER(LEFT(TRIM(geolocation_city), 1)) +
        LOWER(SUBSTRING(TRIM(geolocation_city), 2, LEN(TRIM(geolocation_city)))) AS geolocation_city,
    UPPER(LEFT(TRIM(geolocation_state), 1)) +
        LOWER(SUBSTRING(TRIM(geolocation_state), 2, LEN(TRIM(geolocation_state)))) AS geolocation_state
FROM olist_geolocation_dataset;
GO


CREATE OR ALTER VIEW vw_sellers_cleaned AS
SELECT
    seller_id,
    seller_zip_code_prefix,
    UPPER(LEFT(TRIM(seller_city), 1)) +
        LOWER(SUBSTRING(TRIM(seller_city), 2, LEN(TRIM(seller_city)))) AS seller_city,
    UPPER(LEFT(TRIM(seller_state), 1)) +
        LOWER(SUBSTRING(TRIM(seller_state), 2, LEN(TRIM(seller_state)))) AS seller_state
FROM olist_sellers_dataset;
GO


CREATE OR ALTER VIEW vw_products_cleaned AS
SELECT
    product_id,
    ISNULL(TRIM(product_category_name), 'Unknown') AS product_category_name,
    ISNULL(product_name_lenght, 0) AS product_name_lenght,
    ISNULL(product_description_lenght, 0) AS product_description_lenght,
    ISNULL(product_photos_qty, 0) AS product_photos_qty,
    ISNULL(product_weight_g, (SELECT AVG(product_weight_g) FROM olist_products_dataset WHERE product_weight_g IS NOT NULL)) AS product_weight_g,
    ISNULL(product_length_cm, (SELECT AVG(product_length_cm) FROM olist_products_dataset WHERE product_length_cm IS NOT NULL)) AS product_length_cm,
    ISNULL(product_height_cm, (SELECT AVG(product_height_cm) FROM olist_products_dataset WHERE product_height_cm IS NOT NULL)) AS product_height_cm,
    ISNULL(product_width_cm, (SELECT AVG(product_width_cm) FROM olist_products_dataset WHERE product_width_cm IS NOT NULL)) AS product_width_cm
FROM olist_products_dataset;
GO


CREATE OR ALTER VIEW vw_orders_cleaned AS
SELECT
    order_id,
    customer_id,
    TRIM(order_status) AS order_status,
    CONVERT(date, order_purchase_timestamp) AS order_purchase_date,
    CONVERT(date, order_approved_at) AS order_approved_date,
    CONVERT(date, order_delivered_carrier_date) AS order_carrier_date,
    CONVERT(date, order_delivered_customer_date) AS order_customer_date,
    CONVERT(date, order_estimated_delivery_date) AS order_estimated_delivery_date
FROM olist_orders_dataset;
GO


CREATE OR ALTER VIEW vw_order_items_cleaned AS
SELECT
    order_id,
    order_item_id,
    product_id,
    seller_id,
    CONVERT(date, shipping_limit_date) AS shipping_limit_date,
    ISNULL(price, (SELECT AVG(price) FROM olist_order_items_dataset WHERE price IS NOT NULL)) AS price,
    ISNULL(freight_value, (SELECT AVG(freight_value) FROM olist_order_items_dataset WHERE freight_value IS NOT NULL)) AS freight_value
FROM olist_order_items_dataset;
GO


CREATE OR ALTER VIEW vw_payments_cleaned AS
SELECT
    order_id,
    payment_sequential,
    TRIM(payment_type) AS payment_type,
    ISNULL(payment_installments, 0) AS payment_installments,
    ISNULL(payment_value, (SELECT AVG(payment_value) FROM olist_order_payments_dataset WHERE payment_value IS NOT NULL)) AS payment_value
FROM olist_order_payments_dataset;
GO


CREATE OR ALTER VIEW vw_reviews_cleaned AS
SELECT
    review_id,
    order_id,
    ISNULL(review_score, (SELECT AVG(review_score) FROM olist_order_reviews_dataset WHERE review_score IS NOT NULL)) AS review_score,
    ISNULL(TRIM(review_comment_title), 'No Comment') AS review_comment_title,
    ISNULL(TRIM(review_comment_message), 'No Comment') AS review_comment_message,
    CONVERT(date, review_creation_date) AS review_creation_date,
    CONVERT(date, review_answer_timestamp) AS review_answer_date
FROM olist_order_reviews_dataset;
GO


CREATE OR ALTER VIEW vw_category_translation_cleaned AS
SELECT
    ISNULL(TRIM(product_category_name), 'Unknown') AS product_category_name,
    ISNULL(TRIM(product_category_name_english), 'Unknown') AS product_category_name_english
FROM product_category_name_translation;
GO
