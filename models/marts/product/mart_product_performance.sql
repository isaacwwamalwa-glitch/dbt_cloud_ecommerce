{{ config(materialized='table') }}

select
  p.category,
  p.brand,
  p.product_name,
  count(distinct oi.order_id) as orders,
  round(sum(oi.line_total),2) as revenue
from {{ ref('fct_order_items') }} oi
join {{ ref('dim_products') }} p
  on oi.product_id = p.product_id
group by 1,2,3

