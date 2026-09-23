with source_data as (

    select *
    from {{ source('retail_raw', 'returns') }}

)

select *
from source_data
