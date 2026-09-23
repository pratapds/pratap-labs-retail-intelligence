{{ config(
    materialized='table',
    schema='ANALYTICS'
) }}

select
    snapshot_date,
    snapshot_month,
    store_id,
    product_id,
    quantity_on_hand,
    quantity_on_order,
    reorder_point,
    maximum_stock,
    inventory_value,
    stock_status,
    is_stockout,
    case
        when quantity_on_hand = 0 then 'Stockout'
        when quantity_on_hand <= reorder_point then 'Low Stock'
        else 'Healthy'
    end as inventory_risk_status,
    greatest(
        reorder_point - quantity_on_hand - quantity_on_order,
        0
    ) as additional_reorder_quantity
from {{ ref('fct_inventory') }}
where is_current_snapshot = true