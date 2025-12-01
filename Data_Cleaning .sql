
--Select top 10 column from every table to understand the data

SELECT TOP 10 * FROM olist_customers_dataset

SELECT TOP 10 * FROM olist_geolocation_dataset

SELECT TOP 10 * FROM olist_order_items_dataset

SELECT TOP 10 * FROM olist_order_payments_dataset

SELECT TOP 10 * FROM olist_order_reviews_dataset

SELECT TOP 10 * FROM olist_orders_dataset

SELECT TOP 10 * FROM olist_products_dataset

SELECT TOP 10 * FROM olist_sellers_dataset

-- Check NULL values in olist_customers_dataset
SELECT
  SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
  SUM(CASE WHEN customer_unique_id IS NULL THEN 1 ELSE 0 END) AS null_customer_unique_id,
  SUM(CASE WHEN customer_zip_code_prefix IS NULL THEN 1 ELSE 0 END) AS null_zip_prefix,
  SUM(CASE WHEN customer_city IS NULL THEN 1 ELSE 0 END) AS null_city,
  SUM(CASE WHEN customer_state IS NULL THEN 1 ELSE 0 END) AS null_state
FROM olist_customers_dataset;



-- Check NULL values in olist_geolocation_dataset
SELECT
  SUM(CASE WHEN geolocation_zip_code_prefix IS NULL THEN 1 ELSE 0 END) AS null_zip_prefix,
  SUM(CASE WHEN geolocation_lat IS NULL THEN 1 ELSE 0 END) AS null_lat,
  SUM(CASE WHEN geolocation_lng IS NULL THEN 1 ELSE 0 END) AS null_lng,
  SUM(CASE WHEN geolocation_city IS NULL THEN 1 ELSE 0 END) AS null_city,
  SUM(CASE WHEN geolocation_state IS NULL THEN 1 ELSE 0 END) AS null_state
FROM olist_geolocation_dataset;

-- Replace missing latitude and longitude with 0 (display only)
SELECT 
    ISNULL(geolocation_zip_code_prefix, 0) AS geolocation_zip_code_prefix,
    ISNULL(geolocation_lat, 0) AS geolocation_lat,
    ISNULL(geolocation_lng, 0) AS geolocation_lng,
    ISNULL(geolocation_city, 'Unknown') AS geolocation_city,
    ISNULL(geolocation_state, 'Unknown') AS geolocation_state
FROM olist_geolocation_dataset;



-- Check NULL values in olist_sellers_dataset
SELECT
  SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) AS null_seller_id,
  SUM(CASE WHEN seller_zip_code_prefix IS NULL THEN 1 ELSE 0 END) AS null_zip_prefix,
  SUM(CASE WHEN seller_city IS NULL THEN 1 ELSE 0 END) AS null_city,
  SUM(CASE WHEN seller_state IS NULL THEN 1 ELSE 0 END) AS null_state
FROM olist_sellers_dataset;



-- Check NULL values in olist_products_dataset
SELECT
  SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS null_product_id,
  SUM(CASE WHEN product_category_name IS NULL THEN 1 ELSE 0 END) AS null_category,
  SUM(CASE WHEN product_name_lenght IS NULL THEN 1 ELSE 0 END) AS null_name_length,
  SUM(CASE WHEN product_description_lenght IS NULL THEN 1 ELSE 0 END) AS null_description_length,
  SUM(CASE WHEN product_photos_qty IS NULL THEN 1 ELSE 0 END) AS null_photos_qty,
  SUM(CASE WHEN product_weight_g IS NULL THEN 1 ELSE 0 END) AS null_weight,
  SUM(CASE WHEN product_length_cm IS NULL THEN 1 ELSE 0 END) AS null_length,
  SUM(CASE WHEN product_height_cm IS NULL THEN 1 ELSE 0 END) AS null_height,
  SUM(CASE WHEN product_width_cm IS NULL THEN 1 ELSE 0 END) AS null_width
