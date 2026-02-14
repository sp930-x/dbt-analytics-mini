select
  cast(invoice_id as integer) as invoice_id,
  cast(customer_id as integer) as customer_id,
  cast(product_id as integer) as product_id,
  cast(amount_usd as double) as amount_usd,
  currency,
  cast(invoice_date as date) as invoice_date,
  lower(status) as status
from {{ source('raw', 'invoices') }}
