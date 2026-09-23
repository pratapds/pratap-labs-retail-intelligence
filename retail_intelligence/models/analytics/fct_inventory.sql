{{ config(materialized='table', schema='ANALYTICS') }}

select *
from {{ ref('stg_inventory_snapshots') }}
