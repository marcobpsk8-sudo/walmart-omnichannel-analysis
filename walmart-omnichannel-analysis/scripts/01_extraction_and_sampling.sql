
-- Extracción de muestra representativa de la operación omnicanal (Valle de México)
SELECT 
    order_id,
    order_date,
    store_id,
    MD5(CAST(customer_id AS STRING)) AS customer_id_anonymized, -- Anonimización por LFPDPPP
    product_category,
    promised_delivery_time,
    actual_delivery_time,
    order_status,
    cancellation_reason,
    picker_time_minutes,
    order_value_mxn
FROM 
    `walmart-mx-bi.omnichannel.orders_tx_2026`
WHERE 
    region_mx = 'Valle de México'
    AND product_category = 'Abarrotes y Perecederos'
    AND order_date BETWEEN '2026-01-01' AND '2026-03-31'
    AND RAND() <= 0.05; -- Muestra aleatoria del 5% 
