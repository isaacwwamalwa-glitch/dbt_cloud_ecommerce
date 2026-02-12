{{ config(materialized='table') }}

select
  first_name,
  last_name,
  customer_id,
  signup_channel,
  country,
  signup_date,
  first_order_date,

  case
    when signup_date is not null and first_order_date is not null
      then least(signup_date, first_order_date)
    when signup_date is not null
      then signup_date
    when first_order_date is not null
      then first_order_date
    else null
  end as customer_start_date,

  case
    when first_order_date is not null
         and (
           signup_date is not null
           or first_order_date is not null
         )
      then date_diff(
        first_order_date,
        case
          when signup_date is not null and first_order_date is not null
            then least(signup_date, first_order_date)
          when signup_date is not null
            then signup_date
          else first_order_date
        end,
        day
      )
    else null
  end as days_to_first_order,

  total_orders,
  lifetime_value
from {{ ref('dim_customers') }}

