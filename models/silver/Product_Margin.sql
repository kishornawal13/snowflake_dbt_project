With margin as (
    SELECT
        p.productid,
        p.name,
        p.category,
        p.retailprice,
        p.supplierprice,
        p.retailprice - p.supplierprice Margin_IN_price,
        round(
            (
                (p.retailprice - p.supplierprice) / p.retailprice
            ) * 100,
            2
        ) Margin_IN_Percentage,
        s.suppliername,
        s.state as Supplier_State,
        s.city,
        s.phone,
        s.email as Supplier_city
    FROM
        {{ref('bronze_products')}} P
        INNER JOIN {{ref('bronze_suppliers')}} S ON P.SUPPLIERID = S.SUPPLIERID
)
select
    *
from
    margin
where
    Margin_IN_Percentage >= 5