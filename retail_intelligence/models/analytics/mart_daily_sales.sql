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

)

select
    cast(orders.order_date as date) as sales_date,
    year(orders.order_date) as sales_year,
    quarter(orders.order_date) as sales_quarter,
    month(orders.order_date) as sales_month,
    count(distinct orders.order_id) as order_count,
    coalesce(sum(order_sales.units_sold), 0) as units_sold,
    round(coalesce(sum(order_sales.revenue), 0), 2) as total_revenue,
    round(coalesce(sum(order_sales.gross_profit), 0), 2) as total_gross_profit,
    round(
        coalesce(sum(order_sales.revenue), 0)
        / nullif(count(distinct orders.order_id), 0),
        2
    ) as average_order_value
from {{ ref('fct_orders') }} as orders
left join order_sales
    on orders.order_id = order_sales.order_id
group by
    cast(orders.order_date as date),
    year(orders.order_date),
    quarter(orders.order_date),
    month(orders.order_date)