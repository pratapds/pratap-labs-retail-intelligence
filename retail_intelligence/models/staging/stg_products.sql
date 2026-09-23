with source_data as (

    select *
    from {{ source('retail_raw', 'products') }}

)

select *
from source_data
