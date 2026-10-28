
   PROJECT: Shipping & Logistics Performance Analysis
   TOOLS: MySQL / phpMyAdmin
   TABLES: orders, shipments



-- SECTION 1: TOTAL ORDERS

SELECT COUNT(*) AS total_orders
FROM orders;


-- SECTION 2: TOTAL SHIPMENTS

SELECT COUNT(*) AS total_shipments
FROM shipments;


-- SECTION 3: SHIPMENT DATA COMPLETENESS
-- Check the presence and uniqueness of shipment records.

SELECT
    COUNT(*) AS total_records,
    COUNT(shipment_id) AS shipment_ids,
    COUNT(DISTINCT shipment_id) AS unique_shipment_ids,
    COUNT(order_id) AS order_ids,
    COUNT(shipment_date) AS shipment_dates,
    COUNT(delivery_status) AS delivery_statuses,
    COUNT(shipping_partner) AS shipping_partners
FROM shipments;


-- SECTION 4: SHIPMENTS WITHOUT A MATCHING ORDER

SELECT COUNT(*) AS unmatched_shipments
FROM shipments s
LEFT JOIN orders o
    ON s.order_id = o.order_id
WHERE o.order_id IS NULL;


-- SECTION 5: SHIPMENT STATUS DISTRIBUTION
-- Business question:
-- What is the distribution of shipment statuses?

SELECT
    delivery_status,
    COUNT(*) AS total_shipments
FROM shipments
GROUP BY delivery_status
ORDER BY total_shipments DESC;


-- SECTION 6: MONTHLY SHIPMENT VOLUME
-- Business question:
-- How does shipment volume change over time?

SELECT
    DATE_FORMAT(shipment_date, '%Y-%m') AS shipment_month,
    COUNT(*) AS total_shipments
FROM shipments
GROUP BY DATE_FORMAT(shipment_date, '%Y-%m')
ORDER BY shipment_month;


-- SECTION 7: SHIPMENT VOLUME BY SHIPPING PARTNER
-- Business question:
-- How many shipments does each partner handle?

SELECT
    shipping_partner,
    COUNT(*) AS total_shipments
FROM shipments
GROUP BY shipping_partner
ORDER BY total_shipments DESC;


-- SECTION 8: SHIPMENT STATUS BY SHIPPING PARTNER
-- Business question:
-- How does shipment status vary by shipping partner?

SELECT
    shipping_partner,
    delivery_status,
    COUNT(*) AS total_shipments
FROM shipments
GROUP BY
    shipping_partner,
    delivery_status
ORDER BY
    shipping_partner,
    delivery_status;




