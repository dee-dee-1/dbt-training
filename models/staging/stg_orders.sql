select 
--from raw orders
o.orderid,
o.orderdate,
o.shipdate,
o.ordersellingprice,
o.ordercostprice,
o.ordersellingprice - o.ordercostprice as orderprofit,
--from raw customer
c.customername,
c.segment,
c.country,
-- from raw product
p.category,
p.subcategory,
p.productname
from {{ ref('raw_orders') }} o 
left join {{ ref('raw_customer') }} c 
on o.customerid = c.customerid
left join {{ ref('raw_product') }} p
on o.productid = p.productid