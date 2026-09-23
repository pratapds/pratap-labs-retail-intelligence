{{ config(
    materialized='table',
    schema='ANALYTICS'
) }}

select
    return_reason,
    count(distinct return_id) as returned_item_count,
    count(distinct order_id) as affected_order_count,
    round(sum(refund_amount), 2) as total_refund_amount,
    round(avg(refund_amount), 2) as average_refund_amount,
    round(avg(days_to_return), 2) as average_days_to_return
from {{ ref('fct_returns') }}
group by return_reason