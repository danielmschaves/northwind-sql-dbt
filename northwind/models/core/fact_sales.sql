{{ config(
    schema='gold',
    materialized='table'
) }}

with dim_order_details as (
    select *
    from {{ ref('dim_order_details') }}
),
dim_orders as (
    select *
    from {{ ref('dim_orders') }}
),
dim_product as (
    select *
    from {{ ref('dim_product') }}
),
dim_customers as (
    select *
    from {{ ref('dim_customers') }}
),

fact_sales as (
    select
        dord.order_id,
        dord.product_id,
        dord.unit_price as sale_unit_price,
        dord.quantity as quantity_sold,
        dord.discount as discount_given,
        dor.customer_id,
        dor.employee_id,
        dor.order_date,
        dor.required_date,
        dor.shipped_date,
        dor.freight,
        dor.ship_via as shipping_method,
        dp.product_name,
        dp.category_id,
        dc.company_name as customer_name,
        dc.contact_name as customer_contact_name,
        dc.city as customer_city,
        dc.country as customer_country
    from
        dim_order_details dord
    join
        dim_orders dor on dord.order_id = dor.order_id
    join
        dim_product dp on dord.product_id = dp.product_id
    join
        dim_customers dc on dor.customer_id = dc.customer_id
)

select * from fact_sales