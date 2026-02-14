with paid as (
  select *
  from {{ ref('fct_invoices') }}
  where status = 'paid'
),
joined as (
  select
    p.invoice_date,
    c.country,
    p.amount_usd
  from paid p
  join {{ ref('dim_customers') }} c
    on p.customer_id = c.customer_id
)
select
  date_trunc('month', invoice_date) as month,
  country,
  sum(amount_usd) as revenue_usd,
  count(*) as paid_invoices
from joined
group by 1,2
order by 1,2
