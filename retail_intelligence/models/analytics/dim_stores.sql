{{ config(materialized='table', schema='ANALYTICS') }}

select *
from {{ ref('stg_stores') }}
