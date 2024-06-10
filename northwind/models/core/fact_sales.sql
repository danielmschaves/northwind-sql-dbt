{{ config(
    schema='gold',
    materialized='table'
) }}

with fact_sales as (
    select
        dod.order_id as order_id,
        dod.product_id as product_id,
        dp.product_name as product_name,
        dp.supplier_id as supplier_id,
        dp.category_id as category_id,
        dod.unit_price as sale_unit_price,
        dod.quantity as quantity_sold,
        dod.discount as discount_given,
        do.customer_id as customer_id,
        dc.company_name as customer_name,
        do.employee_id as employee_id,
        do.order_date as order_date,
        do.required_date as required_date,
        do.shipped_date as shipped_date,
        do.freight as freight_cost,
        do.ship_via as shipping_method,
        dc.address as customer_address,
        dc.city as customer_city,
        dc.region as customer_region,
        dc.postal_code as customer_postal_code,
        dc.country as customer_country,
        dp.quantity_per_unit as product_quantity_per_unit,
        dp.unit_price as product_unit_price,
        dp.units_in_stock as units_in_stock,
        dp.units_on_order as units_on_order,
        dp.reorder_level as reorder_level,
        dp.discontinued as discontinued
    from
        dim_order_details dod
    join
        dim_orders do on dod.order_id = do.order_id
    join
        dim_products dp on dod.product_id = dp.product_id
    join
        dim_customers dc on do.customer_id = dc.customer_id
)