FROM olist_products_dataset;

-- Replace missing values (display only)
SELECT
    ISNULL(product_category_name, 'Unknown') AS product_category_name,
    ISNULL(product_name_lenght, 0) AS product_name_lenght,
    ISNULL(product_description_lenght, 0) AS product_description_lenght,
    ISNULL(product_photos_qty, 0) AS product_photos_qty,
    ISNULL(product_weight_g, 0) AS product_weight_g,
    ISNULL(product_length_cm, 0) AS product_length_cm,
    ISNULL(product_height_cm, 0) AS product_height_cm,
    ISNULL(product_width_cm, 0) AS product_width_cm
FROM olist_products_dataset;



-- Check NULL values in olist_orders_dataset
SELECT
  SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
  SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
  SUM(CASE WHEN order_status IS NULL THEN 1 ELSE 0 END) AS null_order_status,
  SUM(CASE WHEN order_purchase_timestamp IS NULL THEN 1 ELSE 0 END) AS null_purchase_time,
  SUM(CASE WHEN order_approved_at IS NULL THEN 1 ELSE 0 END) AS null_approved_time,
  SUM(CASE WHEN order_delivered_carrier_date IS NULL THEN 1 ELSE 0 END) AS null_carrier_date,
  SUM(CASE WHEN order_delivered_customer_date IS NULL THEN 1 ELSE 0 END) AS null_customer_date,
  SUM(CASE WHEN order_estimated_delivery_date IS NULL THEN 1 ELSE 0 END) AS null_estimated_delivery
FROM olist_orders_dataset;



-- Check NULL values in olist_order_items_dataset
SELECT
  SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
  SUM(CASE WHEN order_item_id IS NULL THEN 1 ELSE 0 END) AS null_item_id,
  SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS null_product_id,
  SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) AS null_seller_id,
  SUM(CASE WHEN shipping_limit_date IS NULL THEN 1 ELSE 0 END) AS null_shipping_limit,
  SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS null_price,
  SUM(CASE WHEN freight_value IS NULL THEN 1 ELSE 0 END) AS null_freight
FROM olist_order_items_dataset;



-- Check NULL values in olist_order_payments_dataset
SELECT
  SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
  SUM(CASE WHEN payment_sequential IS NULL THEN 1 ELSE 0 END) AS null_payment_seq,
  SUM(CASE WHEN payment_type IS NULL THEN 1 ELSE 0 END) AS null_payment_type,
  SUM(CASE WHEN payment_installments IS NULL THEN 1 ELSE 0 END) AS null_installments,
  SUM(CASE WHEN payment_value IS NULL THEN 1 ELSE 0 END) AS null_payment_value
FROM olist_order_payments_dataset;



-- Check NULL values in olist_order_reviews_dataset
SELECT
  SUM(CASE WHEN review_id IS NULL THEN 1 ELSE 0 END) AS null_review_id,
  SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
  SUM(CASE WHEN review_score IS NULL THEN 1 ELSE 0 END) AS null_review_score,
  SUM(CASE WHEN review_comment_title IS NULL THEN 1 ELSE 0 END) AS null_comment_title,
  SUM(CASE WHEN review_comment_message IS NULL THEN 1 ELSE 0 END) AS null_comment_message,
  SUM(CASE WHEN review_creation_date IS NULL THEN 1 ELSE 0 END) AS null_creation_date,
  SUM(CASE WHEN review_answer_timestamp IS NULL THEN 1 ELSE 0 END) AS null_answer_time
FROM olist_order_reviews_dataset;

-- Replace missing comments with 'No Comment' (display only)
SELECT
    ISNULL(review_comment_title, 'No Comment') AS review_comment_title,
    ISNULL(review_comment_message, 'No Comment') AS review_comment_message,
    review_score,
    review_creation_date,
    review_answer_timestamp
FROM olist_order_reviews_dataset;



