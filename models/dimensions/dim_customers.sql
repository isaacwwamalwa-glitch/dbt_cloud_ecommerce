{{ config(materialized='table') }}

select
  c.customer_id,
  c.first_name,
  c.last_name,
  c.country,
  c.city,
  c.signup_channel,
  c.signup_date,
  min(o.order_date) as first_order_date,
  count(distinct o.order_id) as total_orders,
  ROUND(sum(o.order_total_amount),2) as lifetime_value
from {{ ref('stg_customers') }} c
left join {{ ref('stg_orders') }} o
  on c.customer_id = o.customer_id
  and o.order_status = 'completed'
group by 1,2,3,4,5,6,7

