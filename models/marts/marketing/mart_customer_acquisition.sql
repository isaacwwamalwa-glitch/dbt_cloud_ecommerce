{{ config(materialized='table') }}

select
  date_trunc(signup_date, month) as signup_month,
  country,
  city,
  signup_channel,
  count(distinct customer_id) as new_customers
from {{ ref('dim_customers') }}
group by 1,2,3,4
