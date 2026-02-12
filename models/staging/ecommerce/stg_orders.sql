select
  order_id,
  customer_id,
  date(order_date) as order_date,
  order_status,
  order_total_amount,
  currency,
  payment_method
from {{ source('ecommerce', 'orders') }}
