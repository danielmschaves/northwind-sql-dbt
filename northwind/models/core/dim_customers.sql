{{ config(
    schema='gold',
    materialized='table'
) }}

with dim_customers as (
select
    customer_id,
    company_name,
    contact_name,
    contact_title,
    address,
    city,
    region,
    postal_code,
    country,
    phone,
    fax
from
    {{ ref('stg_customers') }}
)

select
    *
from
    dim_customers