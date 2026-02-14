select
  i.invoice_id,
  i.invoice_date,
  i.customer_id,
  i.product_id,
  i.amount_usd,
  {{ normalize_currency('i.currency') }} as currency_group,
  i.currency,
  i.status
from {{ ref('stg_invoices') }} i
