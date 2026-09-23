{{ config(
    materialized='table',
    schema='ANALYTICS'
) }}

with order_sales as (

    select
        order_id,
        sum(quantity) as units_sold,
        sum(recognized_revenue) as revenue,
        sum(recognized_profit) as gross_profit
    from {{ ref('fct_sales') }}
    group by order_id

),

store_performance as (

    select
        orders.store_id,
        count(distinct orders.order_id) as order_count,
        coalesce(sum(order_sales.units_sold), 0) as units_sold,
        round(coalesce(sum(order_sales.revenue), 0), 2) as total_revenue,
        round(coalesce(sum(order_sales.gross_profit), 0), 2) as total_gross_profit,
        round(
            100 * coalesce(sum(order_sales.gross_profit), 0)
            / nullif(coalesce(sum(order_sales.revenue), 0), 0),
            2
        ) as gross_margin_percent,
        round(
            coalesce(sum(order_sales.revenue), 0)
            / nullif(count(distinct orders.order_id), 0),
            2
        ) as revenue_per_order
    from {{ ref('fct_orders') }} as orders
    left join order_sales
        on orders.order_id = order_sales.order_id
    group by orders.store_id

)

select *
from store_performance