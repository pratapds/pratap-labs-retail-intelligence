{{ config(
    materialized='table',
    schema='ANALYTICS'
) }}

select
    count(*) as sales_line_count,
    count(distinct order_id) as represented_orders,
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
        / nullif(count(distinct order_id), 0),
        2
    ) as revenue_per_order
from {{ ref('fct_sales') }}