with source_data as (

    select *
    from {{ source('retail_raw', 'promotions') }}

)

select *
from source_data
