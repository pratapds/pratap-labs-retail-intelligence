with source_data as (

    select *
    from {{ source('retail_raw', 'orders') }}

)

select *
from source_data
