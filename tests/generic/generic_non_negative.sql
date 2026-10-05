{% test generic_non_negative(model, column_name, field, to) %}

with parent as
(
select 
{{ field }} as prod_id
from
{{ to }}
),
child as (
select {{column_name}} as product_id from {{ model }} 
)
select * from 
child 
where product_id not in (select prod_id from parent)

{% endtest %}

