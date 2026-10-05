Select
    c.customerid,
    c.firstname || ' ' || c.lastname as Customer_Name,
    c.email,
    c.phone,
    c.city,
    c.state as customer_state,
    o.status,
    s.storename,
    s.storeid,
    s.state as Stores_state
from
    {{ref('bronze_customers')}} c
    inner join {{ref('bronze_orders')}} o on c.customerid = o.customerid
    inner join {{ref('bronze_stores')}} s on o.storeid = s.storeid
where
    c.state = s.state