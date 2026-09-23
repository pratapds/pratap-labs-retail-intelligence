with source_data as (

    select *
    from {{ source('retail_raw', 'order_items') }}

)

select *
from source_data
