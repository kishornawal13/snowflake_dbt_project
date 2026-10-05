with parent as
(
select 
productid as prod_id
from
{{ref('bronze_products')}}
),
child as (
select productid as product_id from {{ref('bronze_orderitems')}}
)
select * from 
child 
where product_id in (select prod_id from parent)