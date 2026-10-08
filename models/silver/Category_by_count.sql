with cat_count as(
    select
        p.category,
        count(*) as orders_count
    from
        {{ref('bronze_orderitems')}} o
        join {{ref('bronze_products')}} p on o.productid = p.productid
    group by
        p.category
    order by
        orders_count desc
)
select
    category,
    orders_count,
    case
        when orders_count > 200 then 'EXCELLENT'
        WHEN orders_count > 150 THEN 'GOOD'
        WHEN orders_count > 130 THEN 'AVERAGE'
        ELSE 'BELOW AVERAGE'
    END AS orders_sale_remarks
from
    cat_count