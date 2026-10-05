select * from
{{ref('bronze_orderitems')}} 
where quantity  <= 0  and unitprice < 0 