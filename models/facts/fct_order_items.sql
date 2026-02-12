{{ config(materialized='table') }}

select
  oi.order_item_id,
  oi.order_id,
  oi.product_id,
  oi.quantity,
  oi.line_total
from {{ ref('stg_order_items') }} oi