-- Check NULL values in product_category_name_translation
SELECT
  SUM(CASE WHEN product_category_name IS NULL THEN 1 ELSE 0 END) AS null_category_name,
  SUM(CASE WHEN product_category_name_english IS NULL THEN 1 ELSE 0 END) AS null_category_english
FROM product_category_name_translation;



-- REMOVE EXTRA SPACES FROM TEXT COLUMNS 


-- 1️ CUSTOMERS
SELECT
    TRIM(customer_unique_id) AS customer_unique_id,
    TRIM(customer_city) AS customer_city,
    TRIM(customer_state) AS customer_state
FROM olist_customers_dataset;

-- 2️ GEOLOCATION
SELECT
    TRIM(geolocation_city) AS geolocation_city,
    TRIM(geolocation_state) AS geolocation_state
FROM olist_geolocation_dataset;

-- 3️ SELLERS
SELECT
    TRIM(seller_city) AS seller_city,
    TRIM(seller_state) AS seller_state
FROM olist_sellers_dataset;

-- 4️ PRODUCTS
SELECT
    TRIM(product_category_name) AS product_category_name
FROM olist_products_dataset;

-- 5️ ORDERS
SELECT
    TRIM(order_status) AS order_status
FROM olist_orders_dataset;


-- 6️ ORDER ITEMS (no text columns to trim, all numeric or IDs)


-- 7️ ORDER PAYMENTS
SELECT
    TRIM(payment_type) AS payment_type
FROM olist_order_payments_dataset;

-- 8️ ORDER REVIEWS
SELECT
    TRIM(review_comment_title) AS review_comment_title,
    TRIM(review_comment_message) AS review_comment_message
FROM olist_order_reviews_dataset;

-- 9️ PRODUCT CATEGORY NAME TRANSLATION
SELECT
    TRIM(product_category_name) AS product_category_name,
    TRIM(product_category_name_english) AS product_category_name_english
FROM product_category_name_translation;


-- Standardize all date formats in olist_orders_dataset (display only)
SELECT 
    CONVERT(date, order_purchase_timestamp) AS order_purchase_date,
    CONVERT(date, order_approved_at) AS order_approved_date,
    CONVERT(date, order_delivered_carrier_date) AS order_carrier_date,
    CONVERT(date, order_delivered_customer_date) AS order_customer_date,
    CONVERT(date, order_estimated_delivery_date) AS order_estimated_delivery_date
FROM olist_orders_dataset;




--  CHECK LENGTH OF ZIP CODE / CITY / STATE COLUMNS ONLY
-- Customers ZIP
SELECT 'olist_customers_dataset' AS TableName, customer_id AS RowID, 
       customer_zip_code_prefix AS zip_code,
       LEN(CAST(customer_zip_code_prefix AS VARCHAR(10))) AS zip_length
FROM olist_customers_dataset
WHERE LEN(CAST(customer_zip_code_prefix AS VARCHAR(10))) NOT BETWEEN 4 AND 8;

-- Sellers ZIP
SELECT 'olist_sellers_dataset' AS TableName, seller_id AS RowID, 
       seller_zip_code_prefix AS zip_code,
       LEN(CAST(seller_zip_code_prefix AS VARCHAR(10))) AS zip_length
FROM olist_sellers_dataset
WHERE LEN(CAST(seller_zip_code_prefix AS VARCHAR(10))) NOT BETWEEN 4 AND 8;

-- Geolocation ZIP
SELECT 'olist_geolocation_dataset' AS TableName, geolocation_zip_code_prefix AS RowID, 
       geolocation_zip_code_prefix AS zip_code,
       LEN(CAST(geolocation_zip_code_prefix AS VARCHAR(10))) AS zip_length
FROM olist_geolocation_dataset
WHERE LEN(CAST(geolocation_zip_code_prefix AS VARCHAR(10))) NOT BETWEEN 4 AND 8;





