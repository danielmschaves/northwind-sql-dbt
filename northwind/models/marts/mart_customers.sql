    {{ config(
    schema='gold',
    materialized='view'
) }}

select * from {{ref('stg_customers')}}