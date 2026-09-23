with source_data as (

    select *
    from {{ source('retail_raw', 'customers') }}

)

select *
from source_data