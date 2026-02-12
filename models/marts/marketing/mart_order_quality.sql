{{ config(materialized='table') }}

select
  order_status,
  count(distinct order_id) as orders,
  round(sum(order_total_amount),2) as revenue
from {{ ref('fct_orders') }}
group by 1
