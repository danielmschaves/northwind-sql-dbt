{{ config(
    schema='gold',
    materialized='table'
) }}

with dim_product as (

select
    order_id,
    product_id,
    unit_price,
    quantity,
    discount
from
    {{ ref('stg_order_details') }}
)
