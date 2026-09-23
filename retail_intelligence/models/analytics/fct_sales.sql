{{ config(
    materialized='table',
    schema='ANALYTICS'
) }}

with sales as (

    select *
    from {{ ref('stg_order_items') }}

)

select *
from sales