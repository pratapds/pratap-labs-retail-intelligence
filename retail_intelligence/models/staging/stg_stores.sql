with source_data as (

    select *
    from {{ source('retail_raw', 'stores') }}

)

select *
from source_data
