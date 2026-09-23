{{ config(
    materialized='table',
    schema='ANALYTICS'
) }}

with order_sales as (

    select
        order_id,
        sum(quantity) as units_purchased,
        sum(recognized_revenue) as revenue,
        sum(recognized_profit) as gross_profit
    from {{ ref('fct_sales') }}
    group by order_id

),

customer_value as (

    select
        orders.customer_id,
        count(distinct orders.order_id) as order_count,
        coalesce(sum(order_sales.units_purchased), 0) as units_purchased,
        round(coalesce(sum(order_sales.revenue), 0), 2) as lifetime_revenue,
        round(coalesce(sum(order_sales.gross_profit), 0), 2) as lifetime_gross_profit,
        round(
            coalesce(sum(order_sales.revenue), 0)
            / nullif(count(distinct orders.order_id), 0),
            2
        ) as average_order_value,
        case
            when coalesce(sum(order_sales.revenue), 0) >= 20000 then 'High Value'
            when coalesce(sum(order_sales.revenue), 0) >= 10000 then 'Medium Value'
            else 'Standard Value'
        end as customer_value_segment
    from {{ ref('fct_orders') }} as orders
    left join order_sales
        on orders.order_id = order_sales.order_id
    group by orders.customer_id

)

select *
from customer_value