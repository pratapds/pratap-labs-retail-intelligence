with source_data as (

    select *
    from {{ source('retail_raw', 'inventory_snapshots') }}

)

select *
from source_data
