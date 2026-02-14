select
  cast(product_id as integer) as product_id,
  product_name,
  category
from {{ source('raw', 'products') }}
