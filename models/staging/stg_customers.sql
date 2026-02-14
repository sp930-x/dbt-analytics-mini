select
  cast(customer_id as integer) as customer_id,
  customer_name,
  country,
  cast(created_at as date) as created_at
from {{ source('raw', 'customers') }}
