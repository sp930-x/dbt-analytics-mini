{% macro normalize_currency(currency_col) -%}
case
  when {{ currency_col }} in ('EUR', 'USD', 'GBP') then {{ currency_col }}
  else 'OTHER'
end
{%- endmacro %}
