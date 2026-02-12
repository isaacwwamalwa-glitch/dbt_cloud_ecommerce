{{ config(materialized='table') }}

select
  format_date('%Y-%m', signup_date) as cohort_month,
  count(distinct customer_id) as customers,
  round(sum(lifetime_value),2) as cohort_ltv
from {{ ref('dim_customers') }}
group by 1
