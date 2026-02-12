{{ config(materialized='table') }}

select
  o.order_id,
  o.customer_id,
  o.order_date,
  o.order_status,
  o.order_total_amount,
  o.payment_method
from {{ ref('stg_orders') }} o
