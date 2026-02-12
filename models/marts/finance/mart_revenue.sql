{{ config(materialized='table') }}

select
  date_trunc(order_date,month) as order_month,
  country,
  payment_method,
  count(distinct order_id) as total_orders,
  ROUND(sum(order_total_amount),2) as revenue,
  ROUND(avg(order_total_amount),2) as aov
from {{ ref('fct_orders') }} o
join {{ ref('dim_customers') }} c
  on o.customer_id = c.customer_id
where {{ completed_orders() }}
group by 1,2,3
