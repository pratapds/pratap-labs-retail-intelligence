{{ config(
    materialized='table',
    schema='ANALYTICS'
) }}

select
    product_id,
    count(distinct order_id) as order_count,
    sum(quantity) as units_sold,
    round(sum(recognized_revenue), 2) as total_revenue,
    round(sum(recognized_profit), 2) as total_gross_profit,
    round(
        100 * sum(recognized_profit)
        / nullif(sum(recognized_revenue), 0),
        2
    ) as gross_margin_percent,
    round(
        sum(recognized_revenue)
        / nullif(sum(quantity), 0),
        2
    ) as average_revenue_per_unit
from {{ ref('fct_sales') }}
group by product_id