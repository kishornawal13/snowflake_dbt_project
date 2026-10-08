select
    p.name,
    count(*) as orders_count
from
    {{ref('bronze_orderitems')}} o
    join {{ref('bronze_products')}} p on o.productid = p.productid
group by
    o.productid,
    p.name
order by
    orders_count desc