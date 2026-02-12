{{ config(materialized='view') }}

select
  customer_id,
  first_name,
  last_name,
  email,
  country,
  city,
  date(signup_date) as signup_date,
  signup_channel
from {{ source('ecommerce', 'customers') }}
